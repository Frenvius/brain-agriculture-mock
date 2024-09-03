import { Request, Response, NextFunction } from 'express';

import { DatabaseConstraintErrorHandler } from './DatabaseConstraintErrorHandler';

export class ErrorHandlerStrategy {
	private static _errorHandlers = [new DatabaseConstraintErrorHandler()];

	public static handleByError(error: Error, _: Request, response: Response, next: NextFunction): Response | void {
		console.error(`Handled error: ${error.message}`);
		console.error(error);

		for (const errorHandler of ErrorHandlerStrategy._errorHandlers) {
			if (errorHandler.shouldHandle(error)) {
				return errorHandler.handle(error, response);
			}
		}

		next();
	}
}
