import { FarmEntity } from './FarmEntity';

export interface ProducerEntity {
	id?: number;
	name?: string;
	farmId?: number;
	farm?: FarmEntity;
	taxDocument?: string;
}
