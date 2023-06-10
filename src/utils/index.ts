
import { Request } from 'express';
import { sign } from 'jsonwebtoken';
import { validationResult } from 'express-validator';
import bcrypt from 'bcrypt';
import { User } from '@prisma/client';

export const validationRequest = (req: Request) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return errors;
  }
  return false;
};

export const generateCryptPassword = async (myPlaintextPassword:string) => {
  const password = await bcrypt.hash(myPlaintextPassword, 10);
  return password;
};

export const compareHashAndPassword = async (myPlaintextPassword:string, hash:string) => {
  const res = await bcrypt.compare(myPlaintextPassword, hash).then((result) => result);
  return res;
};

// export const createToken = async (user: User) => {
//   const token = await sign(
//     {
//       user: {
//         id: user.id,
//         email: user.email,
//       },
//     },
//     process.env.JWT_SECRET,
//     {
//       subject: user.id,
//       expiresIn: '1d',
//     },
//   );
//   return token;
// };
