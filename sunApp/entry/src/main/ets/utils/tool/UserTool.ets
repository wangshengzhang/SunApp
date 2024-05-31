
import { StorageKeys } from '../../constants/StorageKeys';
import { LoginModel } from '../../pages/Login/Model/LoginModel';
import { JsonUtils } from './JsonUtils';
import { StorageUtils } from './StorageUtils';
import preferences from '@ohos.data.preferences'

 export class UserTool {
    /// 单列
    public static shared : UserTool = new UserTool();
    user : LoginModel
    isLogin : boolean = false
    //  构造函数
    private constructor() {
      this.loadPreference(this.)
      this.getUserInfo()

    }
    preferencesMap: Map<string, preferences.Preferences> = new Map;
    //加载一个preference
    async loadPreference(context, name: string) {
     console.log('testTag', `开始加载Preference [${name}]`);
     try { //返回值是一个Promise包裹起来的preference，因此可以使用链式回调函数处理,也可以使用async/await
       let preference = await preferences.getPreferences(context, name)
       this.preferencesMap.set(name, preference)
       console.log('testTag', `加载Preference [${name}]成功`);
       return preference
     } catch (err) {
       console.log('testTag', `加载Preference [${name}]失败`, JSON.stringify(err));
       Promise.reject(`加载Preference [${name}]失败`)
     }
   }

    /// 存储会员信息
    public putUser(user : LoginModel) {
      let userModel = JsonUtils.stringify(user)
      StorageUtils.put(StorageKeys.USER_INFO_KEY,userModel)
      this.getUserInfo()
    }
    ///获取会员信息
    public getUserInfo() {
        let  userJson = StorageUtils.get(StorageKeys.USER_INFO_KEY).then((value:string) =>{
          if (value.length > 0) {
            let newUser  = JsonUtils.parse(value)
            this.user = newUser
            if (this.user.userId.length > 0) {
              this.isLogin = true
            }else {
              this.isLogin = false
            }
          }
       }
     )
   }



  }