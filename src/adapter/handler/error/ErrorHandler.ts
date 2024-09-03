import { Response } from 'express';

export interface ErrorHandler {
	shouldHandle(error: Error): boolean;
	handle(error: Error, response: Response): Response;
}
