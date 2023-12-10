import { FarmRequest } from './FarmRequest';
import { AbstractUpdateRequest } from './AbstractUpdateRequest';

export interface ProducerRequest extends AbstractUpdateRequest {
	name?: string;
	taxDocument?: string;
	farmData?: FarmRequest;
}
