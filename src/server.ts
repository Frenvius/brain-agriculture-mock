import cors from 'cors';
import bodyParser from 'body-parser';
import express, { Express } from 'express';
import swaggerUi from 'swagger-ui-express';

import { RegisterRoutes } from './routes';
import swaggerDocument from './swagger.json';
import { ErrorHandlerStrategy } from './adapter/handler/error/ErrorHandlerStrategy';

class Server {
	private readonly _app: Express;

	public constructor() {
		this._app = express();
	}

	private _startListening(): void {
		this._app.listen(4050, () => {
			const startMessage = `Server started at: http://localhost:${4050}/swagger`;
			console.log(startMessage);
		});
	}

	public run(): void {
		this._app.use(bodyParser.json());
		this._app.use(cors());
		this._app.use('/swagger', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
		RegisterRoutes(this._app);
		this._app.use(ErrorHandlerStrategy.handleByError);
		this._startListening();
	}
}

new Server().run();
