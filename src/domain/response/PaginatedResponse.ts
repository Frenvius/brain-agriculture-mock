export interface PaginatedResponse<T> {
	totalPages: number;
	totalItems: number;
	currentPage: number;
	items: T[];
}
