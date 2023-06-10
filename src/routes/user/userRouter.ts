import { UserController } from "@controllers/userController";
import { Router } from "express";

export const userRouter:Router = Router();

userRouter.post('/createuser', UserController.createUser);
//userRouter.post('/login', AdminController.login);

userRouter.post('/createcompany', UserController.createCompany);
userRouter.put('/updtaecompany', UserController.updateCompany);
userRouter.delete('/deletecompany', UserController.deleteCompany)
userRouter.get('/listcompanys', UserController.listCompanys);
userRouter.get('/getcompany', UserController.getCompany);