import { User } from "@models/User";

test('it shold be ok', ()=>{
    const user = new User();

    user.name = "Diego";

    expect(user.name).toEqual('Diego')

})