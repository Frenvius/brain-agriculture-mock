import { Controller } from 'tsoa';

import { ArrayUtils } from '../../usecase/util/ArrayUtils';
import { HttpStatus } from '../../domain/response/enum/HttpStatus';
import { AbstractService } from '../../usecase/service/AbstractService';
import { PaginatedResponse } from '../../domain/response/PaginatedResponse';
import { AbstractUpdateRequest } from '../../domain/request/AbstractUpdateRequest';
import { PaginatedQueryRequest } from '../../domain/request/PaginatedQueryRequest';

export abstract class AbstractController<Request extends AbstractUpdateRequest, Response, Entity> extends Controller {
	protected _service: AbstractService<Request, Response, Entity> | undefined;

	public create?(request: Request): Promise<Response>;

	public update?(request: Request): Promise<Response>;

	public search?(request: PaginatedQueryRequest<Request>): Promise<PaginatedResponse<Response>>;

	public get?(id: string): Promise<Response>;

	public delete?(id: string): Promise<void>;

	protected getStatusCodeForArray(array: any[]) {
		return ArrayUtils.isEmpty(array) ? HttpStatus.NO_CONTENT : HttpStatus.SUCCESS;
	}
}
