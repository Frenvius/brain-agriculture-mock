import { CropEntity } from '../../domain/entity/CropEntity';
import { CropResponse } from '../../domain/response/CropResponse';
import { CropRelationEntity } from '../../domain/entity/CropRelationEntity';

export class CropConverter {
	public static instance = new CropConverter();

	public toResponse(entity: CropEntity): CropResponse {
		return {
			id: entity.id!,
			label: entity.label!,
			active: entity.active!
		};
	}

	public toRelationResponse(entity: CropRelationEntity): CropResponse {
		const crop = entity.crop ? this.toResponse(entity.crop) : undefined;
		return {
			id: crop?.id!,
			label: crop?.label!,
			active: crop?.active!
		};
	}
}
