import { Response } from 'express';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';

import { ErrorHandler } from './ErrorHandler';
import { HttpStatus } from '../../../domain/response/enum/HttpStatus';

export class DatabaseConstraintErrorHandler implements ErrorHandler {
	private static CONSTRAINT_VIOLATION_PRISMA_ERROR_CODE = 'P2002';

	handle(error: Error, response: Response): Response {
		const prismaError = error as PrismaClientKnownRequestError;
		const message = `Conflict due to: ${prismaError.meta?.target}`;
		return response.status(HttpStatus.CONFLICT).send({ message, error });
	}

	shouldHandle(error: Error): boolean {
		return (
			error instanceof PrismaClientKnownRequestError &&
			error.code === DatabaseConstraintErrorHandler.CONSTRAINT_VIOLATION_PRISMA_ERROR_CODE
		);
	}
}
