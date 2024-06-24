
import { RoutePath } from '../../../routes/RoutePath';
import { Router } from '../../../routes/Router';
import { BaseViewModel, ResultCallback} from '../../../utils/base/BaseViewModel';
import { LoginModel } from  '../Model/LoginModel'
import promptAction from '@ohos.promptAction'
import { UserTool } from '../../../utils/tool/UserTool';
import showToast from '../../../utils/tool/ToastUtils';
import ToastUtils from '../../../utils/tool/ToastUtils';
import validatorPhone from '../../../utils/tool/RuleUtils';

export class  LoginViewModel extends BaseViewModel {

   telPhone : string = ''
   passWord : string = ''
   agree : boolean = false

   resultCallback? : ResultCallback
   async NetWorkLogin(resultCallback? : ResultCallback) {
     if (this.telPhone.length == 0) {
       // 是否输入 验证码
       ToastUtils("请输入手机号")
       return false
     }
     // 是否输入手
     if (!validatorPhone(this.telPhone)){
       ToastUtils("请输入正确的手机号")
       return
     }
     // 是否输入 验证码
     if (this.passWord.length == 0){
       ToastUtils("请输入验证码")
       return
     }
     if (this.passWord.length < 4){
       ToastUtils("验证码必须是4位数")
       return
     }
      resultCallback.call('')
      /// 延迟
      setTimeout(()=>{
         this.pushMainNetwork()
      },5000)
   }

   async pushMainNetwork() {
     // 真正的获取数据源的显示问题
     let user : LoginModel = {
         nickName : '布衣思考者',
         icon : 'https://test.img.betterwood.com/user/avatar/20230808/3A7A59CB2F4A4E9183C1D5D6EFC9398E.jpg',
         tel : this.telPhone,
         token : 'UpXZIX4EP9/zuiFsgOeKc3VUfDHnksetmGhnwzEK3xJkY3KNMd0CQNg++ww/i0fCZKNpVk9v36HjBFGEYHo0SOiSMLKQeRVoB+L7RT1/MqrmCU3gED3iB6qoF+3bFI1dNmFESZDRrk2qVmQmajslbw==',
         birthday : '1993- 07-11',
         sex : '男',
         email : '846369914@qq.com',
         job : '工作',
         userId : '1643088252217700353'}
     /// 存储 用户
     UserTool.shared.putUser(user)
     /// 跳转 到路径
     Router.replaceUrl(RoutePath.MainPage)

   }
}

let loginViewModel = new LoginViewModel();
export default loginViewModel as LoginViewModel;