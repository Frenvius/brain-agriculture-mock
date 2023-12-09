import { Get, Tags, Route, Controller } from 'tsoa';

import { CropService } from '../../usecase/service/CropService';
import { CropResponse } from '../../domain/response/CropResponse';
import { HttpStatus } from '../../domain/response/enum/HttpStatus';

@Route('crops')
@Tags('Crops')
export class CropController extends Controller {
	protected _service = CropService.instance;

	@Get()
	public async getAll(): Promise<CropResponse[]> {
		const response = await this._service.getAll();
		this.setStatus(HttpStatus.SUCCESS);
		return response;
	}
}
