export class PaginatedQueryRequest<T> {
	pageSize: number = 10;
	pageNumber: number = 0;
	query?: T;
	order?: string;
	orderBy?: string;

	constructor(query?: T) {
		this.pageSize = 10;
		this.pageNumber = 0;
		this.query = query;
		this.order = 'DESC';
		this.orderBy = '';
	}
}
