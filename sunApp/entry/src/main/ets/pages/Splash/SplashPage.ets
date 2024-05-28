import router from '@ohos.router'
import { RoutePath } from '../../routes/RoutePath'
import { Router } from '../../routes/Router'

@Entry
@Component
struct SplashPage {

  @State isJumpIn :boolean = false

  aboutToAppear(){
    setTimeout(()=>{
      if (!this.isJumpIn) {
        Router.replaceUrl(RoutePath.MainPage)
      }
    },3000)
  }

  build() {

      Stack({ alignContent: Alignment.BottomEnd }){
        Image($r('app.media.launch_icon')).objectFit(ImageFit.Cover)
        Button("点击体验").margin({right:20,bottom:100}).width('35%').height(60).borderRadius(30).backgroundColor(0x6ccccc).onClick(()=>{
          this.isJumpIn = true
          Router.replaceUrl(RoutePath.MainPage)
        }).opacity(0.8)
      }.width("100%").height("100%").backgroundColor($r("app.color.color_white"))

  }
}