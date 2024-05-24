
import { NavigationBar } from  '../../../components/NavigationBar'
import { HomeModel } from '../Model/HomeModel'


@Entry
@Component
 export struct HomePage  {

  @State dataList: HomeModel[] = []

   build() {
      Column(){
        NavigationBar({title: "首页", backButton: false, alpha: 1}).align(Alignment.TopStart)
        List(){
          ForEach(this.dataList, (item) => {

          })
        }
      }
     .height('100%')
     .width('100%')
     .backgroundColor(Color.Pink).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
   }


}
