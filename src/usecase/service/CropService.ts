import { CropConverter } from '../converter/CropConverter';
import { CropEntity } from '../../domain/entity/CropEntity';
import { CropResponse } from '../../domain/response/CropResponse';
import { CropRepository } from '../../adapter/repository/CropRepository';
import { CropRelationEntity } from '../../domain/entity/CropRelationEntity';

export class CropService {
	public static instance = new CropService();
	private _converter = CropConverter.instance;
	private _repository = CropRepository.instance;

	async getAll(): Promise<CropResponse[]> {
		const entities = await this._repository.getAll();
		return entities.map((entity: CropEntity) => this._converter.toResponse(entity));
	}

	async getByFarmId(farmId: number): Promise<CropResponse[]> {
		const entities = await this._repository.getByFarmId(farmId);
		return entities.map((entity: CropRelationEntity) => this._converter.toRelationResponse(entity));
	}

	async addCropRelation(cropId: number, farmId: number): Promise<CropResponse> {
		const entity = await this._repository.addCropRelation(cropId, farmId);
		return this._converter.toRelationResponse(entity);
	}
}
