import { DatabaseTable, getClientForTable } from './DatabaseTable';
import { CropRelationEntity } from '../../domain/entity/CropRelationEntity';

export class CropRepository {
	public static instance = new CropRepository();
	private client = getClientForTable(DatabaseTable.CROP);
	private _cropRelationClient = getClientForTable(DatabaseTable.CROP_RELATION);

	async getAll() {
		return this.client.findMany();
	}

	async getByFarmId(farmId: number): Promise<CropRelationEntity[]> {
		const joins = { include: { crop: true } };
		return this._cropRelationClient.findMany({ where: { farmId }, ...joins });
	}

	async addCropRelation(cropId: number, farmId: number): Promise<CropRelationEntity> {
		const joins = { include: { crop: true } };
		return this._cropRelationClient.create({ data: { cropId, farmId }, ...joins });
	}

	async removeCropRelation(farmId: number): Promise<CropRelationEntity> {
		return this._cropRelationClient.deleteMany({ where: { farmId } });
	}
}
