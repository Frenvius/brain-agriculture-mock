import { Get, Put, Body, Path, Post, Tags, Route, Delete } from 'tsoa';

import { AbstractController } from './AbstractController';
import { HttpStatus } from '../../domain/response/enum/HttpStatus';
import { ProducerEntity } from '../../domain/entity/ProducerEntity';
import { ProducerRequest } from '../../domain/request/ProducerRequest';
import { ProducerService } from '../../usecase/service/ProducerService';
import { ProducerResponse } from '../../domain/response/ProducerResponse';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';
import { ProducerCreateRequest } from '../../domain/request/ProducerCreateRequest';

@Route('producers')
@Tags('Producers')
export class ProducerController extends AbstractController<ProducerRequest, ProducerResponse, ProducerEntity> {
	protected _service = ProducerService.instance;

	@Post()
	public async create(@Body() request: ProducerCreateRequest): Promise<ProducerResponse> {
		const response = await this._service.create(request);
		this.setStatus(HttpStatus.CREATED);
		return response;
	}

	@Put()
	public async update(@Body() request: ProducerRequest): Promise<ProducerResponse> {
		return this._service.update(request);
	}

	@Post('search')
	public async search(@Body() request: PaginatedQueryRequest<ProducerRequest>): Promise<PaginatedResponse<ProducerResponse>> {
		const response = await this._service.search(request);
		this.setStatus(this.getStatusCodeForArray(response.items));
		return response;
	}

	@Get('{id}')
	public async get(@Path() id: string): Promise<ProducerResponse> {
		return this._service.get(id);
	}

	@Delete('{id}')
	public async delete(@Path() id: string): Promise<void> {
		await this._service.delete(id);
		this.setStatus(HttpStatus.NO_CONTENT);
	}
}
