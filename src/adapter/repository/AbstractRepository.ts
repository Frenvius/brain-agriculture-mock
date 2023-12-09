import { DatabaseTable, getClientForTable } from './DatabaseTable';
import { AbstractUpdateRequest } from '../../domain/request/AbstractUpdateRequest';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';
import { PaginatedDatabaseQuery } from '../../domain/request/PaginatedDatabaseQuery';

export abstract class AbstractRepository<Entity, Request extends AbstractUpdateRequest> {
	protected client: any;
	protected joins: any;

	constructor(tableName: DatabaseTable) {
		this.client = getClientForTable(tableName);
	}

	protected abstract getFilters(query: Request): any[];
	protected getOrdination(query: PaginatedQueryRequest<Request>): any {
		const result: any = {};

		if (query.order) result.order = query.order;
		if (query.orderBy) result.orderBy = query.orderBy;

		return result;
	}

	public async create(entity: Entity): Promise<Entity> {
		return this.client.create({ data: entity, ...this.joins });
	}

	public async update(request: Request): Promise<Entity> {
		const query = { where: { id: request.id } };

		return this.client.update({
			...query,
			data: { ...request, updatedAt: new Date() },
			...this.joins
		});
	}

	public async search(request: PaginatedQueryRequest<Request>): Promise<Entity[]> {
		const query = new PaginatedDatabaseQuery(request);
		if (request.query) query.where = { OR: this.getFilters(request.query) };
		const ordination = this.getOrdination(request);

		// const data = { ...query, ...ordination, ...this.joins };

		// return (await findMany(data, this.client.name)) as unknown as Promise<Entity[]>;

		return this.client.findMany({
			...query,
			...this.joins
		});
	}

	public async get(id: string): Promise<Entity> {
		const query = { where: { id: Number(id) }, ...this.joins };
		return this.client.findUniqueOrThrow(query);
	}

	public async delete(id: string): Promise<void> {
		const query = { where: { id: Number(id) } };
		await this.client.delete(query);
	}

	public async count(query?: Request) {
		let countQuery;
		if (query) countQuery = { where: { OR: this.getFilters(query) } };
		return this.client.count(countQuery);
	}
}