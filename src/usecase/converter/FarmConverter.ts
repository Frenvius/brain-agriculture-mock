import { AbstractConverter } from './AbstractConverter';
import { FarmEntity } from '../../domain/entity/FarmEntity';
import { FarmRequest } from '../../domain/request/FarmRequest';
import { FarmResponse } from '../../domain/response/FarmResponse';

export class FarmConverter implements AbstractConverter<FarmEntity, FarmRequest, FarmResponse> {
	public static instance = new FarmConverter();

	public toEntity(request: FarmRequest): FarmEntity {
		return {
			name: request.name,
			city: request.city,
			state: request.state,
			area: request.area,
			usefulArea: request.usefulArea,
			vegetationArea: request.vegetationArea,
			plantedCrops: request.plantedCrops
		};
	}

	public toResponse(entity: FarmEntity): FarmResponse {
		return {
			id: entity.id!,
			name: entity.name!,
			city: entity.city!,
			state: entity.state!,
			area: entity.area!,
			usefulArea: entity.usefulArea!,
			vegetationArea: entity.vegetationArea!,
			plantedCrops: entity.plantedCrops!
		};
	}
}
