import { PrismaClient } from "@prisma/client";
import { CompanyDTO, UserDTO } from "src/interfaces/user";

class UserRepository{
    prisma:PrismaClient;
    constructor(){
        this.prisma = new PrismaClient;
    }

    async findUser(userDTO: UserDTO){
        const find = await this.prisma.usuario.findFirst({
            where:{
                nome: userDTO.nome
            }
        })

        return find;
    }

    async createUser(userDTO: UserDTO) {
        const admin = await this.prisma.usuario.create({
            data:{
                nome: userDTO.nome,
                senha: userDTO.senha
            }
        })
        return admin;
    }

    async findCompany(companyDTO: CompanyDTO){
        const find = await this.prisma.empresa.findFirst({
            where: {
                nome: companyDTO.nome,
                endereco: companyDTO.endereco
            }
        })

        return find
    }

    async createCompany(companyDTO: CompanyDTO){
        const company = await this.prisma.empresa.create({
            data:{
                nome: companyDTO.nome,
                endereco: companyDTO.endereco,
                usuario_id: companyDTO.userID
            }
        })

        return company
    }

    async listCompanys(){
        const companys = await this.prisma.empresa.findMany({
           take: 1000,
           select:{
            endereco: true,
            nome: true
           }
        })

        return companys
    }
}

export default UserRepository;