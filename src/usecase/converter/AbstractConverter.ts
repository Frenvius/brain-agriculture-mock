export interface AbstractConverter<Entity, Request, Response> {
	toResponse(entity: Entity): Response;
	toEntity(request: Request): Entity;
}
