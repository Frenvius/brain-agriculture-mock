import { DashboardConverter } from '../converter/DashboardConverter';
import { DashboardResponse } from '../../domain/response/DashboardResponse';
import { DashboardRepository } from '../../adapter/repository/DashboardRepository';

export class DashboardService {
	public static instance = new DashboardService();
	private _converter = DashboardConverter.instance;
	private _repository = DashboardRepository.instance;

	async getData(): Promise<DashboardResponse> {
		const totalFarmsAndArea = await this._repository.getTotalFarmsAndArea();
		const farmsByState = await this._repository.getFarmsByState();
		const farmsByCrop = await this._repository.getFarmsByCrop();
		const landUse = await this._repository.getLandUse();

		const entity = {
			totalFarmsAndArea,
			farmsByState,
			farmsByCrop,
			landUse
		};

		return this._converter.toResponse(entity);
	}
}
