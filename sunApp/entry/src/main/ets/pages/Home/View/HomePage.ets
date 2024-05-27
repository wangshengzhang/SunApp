
import hilog from '@ohos.hilog'
import { NavigationBar } from  '../../../components/NavigationBar'
import { HomeModel } from '../Model/HomeModel'
import  HomeViewModel from '../ViewModel/HomeViewModel'


@Entry
@Component
 export struct HomePage  {

   @State dataList: HomeModel[] = []

   aboutToAppear() {

      HomeViewModel.getFunction((list) => {
         this.dataList = list
      })
   }

   build() {
      Column() {
        NavigationBar({title: "首页", backButton: false, alpha: 1}).align(Alignment.TopStart)
        List() {
           ForEach(this.dataList, (item,index) => {
             itemCell(item,index)
           })
        }.width('100%').height($r('app.float.home_contain_width'))
        .backgroundColor($r('app.color.color_f5f5f5'))
        .listDirection(Axis.Horizontal)
        .padding({top:$r('app.float.size_text_18')})
      }
     .height('100%')
     .width('100%')
     .backgroundColor(Color.Pink).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
   }
}

@Builder function itemCell(homeModel:HomeModel,index:number) {

  Column() {


  }.width($r('app.float.home_cell_width'))
  .height($r('app.float.home_cell_height'))
  .backgroundColor('#' + Math.floor(Math.random()*16777215).toString(16))
  .margin({left:index == 0 ? $r('app.float.size_24') : $r('app.float.size_8'),
      right:index == 10 ? $r('app.float.size_24') : 0 })
  .borderRadius($r('app.float.size_text_12'))
}
