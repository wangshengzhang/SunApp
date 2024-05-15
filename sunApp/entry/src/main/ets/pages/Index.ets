import router from '@ohos.router';
import url from '@ohos.url';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  fn = () => {
    this.message = "hello HOMOS"
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        //Image('https://pics0.baidu.com/feed/c995d143ad4bd11385dc8e81f132e4024afb059e.jpeg?token=46369a22ad4bb06851dc71330bf25f7d').width("100%").height('50%')
        Button("点击跳转第三方").width('50%').height(50).onClick(() =>jumpnewView())
      }
      .width('100%')
    }
    .height('100%')
  }
}

function jumpnewView(){
  router.pushUrl(
    {
      url:"pages/CusomContainer"
    },
    router.RouterMode.Standard,
    (err) => {
      if(err){
        console.log('路由失败')
      }
    }
  )


}
