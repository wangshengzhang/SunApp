
import { RoutePath } from '../../../routes/RoutePath';
import { Router } from '../../../routes/Router';
import { BaseViewModel, ResultCallback} from '../../../utils/base/BaseViewModel';
import { LoginModel } from  '../Model/LoginModel'
import { StorageUtils } from  '../../../utils/tool/StorageUtils'
import { StorageKeys } from '../../../constants/StorageKeys';
import { JsonUtils } from '../../../utils/tool/JsonUtils';
import { formToJSON } from '@ohos/axios';
import { UserTool } from '../../../utils/tool/UserTool';

export class  LoginViewModel extends BaseViewModel {

   telPhone : string = ''
   passWord : string = ''
   agree : boolean = false

   async AgreeQueYiAction() {

   }

   resultCallback? : ResultCallback
   async NetWorkLogin(resultCallback? : ResultCallback) {
      resultCallback.call('')
      /// 延迟
      setTimeout(()=>{
         this.pushMainNetwork()
      },5000)
   }

   async pushMainNetwork() {

     let user : LoginModel = {
         nickName : '布衣思考者',
         icon : 'https://test.img.betterwood.com/user/avatar/20230808/3A7A59CB2F4A4E9183C1D5D6EFC9398E.jpg',
         tel : '13005427256',
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