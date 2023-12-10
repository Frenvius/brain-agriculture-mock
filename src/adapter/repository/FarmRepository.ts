import { DatabaseTable } from './DatabaseTable';
import { AbstractRepository } from './AbstractRepository';
import { FarmEntity } from '../../domain/entity/FarmEntity';
import { FarmRequest } from '../../domain/request/FarmRequest';

export class FarmRepository extends AbstractRepository<FarmEntity, FarmRequest> {
	public static instance = new FarmRepository(DatabaseTable.FARM);

	protected getFilters(query: FarmRequest): any[] {
		const result: any[] = [];

		if (query.id) result.push({ id: query.id });
		if (query.area) result.push({ area: query.area });
		if (query.name) result.push({ name: { contains: query.name } });
		if (query.city) result.push({ city: { contains: query.city } });
		if (query.state) result.push({ state: { contains: query.state } });
		if (query.usefulArea) result.push({ usefulArea: query.usefulArea });
		if (query.vegetationArea) result.push({ vegetationArea: query.vegetationArea });
		if (query.plantedCrops) result.push({ plantedCrops: { contains: query.plantedCrops } });

		return result;
	}

	public async create(entity: FarmEntity): Promise<FarmEntity> {
		return super.create(entity);
	}
}
