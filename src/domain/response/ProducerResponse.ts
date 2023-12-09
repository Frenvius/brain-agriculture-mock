import { FarmResponse } from './FarmResponse';

export interface ProducerResponse {
	id: number;
	name: string;
	taxDocument: string;
	farm?: FarmResponse;
}
