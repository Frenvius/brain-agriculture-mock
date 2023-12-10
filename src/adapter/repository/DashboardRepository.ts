import { DatabaseClient } from './DatabaseClient';
import { DatabaseTable, getClientForTable } from './DatabaseTable';

export class DashboardRepository {
	public static instance = new DashboardRepository();
	private _farmClient = getClientForTable(DatabaseTable.FARM);
	private _cropRelationClient = getClientForTable(DatabaseTable.CROP_RELATION);

	async getTotalFarmsAndArea(): Promise<any> {
		return await this._farmClient.aggregate({
			_count: true,
			_sum: {
				area: true
			}
		});
	}

	async getFarmsByState(): Promise<any> {
		return await this._farmClient.groupBy({
			by: ['state'],
			_count: true
		});
	}

	async getFarmsByCrop(): Promise<any> {
		return DatabaseClient.client.$queryRaw(
			DatabaseClient.prisma.raw(`SELECT"Crop".label, COUNT("CropRelation"."cropId") as value
			FROM "CropRelation"
			JOIN "Crop" ON "CropRelation"."cropId" = "Crop".id
			GROUP BY "CropRelation"."cropId", "Crop".label;`)
		);
	}

	async getLandUse(): Promise<any> {
		return await this._farmClient.aggregate({
			_sum: {
				usefulArea: true,
				vegetationArea: true
			}
		});
	}
}
