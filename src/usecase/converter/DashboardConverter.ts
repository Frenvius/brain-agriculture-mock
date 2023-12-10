import { ChartItem, DashboardResponse } from '../../domain/response/DashboardResponse';
import { LandUse, FarmByCrop, FarmByState, DashboardEntity } from '../../domain/entity/DashboardEntity';

export class DashboardConverter {
	public static instance = new DashboardConverter();

	public toResponse(entity: DashboardEntity): DashboardResponse {
		return {
			totalFarms: entity.totalFarmsAndArea._count,
			totalAcres: entity.totalFarmsAndArea._sum.area,
			pieChartByState: this.toChartByState(entity.farmsByState),
			pieChartByCrop: this.toChartByCrop(entity.farmsByCrop),
			pieChartByLandUse: this.toChartByLandUse(entity.landUse)
		};
	}

	public toChartByState(entity: FarmByState[]): ChartItem[] {
		return entity.map((item) => {
			return {
				label: item.state,
				value: item._count
			};
		});
	}

	public toChartByCrop(entity: FarmByCrop[]): ChartItem[] {
		return entity.map((item) => {
			return {
				label: item.label,
				value: Number(item.value)
			};
		});
	}

	public toChartByLandUse(entity: LandUse): ChartItem[] {
		return [
			{
				label: 'usefulArea',
				value: entity._sum.usefulArea
			},
			{
				label: 'vegetationArea',
				value: entity._sum.vegetationArea
			}
		];
	}
}
