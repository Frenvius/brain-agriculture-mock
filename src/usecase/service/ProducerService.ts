import { FarmService } from './FarmService';
import { AbstractService } from './AbstractService';
import { ProducerConverter } from '../converter/ProducerConverter';
import { ProducerEntity } from '../../domain/entity/ProducerEntity';
import { ProducerRequest } from '../../domain/request/ProducerRequest';
import { ProducerResponse } from '../../domain/response/ProducerResponse';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { ProducerRepository } from '../../adapter/repository/ProducerRepository';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';

export class ProducerService extends AbstractService<ProducerRequest, ProducerResponse, ProducerEntity> {
	public static instance = new ProducerService();
	public _farmService = FarmService.instance;

	constructor() {
		super(ProducerConverter.instance, ProducerRepository.instance);
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
