
import { NavigationBar } from '../../../components/NavigationBar'

@Entry
@Component
export struct DiscoverPage {
  build() {
    Column(){
      NavigationBar({ title: "发现", backButton: false, alpha: 1 }).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.White).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
  }
}