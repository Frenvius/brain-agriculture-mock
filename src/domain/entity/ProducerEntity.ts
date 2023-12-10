import { FarmEntity } from './FarmEntity';

export interface ProducerEntity {
	id?: number;
	name?: string;
	farm?: FarmEntity;
	taxDocument?: string;
}
