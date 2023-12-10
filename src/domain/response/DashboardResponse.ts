export interface DashboardResponse {
	totalFarms: number;
	totalAcres: number;
	pieChartByState: ChartItem[];
	pieChartByCrop: ChartItem[];
	pieChartByLandUse: ChartItem[];
}

export interface ChartItem {
	label: string;
	value: number;
}
