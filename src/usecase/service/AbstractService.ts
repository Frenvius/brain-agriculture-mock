import { AbstractConverter } from '../converter/AbstractConverter';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { AbstractRepository } from '../../adapter/repository/AbstractRepository';
import { AbstractUpdateRequest } from '../../domain/request/AbstractUpdateRequest';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';

export abstract class AbstractService<Request extends AbstractUpdateRequest, Response, Entity> {
	protected constructor(
		protected converter: AbstractConverter<Entity, Request, Response>,
		protected repository: AbstractRepository<Entity, Request>
	) {
		this.converter = converter;
		this.repository = repository;
	}

	public async create(request: Request): Promise<Response> {
		const entity = this.converter.toEntity(request);
		return this.converter.toResponse(await this.repository.create(entity));
	}

	public async update(request: Request): Promise<Response> {
		return this.converter.toResponse(await this.repository.update(request));
	}

	public async search(request: PaginatedQueryRequest<Request>): Promise<PaginatedResponse<Response>> {
		const entities = await this.repository.search(request);
		const responses = entities.map((it) => this.converter.toResponse(it));
		const entityCount = await this.repository.count(request.query);

		return {
			items: responses,
			totalPages: Math.ceil(entityCount / request.pageSize),
			totalItems: entityCount,
			currentPage: request.pageNumber
		};
	}

	public async get(id: string): Promise<Response> {
		return this.converter.toResponse(await this.repository.get(id));
	}

	public async delete(id: string): Promise<void> {
		return this.repository.delete(id);
	}
}
