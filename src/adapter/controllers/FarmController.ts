import { Get, Put, Body, Path, Post, Tags, Route, Delete } from 'tsoa';

import { AbstractController } from './AbstractController';
import { FarmEntity } from '../../domain/entity/FarmEntity';
import { FarmRequest } from '../../domain/request/FarmRequest';
import { FarmService } from '../../usecase/service/FarmService';
import { FarmResponse } from '../../domain/response/FarmResponse';
import { HttpStatus } from '../../domain/response/enum/HttpStatus';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';

@Route('farms')
@Tags('Farms')
export class FarmController extends AbstractController<FarmRequest, FarmResponse, FarmEntity> {
	protected _service = FarmService.instance;

	@Post()
	public async create(@Body() request: FarmRequest): Promise<FarmResponse> {
		const response = await this._service.create(request);
		this.setStatus(HttpStatus.CREATED);
		return response;
	}

	@Put()
	public async update(@Body() request: FarmRequest): Promise<FarmResponse> {
		return this._service.update(request);
	}

	@Post('search')
	public async search(@Body() request: PaginatedQueryRequest<FarmRequest>): Promise<PaginatedResponse<FarmResponse>> {
		const response = await this._service.search(request);
		this.setStatus(this.getStatusCodeForArray(response.items));
		return response;
	}

	@Get('{id}')
	public async get(@Path() id: string): Promise<FarmResponse> {
		return this._service.get(id);
	}

	@Delete('{id}')
	public async delete(@Path() id: string): Promise<void> {
		await this._service.delete(id);
		this.setStatus(HttpStatus.NO_CONTENT);
	}
}
