import { CropResponse } from '../response/CropResponse';

export interface FarmEntity {
	id?: number;
	name?: string;
	city?: string;
	state?: string;
	area?: number;
	producerId?: number;
	usefulArea?: number;
	vegetationArea?: number;
	plantedCrops?: CropResponse[];
}
