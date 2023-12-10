import { Get, Tags, Route, Controller } from 'tsoa';

import { HttpStatus } from '../../domain/response/enum/HttpStatus';
import { DashboardService } from '../../usecase/service/DashboardService';
import { DashboardResponse } from '../../domain/response/DashboardResponse';

@Route('dashboard')
@Tags('Dashboard')
export class DashboardController extends Controller {
	protected _service = DashboardService.instance;

	@Get()
	public async getData(): Promise<DashboardResponse> {
		const response = await this._service.getData();
		this.setStatus(HttpStatus.SUCCESS);
		return response;
	}
}
