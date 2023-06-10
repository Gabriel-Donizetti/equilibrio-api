import { CompanyDTO, UserDTO } from "src/interfaces/user";
import UserRepository from "src/repository/userRepository";

export default class UserService{
    userRepository:UserRepository;
    constructor(){
        this.userRepository = new UserRepository();
    }

    /**
    * @param UserDTO
    * @returns
    */
    async createUser(userDTO:UserDTO){
        const verify = await this.userRepository.findUser(userDTO);
        if(verify){
            throw new Error ('this user already existis, try another')
        }
        const admin = await this.userRepository.createUser(userDTO);
        return admin;        
    }
    
    /**
    * @param CompanyDTO
    * @returns
    */
   async createCompany(companyDTO: CompanyDTO) {
    const verify = await this.userRepository.findCompany(companyDTO);
    if(verify){
        throw new Error ('this company already existis, try another')
    }

    const company = await this.userRepository.createCompany(companyDTO);
   }

}