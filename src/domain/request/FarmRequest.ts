import { CropResponse } from '../response/CropResponse';
import { AbstractUpdateRequest } from './AbstractUpdateRequest';

export interface FarmRequest extends AbstractUpdateRequest {
	name?: string;
	city?: string;
	state?: string;
	area?: number;
	producerId?: number;
	usefulArea?: number;
	vegetationArea?: number;
	plantedCrops?: CropResponse[];
}
