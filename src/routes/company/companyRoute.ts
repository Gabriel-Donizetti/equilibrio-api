import { Router } from "express";

export const companyRouter:Router = Router();

companyRouter.post('/signing');
companyRouter.post('/login');

companyRouter.post('/create-company')