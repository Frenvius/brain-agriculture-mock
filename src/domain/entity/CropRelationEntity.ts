import { CropResponse } from '../response/CropResponse';
import { FarmResponse } from '../response/FarmResponse';

export interface CropRelationEntity {
	id: string;
	cropId: number;
	crop: CropResponse;
	farmId: number;
	farm: FarmResponse;
}
