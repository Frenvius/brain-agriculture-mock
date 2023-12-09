import { PaginatedQueryRequest } from './PaginatedQueryRequest';

export class PaginatedDatabaseQuery {
	take?: number;
	skip: number;
	where: any;

	constructor(paginatedQuery: PaginatedQueryRequest<any>) {
		this.skip = paginatedQuery.pageSize * paginatedQuery.pageNumber;
		if (paginatedQuery.pageSize !== -1) this.take = paginatedQuery.pageSize;
	}
}
