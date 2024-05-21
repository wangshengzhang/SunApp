@Entry
@Component
struct SplashPage {

  build() {

    Column(){
      Image($r('app.media.launch_icon')).objectFit(ImageFit.Fill)
    }.width('100%').height('100%')

  }


}