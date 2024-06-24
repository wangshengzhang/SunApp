// export const verifyPassword = (value: unknown): boolean => {
import ToastUtils from './ToastUtils';
//   const regs = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[a-zA-Z]).{6,20}$/;
//   return !regs.test(value as string);
// };
//
// export const validatePassword = (value: unknown, callback: (message?: string) => void) => {
//   if (!value) {
//     return callback();
//   }
//   if (verifyPassword(value)) {
//     return callback('密码必须包含大小写字母、数字或特殊字符，长度为6-20位');
//   }
//   return callback();
// }

export default function validatorPhone(value: string) : boolean {
    console.log(value)

    const regPhone: RegExp = /^1[3456789]\d{9}$/;
    let  hc = regPhone.test(value)
    console.log("hc = ",hc)
    if (hc == true) {
      console.log("2222")
      return true;
    }
    console.log("1111")
    return false;

}


// export const validatorPhone = (_: unknown, value: string): Promise<void> => {
//   const regPhone: RegExp = /^1[3-9]\d{9}$/;
//   const regLandline: RegExp = /^\d{7,8}$/;
//
//   if (!value || regPhone.test(value) || regLandline.test(value)) {
//     return Promise.resolve();
//   }
//   return Promise.reject(new Error('请填写正确的联系号码'));
// }

// export const validatorBirth = (_: unknown, value: string): Promise<void> => {
//   const regBirth = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
//   if (!value || regBirth.test(value)) {
//     return Promise.resolve();
//   }
//   return Promise.reject(new Error('请填写正确的出生日期'));
// }
