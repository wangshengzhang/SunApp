
import { RoutePath } from '../../../routes/RoutePath';
import { Router } from '../../../routes/Router';
import { BaseViewModel } from '../../../utils/base/BaseViewModel';

export class  LoginViewModel extends BaseViewModel {

   telPhone : string = ''
   passWord : string = ''
   agree : boolean = false

   async AgreeQueYiAction() {

      // AlertDialog.show(
      //  {
      //      title: $r('app.string.Login_wenXi_msg'),
      //      message: $r('app.string.Login_policy_Ruler'),
      //      autoCancel: true,
      //      alignment: DialogAlignment.Center,
      //      gridCount: 4,
      //      offset: { dx: 0, dy: 0},
      //      primaryButton: {
      //       fontColor : $r('app.color.color_111'),
      //       value: ' 不同意 ',
      //       action: () => {
      //         this.agree = false
      //      }
      //   },
      //      secondaryButton: {
      //      fontColor : $r('app.color.color_cb'),
      //       value: '同意并继续',
      //       action: () => {
      //         this.agree = true
      //       }
      //   },
      //  }
      // )
  }
  async NetWorkLogin() {
     Router.replaceUrl(RoutePath.MainPage)
  }
}

let loginViewModel = new LoginViewModel();
export default loginViewModel as LoginViewModel;