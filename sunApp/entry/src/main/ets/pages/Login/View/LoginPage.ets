import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image'
import { NavigationBar } from '../../../components/NavigationBar'
import ViewModel from  '../ViewModel/LoginViewModel'

@Entry
@Component
struct LoginPage {

  @State agree : boolean = false

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogView(),
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
         /// 判断 是否 已经 同意 协议
        if (ViewModel.agree == false) {
          this.dialogController.open()
          //ViewModel.AgreeQueYiAction()
        } else {
           ViewModel.NetWorkLogin()
        }
      })

      /// 协议
      Row() {
        Image(ViewModel.agree != true ? $r('app.media.login_circle_nor') :$r('app.media.login_circle_sel')).imageAgree()
        Text($r('app.string.Login_agree_title')).fontColor($r('app.color.color_666'))
        .fontSize($r('app.float.font_14')).fontWeight(FontWeight.Medium).margin({left:$r('app.float.size_4')})
        Text($r('app.string.Login_agree_policy')).proxyTextType()
      }.onClick(()=>{
        ViewModel.agree = !ViewModel.agree
      }).XueYiType(true)

     /// 协议部分
     Row(){
       Text($r('app.string.Login_agree_policy_half')).proxyTextType().margin({left:$r('app.float.size_72')})
     }.XueYiType(false).onClick(()=>{
       ViewModel.agree = !ViewModel.agree
     })
     Blank()
     /// 写这个App 的机构信息
     Text($r('app.string.Login_agree_ICP')).margin({bottom:$r('app.float.size_65')})
       .fontSize($r('app.float.font_14'))
       .fontColor($r('app.color.color_999'))
    }.width('100%').height('100%').justifyContent(FlexAlign.Start).align(Alignment.TopStart)

  }
}

@CustomDialog
struct CustomDialogView {
  controller: CustomDialogController

  build() {
    Column() {

      Text($r('app.string.Login_wenXi_msg'))
        .margin({top:$r('app.float.size_25')})
        .fontSize($r('app.float.font_20'))
        .fontWeight(FontWeight.Bold)

      Text($r('app.string.Login_policy_Ruler'))
      .margin({top:$r('app.float.size_10')}).maxLines(100).baselineOffset(10).lineHeight($r('app.float.size_24'))
      .fontSize($r('app.float.font_16')).fontColor($r('app.color.color_666'))
      .fontWeight(FontWeight.Medium).margin({left:$r('app.float.size_20'),right:$r('app.float.size_20'),top:$r('app.float.size_15')})

      Divider().height(0.15).backgroundColor($r('app.color.color_999')).margin({top:$r('app.float.size_6')})

      Row(){
        Button($r('app.string.Login_Ruler_agreet_no')).margin({left:$r('app.float.size_25')})
        Button($r('app.string.Login_Ruler_agreet')).margin({right:$r('app.float.size_25')})
      }.justifyContent(FlexAlign.SpaceBetween).align(Alignment.Center).margin({top:$r('app.float.size_15')}).width('100%')

    }.height($r("app.float.size_220"))
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