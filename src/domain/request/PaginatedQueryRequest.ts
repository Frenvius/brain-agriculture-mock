export interface Order {
	[key: string]: string;
}

export class PaginatedQueryRequest<T> {
	pageSize: number = 10;
	pageNumber: number = 0;
	query?: T;
	orderBy?: Order[];

	constructor(query?: T) {
		this.pageSize = 10;
		this.pageNumber = 0;
		this.query = query;
		this.orderBy = [];
	}
}
