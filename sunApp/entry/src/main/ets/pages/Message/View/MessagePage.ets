
import {NavigationBar} from '../../../components/NavigationBar'


@Entry
@Component
export struct MessagePage {
  build() {
    Column(){
      NavigationBar({ title: "消息", backButton: false, alpha: 1 }).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.color_f5f5f5')).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
  }
}