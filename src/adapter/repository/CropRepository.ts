import { DatabaseTable, getClientForTable } from './DatabaseTable';
import { CropRelationEntity } from '../../domain/entity/CropRelationEntity';

export class CropRepository {
	public static instance = new CropRepository();
	private client = getClientForTable(DatabaseTable.CROP);
	private _clientCropRelation = getClientForTable(DatabaseTable.CROP_RELATION);

	async getAll() {
		return this.client.findMany();
	}

	async getByFarmId(farmId: number): Promise<CropRelationEntity[]> {
		const joins = { include: { crop: true } };
		return this._clientCropRelation.findMany({ where: { farmId }, ...joins });
	}

	async addCropRelation(cropId: number, farmId: number): Promise<CropRelationEntity> {
		const joins = { include: { crop: true } };
		return this._clientCropRelation.create({ data: { cropId, farmId }, ...joins });
	}
}
