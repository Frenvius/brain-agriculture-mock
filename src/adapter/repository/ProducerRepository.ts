import { DatabaseTable } from './DatabaseTable';
import { AbstractRepository } from './AbstractRepository';
import { ProducerEntity } from '../../domain/entity/ProducerEntity';
import { ProducerRequest } from '../../domain/request/ProducerRequest';

export class ProducerRepository extends AbstractRepository<ProducerEntity, ProducerRequest> {
	public static instance = new ProducerRepository(DatabaseTable.PRODUCER);

	protected joins = { include: { farm: true } };

	protected getFilters(query: ProducerRequest): any[] {
		return [{ name: { contains: query.name } }];
	}
}
