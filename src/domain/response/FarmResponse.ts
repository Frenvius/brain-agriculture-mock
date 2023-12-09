import { CropResponse } from './CropResponse';

export interface FarmResponse {
	id: number;
	name: string;
	city: string;
	state: string;
	area: number;
	usefulArea: number;
	vegetationArea: number;
	plantedCrops: CropResponse[];
}
