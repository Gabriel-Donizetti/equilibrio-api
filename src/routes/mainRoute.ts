import { Router } from "express";
import { userRouter } from "./user/userRouter";
import { companyRouter } from "./company/companyRoute";

const routes : Router = Router();

routes.use('/user', userRouter);

routes.use('/company', companyRouter);

export default routes;

