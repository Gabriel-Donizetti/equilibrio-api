import { PrismaClient } from "@prisma/client";
import { AdminDTO } from "src/interfaces/admin";

class AdminRepository{
    prisma:PrismaClient;
    constructor(){
        this.prisma = new PrismaClient;
    }
    async createAdmin(adminDTO: AdminDTO) {
        const admin = await this.prisma.user.create({
            data:{
                login:adminDTO.login,
                name:adminDTO.name,
                password:adminDTO.password,
                role_id:1
            }
        })
        return admin;
    }
    async findUser(adminDTO:AdminDTO){
        const find = await this.prisma.user.findUnique({
            where:{
                login:adminDTO.login
            }
        })
        return find;
    }
}

export default AdminRepository;