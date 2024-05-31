
import { ResultCallback } from '../utils/base/BaseViewModel'

@CustomDialog
export  struct CustomDialogView {

  @State title : Resource = $r('app.string.Login_wenXi_msg')
  @State rulerContext : Resource = $r('app.string.Login_policy_Ruler')

  @State firstBtn : Resource = $r('app.string.Login_Ruler_agreet_no')
  @State secondBtn : Resource = $r('app.string.Login_Ruler_agreet')
  resultCallback : ResultCallback

  controller: CustomDialogController

  build() {
    Column() {
      // $r('app.string.Login_wenXi_msg')
      Text(this.title)
        .margin({top:$r('app.float.size_25')})
        .fontSize($r('app.float.font_20'))
        .fontWeight(FontWeight.Bold)

      // $r('app.string.Login_policy_Ruler')
      Text(this.rulerContext)
        .margin({top:$r('app.float.size_10')}).maxLines(100).baselineOffset(10).lineHeight($r('app.float.size_24'))
        .fontSize($r('app.float.font_16')).fontColor($r('app.color.color_666'))
        .fontWeight(FontWeight.Medium).margin({left:$r('app.float.size_20'),right:$r('app.float.size_20'),top:$r('app.float.size_15')})

      Divider().height(0.1).backgroundColor($r('app.color.color_999')).margin({top:$r('app.float.size_6')})

      Row(){
        // $r('app.string.Login_Ruler_agreet_no')
        Button(this.firstBtn)
          .margin({left:$r('app.float.size_15'),top:$r('app.float.size_5')})//,top:$r('app.float.size_10')
          .width('40%').backgroundColor(Color.Transparent).fontColor($r('app.color.color_333')).onClick(()=>{
          this.controller.close()
        })

        Divider().width(0.2).height('100%').backgroundColor($r('app.color.color_999'))
        // $r('app.string.Login_Ruler_agreet')
        Button(this.secondBtn)
          .margin({right:$r('app.float.size_15'),top:$r('app.float.size_5')}) //
          .width('40%').backgroundColor(Color.Transparent).fontColor($r('app.color.color_cb')).onClick(()=>{
          this.resultCallback(this.rulerContext)
          this.controller.close()
        })

      }.justifyContent(FlexAlign.SpaceBetween).align(Alignment.Center).width('100%').height($r('app.float.size_58'))

    }.height($r("app.float.size_210"))
  }
}

