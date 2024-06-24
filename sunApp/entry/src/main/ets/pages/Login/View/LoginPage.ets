import { NavigationBar } from '../../../components/NavigationBar'
import ViewModel from  '../ViewModel/LoginViewModel'
import {CustomDialogView}  from  '../../../components/CustomDialogView'
import ToastUtils from '../../../utils/tool/ToastUtils'
import validatorPhone from '../../../utils/tool/RuleUtils'

@Entry
@Component
struct LoginPage {
  /// 同意
  @State agree : boolean = false
  /// 是否显示转圈圈
  @State isProgress : boolean = false
  /// 弹窗
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogView({
      resultCallback :(event)=>{
        ViewModel.agree = true
        this.agree = true
      }
    }),
    alignment: DialogAlignment.Center })

  build() {

    Column() {
      ///  导航栏
      NavigationBar({title: "会员登陆", backButton: false, alpha: 1}).align(Alignment.TopStart)
      /// 图片
      Image($r('app.media.logo_icon_new')).proxyImage()
      /// 输入手机号
      TextInput({placeholder:$r('app.string.Login_account_placeholder')}).inputProxy().onChange((str:string)=>{
        ViewModel.telPhone = str
      })

      /// 输入验证码 和 获取验证码
      Row() {
        /// 请输入手机号
        TextInput({placeholder:$r('app.string.Login_pwd_placeholder')}).onChange((str) => {
          ViewModel.passWord = str
        }).inputProxy(true).width($r('app.float.size_240'))
        /// 请取验证码码
        Button($r('app.string.Login_code_placeholder')).btnType().onClick(()=>{
          console.log('1111')
        })
      }.rowType()

      /// 立即登陆
      Button($r('app.string.Login_Btn_title')).loginBtnType().onClick(()=>{

        // 是否输入 手机号
        // if validatorPhone(ViewModel.telPhone) {
        //   ToastUtils("请输入手机号码")
        //   return
        // }

        // 是否输入 验证码
        // if (ViewModel.passWord.length > 0) {
        //   ToastUtils("请输入验证码")
        //   return
        // }

         /// 判断 是否 已经 同意 协议
        if (this.agree == false) {
          this.dialogController.open()
        } else {
           ViewModel.NetWorkLogin(()=>{
            this.isProgress = true
           })
        }
      })

      /// 协议
      Row() {
        Image(this.agree != true ? $r('app.media.login_circle_nor') :$r('app.media.login_circle_sel')).imageAgree()
        Text($r('app.string.Login_agree_title')).fontColor($r('app.color.color_666'))
        .fontSize($r('app.float.font_14')).fontWeight(FontWeight.Medium).margin({left:$r('app.float.size_4')})
        Text($r('app.string.Login_agree_policy')).proxyTextType()
      }.onClick(()=>{
        this.agree = !this.agree
      }).XueYiType(true)

     /// 协议部分
     Row(){
       Text($r('app.string.Login_agree_policy_half')).proxyTextType().margin({left:$r('app.float.size_72')})
     }.XueYiType(false).onClick(()=>{
       this.agree = !this.agree
     })

     // 协议的使用
     Blank()
     if (this.isProgress == true) {
        LoadingProgress().width($r('app.float.size_50')).height($r('app.float.size_50'))
          .color($r('app.color.color_cb')).margin({bottom:$r('app.float.size_90')})
     }

     /// 写这个App 的机构信息
     Text($r('app.string.Login_agree_ICP')).margin({bottom:$r('app.float.size_65')})
       .fontSize($r('app.float.font_14'))
       .fontColor($r('app.color.color_999'))
    }.width('100%').height('100%').justifyContent(FlexAlign.Start).align(Alignment.TopStart)

  }

}

/*协议的布局*/
@Extend(Row) function XueYiType(agree:boolean = false) {
  .height($r('app.float.size_20')).justifyContent(FlexAlign.Start).margin({top:agree != true ? 0 : $r('app.float.size_15')}).align(Alignment.Start).width('100%')
}

/* 文本如何处理问题 */
@Extend(Text) function proxyTextType() {
  .fontColor($r('app.color.color_666'))
  .fontSize($r('app.float.font_14'))
  .maxLines(1)
  .fontWeight(FontWeight.Medium)
  .margin({left:$r('app.float.size_4'),right:$r('app.float.size_50')}).fontColor($r('app.color.color_cb'))
}

/*Logo 的显示问题*/
@Extend(Image) function proxyImage() {
  .backgroundColor(Color.Red)
  .width($r('app.float.size_200'))
  .height($r('app.float.size_168')).margin({top:$r('app.float.size_40')})
}

/*输入手机号拓展*/
@Extend(TextInput) function inputProxy(isPwd:Boolean = false) {
  .margin({left:isPwd ? 0 : $r('app.float.size_18') ,right:isPwd ? 0 : $r('app.float.size_18') })
  .height($r('app.float.size_50')).borderWidth(0.05)
  .borderRadius(6).borderColor($r('app.color.color_333'))
  .fontSize($r('app.float.font_20')).fontWeight(FontWeight.Medium)
  .backgroundColor(Color.White).placeholderColor($r('app.color.color_999'))
  .maxLength(isPwd ? 6 : 11)
  .type(isPwd ? InputType.PhoneNumber : InputType.PhoneNumber)
}

/*输入验证码*/
@Extend(Row) function rowType() {
  .justifyContent(FlexAlign.SpaceBetween)
  .justifyContent(FlexAlign.Start)
  .margin({top:$r('app.float.size_16'),left:$r('app.float.size_18'),right:$r('app.float.size_18')})
}

/*图片的显示问题*/
@Extend(Image) function imageAgree() {
  .width($r('app.float.size_18'))
  .height($r('app.float.size_18'))
  .margin({left:$r('app.float.size_48')})
}

/* 获取验证码*/
@Extend(Button) function btnType() {
  .backgroundColor(Color.White).type(ButtonType.Normal)
  .width($r('app.float.size_120'))
  .borderRadius($r('app.float.size_6')).borderWidth(0.05)
  .borderColor($r('app.color.color_333'))
  .fontColor($r('app.color.color_444'))
  .margin({left:$r('app.float.size_8')})
  .height($r('app.float.size_50'))
}

/*登陆按钮的设置*/
@Extend(Button) function loginBtnType() {
  .margin({left:$r('app.float.size_18'),right:$r('app.float.size_18'),top:$r('app.float.size_70')})
  .backgroundColor($r('app.color.color_cb'))
  .height($r('app.float.size_60'))
  .fontSize($r('app.float.font_18'))
  .width('90%')
  .borderRadius($r('app.float.size_30'))
  .type(ButtonType.Normal)
}