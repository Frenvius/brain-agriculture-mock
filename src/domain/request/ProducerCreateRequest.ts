import { FarmRequest } from './FarmRequest';

export interface ProducerCreateRequest {
	name: string;
	taxDocument: string;
	farmData: FarmRequest;
}
