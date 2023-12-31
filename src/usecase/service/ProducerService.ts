import { FarmService } from './FarmService';
import { CropService } from './CropService';
import { AbstractService } from './AbstractService';
import { ProducerConverter } from '../converter/ProducerConverter';
import { ProducerEntity } from '../../domain/entity/ProducerEntity';
import { ProducerRequest } from '../../domain/request/ProducerRequest';
import { FarmRepository } from '../../adapter/repository/FarmRepository';
import { ProducerResponse } from '../../domain/response/ProducerResponse';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { ProducerRepository } from '../../adapter/repository/ProducerRepository';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';

export class ProducerService extends AbstractService<ProducerRequest, ProducerResponse, ProducerEntity> {
	public static instance = new ProducerService();
	public _farmService = FarmService.instance;
	public _farmRepository = FarmRepository.instance;
	public _cropService = CropService.instance;

	constructor() {
		super(ProducerConverter.instance, ProducerRepository.instance);
	}

	public async get(id: string): Promise<ProducerResponse> {
		const producer = await this.repository.get(id);
		producer.farm = await this._farmService.getFarmData(producer.farm!);
		return this.converter.toResponse(producer);
	}

	public async create(request: ProducerRequest): Promise<ProducerResponse> {
		const { name, taxDocument } = request;
		const { plantedCrops, ...farmData } = request.farmData!;

		const producer = await this.repository.create({ name, taxDocument });
		const farm = await this._farmRepository.create({ ...farmData, producerId: producer.id! });

		for (const crop of plantedCrops!) {
			await this._cropService.addCropRelation(crop.id!, farm.id!);
		}

		producer.farm = await this._farmService.getFarmData(farm);

		return this.converter.toResponse(producer);
	}

	public async update(request: ProducerRequest): Promise<ProducerResponse> {
		const { id, name, taxDocument } = request;
		const { plantedCrops, ...farm } = request.farmData!;

		const producer = await this.repository.update({ id, name, taxDocument });
		const updatedFarm = await this._farmRepository.update({ ...farm, producerId: producer.id! });

		await this._cropService.removeCropRelation(updatedFarm.id!);
		for (const crop of plantedCrops!) {
			await this._cropService.addCropRelation(crop.id!, farm.id!);
		}

		producer.farm = await this._farmService.getFarmData(updatedFarm);

		return this.converter.toResponse(producer);
	}

	public async search(request: PaginatedQueryRequest<ProducerRequest>): Promise<PaginatedResponse<ProducerResponse>> {
		const entities = await this.repository.search(request);
		const responses = await Promise.all(
			entities.map(async (producer) => {
				producer.farm = await this._farmService.getFarmData(producer.farm!);
				return this.converter.toResponse(producer);
			})
		);
		const entityCount = await this.repository.count(request.query);

		return {
			items: responses,
			totalPages: Math.ceil(entityCount / request.pageSize),
			totalItems: entityCount,
			currentPage: request.pageNumber
		};
	}
}
