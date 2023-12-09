import cors from 'cors';
import bodyParser from 'body-parser';
import express, { Express } from 'express';
import swaggerUi from 'swagger-ui-express';

import { RegisterRoutes } from './routes';
import swaggerDocument from './swagger.json';

class Server {
	private readonly _app: Express;

	public constructor() {
		this._app = express();
	}

	private _startListening(): void {
		this._app.listen(4000, () => {
			const startMessage = `Server started at: http://localhost:${4000}/swagger`;
			console.log(startMessage);
		});
	}

	public run(): void {
		this._app.use(bodyParser.json());
		this._app.use(cors());
		this._app.use('/swagger', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
		RegisterRoutes(this._app);
		this._startListening();
	}
}

new Server().run();
