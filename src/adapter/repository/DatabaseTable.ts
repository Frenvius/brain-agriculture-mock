import { DatabaseClient } from './DatabaseClient';

const clientMap = [
	{ key: 'PRODUCER', client: DatabaseClient.client.producer },
	{ key: 'FARM', client: DatabaseClient.client.farm },
	{ key: 'CROP', client: DatabaseClient.client.crop },
	{ key: 'CROP_RELATION', client: DatabaseClient.client.cropRelation }
];

export enum DatabaseTable {
	PRODUCER = 'PRODUCER',
	FARM = 'FARM',
	CROP = 'CROP',
	CROP_RELATION = 'CROP_RELATION'
}

export function getClientForTable(tableName: DatabaseTable): any {
	for (const entry of clientMap) {
		if (entry.key === tableName.toString()) {
			return entry.client;
		}
	}
}
