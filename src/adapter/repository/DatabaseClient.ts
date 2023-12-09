import { Prisma, PrismaClient } from '@prisma/client';

export class DatabaseClient {
	public static prisma = Prisma;
	public static client = new PrismaClient({
		log: [
			{
				emit: 'event',
				level: 'query'
			},
			{
				emit: 'stdout',
				level: 'error'
			},
			{
				emit: 'stdout',
				level: 'info'
			},
			{
				emit: 'stdout',
				level: 'warn'
			}
		]
	});
}
