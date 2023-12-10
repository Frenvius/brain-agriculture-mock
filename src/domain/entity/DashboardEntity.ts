export interface DashboardEntity {
	totalFarmsAndArea: TotalFarmsAndArea;
	farmsByState: FarmByState[];
	farmsByCrop: FarmByCrop[];
	landUse: LandUse;
}

export interface TotalFarmsAndArea {
	_count: number;
	_sum: {
		area: number;
	};
}

export interface FarmByState {
	_count: number;
	state: string;
}

export interface FarmByCrop {
	label: string;
	value: number;
}

export interface LandUse {
	_sum: {
		usefulArea: number;
		vegetationArea: number;
	};
}
