import { CropResponse } from '../response/CropResponse';

export interface FarmEntity {
	id?: number;
	name?: string;
	city?: string;
	state?: string;
	area?: number;
	usefulArea?: number;
	vegetationArea?: number;
	plantedCrops?: CropResponse[];
}
