import router from '@ohos.router'
@Entry
@Component
struct SplashPage {

  @State isJumpIn :boolean = false
  @State pageUrl : string = "pages/Splash/MainPage"


  aboutToAppear(){
    setTimeout(()=>{
      if (!this.isJumpIn) {
        router.replaceUrl({url:this.pageUrl})
      }
    },3000)
  }

  build() {

      Stack({ alignContent: Alignment.BottomEnd }){
        Image($r('app.media.launch_icon')).objectFit(ImageFit.Cover)
        Button("点击体验").margin({right:20,bottom:100}).width('35%').height(60).borderRadius(30).backgroundColor(0x6ccccc).onClick(()=>{
          this.isJumpIn = true
          router.replaceUrl({url:this.pageUrl})
        }).opacity(0.8)
      }.width("100%").height("100%").backgroundColor($r("app.color.color_white"))

  }


  jumperMainPage() {

    router.replaceUrl({url:"pages/Test01"})
  }


}