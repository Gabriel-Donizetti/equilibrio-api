import { Request, Response } from "express";
import { CompanyDTO, UserDTO } from "src/interfaces/user";
import UserService from "src/service/userService";

const userService = new UserService();

export class UserController {

    static async createUser(req: Request, res: Response){
        try {
            const {nome, senha} = req.body;

            const user: UserDTO ={
                nome, senha
            }
            const resService = await userService.createUser(user)
            return res.status(200).json({resService});
        } catch (error) {
            return res.status(502).json(error);
        }
    }

    static async login(req: Request, res: Response){

    }

    static async createCompany(req: Request, res: Response){
        try {
            const {nome, endereco, userID} = req.body;

            const company: CompanyDTO = {
                nome, endereco, userID
            }

            const resService = await userService.createCompany(company);
            return res.status(200).json({resService})
        } catch (error) {
            return res.status(502).json(error)
        }
    }
    static async updateCompany(req: Request, res: Response){
        
    }
    static async deleteCompany(req: Request, res: Response){
        
    }
    static async listCompanys(req: Request, res: Response){
        try {

            const resService = await userService.listCompanys()

            return res.status(200).json(resService)
        } catch (error) {
            return  res.status(502).json(error)
        }
    }
    static async getCompany(req: Request, res: Response){
        
    }
}