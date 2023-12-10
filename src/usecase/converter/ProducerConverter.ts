import { FarmConverter } from './FarmConverter';
import { AbstractConverter } from './AbstractConverter';
import { ProducerEntity } from '../../domain/entity/ProducerEntity';
import { ProducerRequest } from '../../domain/request/ProducerRequest';
import { ProducerResponse } from '../../domain/response/ProducerResponse';

export class ProducerConverter implements AbstractConverter<ProducerEntity, ProducerRequest, ProducerResponse> {
	public static instance = new ProducerConverter();

	public toEntity(request: ProducerRequest): ProducerEntity {
		return {
			name: request.name,
			taxDocument: request.taxDocument
		};
	}

	public toResponse(entity: ProducerEntity): ProducerResponse {
		const farm = entity.farm ? FarmConverter.instance.toResponse(entity.farm) : undefined;

		return {
			id: entity.id!,
			name: entity.name!,
			farm: farm,
			taxDocument: entity.taxDocument!
		};
	}
}
