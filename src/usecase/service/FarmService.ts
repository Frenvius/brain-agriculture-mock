import { CropService } from './CropService';
import { AbstractService } from './AbstractService';
import { FarmConverter } from '../converter/FarmConverter';
import { FarmEntity } from '../../domain/entity/FarmEntity';
import { FarmRequest } from '../../domain/request/FarmRequest';
import { FarmResponse } from '../../domain/response/FarmResponse';
import { FarmRepository } from '../../adapter/repository/FarmRepository';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';

export class FarmService extends AbstractService<FarmRequest, FarmResponse, FarmEntity> {
	public static instance = new FarmService();
	public _cropService = CropService.instance;

	constructor() {
		super(FarmConverter.instance, FarmRepository.instance);
	}

	public async search(request: PaginatedQueryRequest<FarmRequest>): Promise<PaginatedResponse<FarmResponse>> {
		const entities = await this.repository.search(request);
		const responses = await Promise.all(entities.map(async (farm) => await this.getFarmData(farm)));
		const entityCount = await this.repository.count(request.query);

		return {
			items: responses,
			totalPages: Math.ceil(entityCount / request.pageSize),
			totalItems: entityCount,
			currentPage: request.pageNumber
		};
	}

	public async getFarmData(data: FarmRequest | FarmEntity): Promise<FarmResponse> {
		const farmId = data.id;
		data.plantedCrops = await this._cropService.getByFarmId(farmId!);
		return this.converter.toResponse(data);
	}
}
