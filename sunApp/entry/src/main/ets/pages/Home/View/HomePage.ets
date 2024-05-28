
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import { NavigationBar } from  '../../../components/NavigationBar'
import { RoutePath } from '../../../routes/RoutePath'
import { Router } from '../../../routes/Router'
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
     .backgroundColor($r('app.color.color_f5f5f5')).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
   }
}

/*法宝的Cell布局*/
@Builder function itemCell(homeModel:HomeModel,index:number) {
  Column() {
    Image($r('app.media.magic_icon')).proxyImage()
    Text(homeModel.hotelName).fontText(false)
    Text(statueName(homeModel.statue)).fontText(true)
  }.columProxy(index).onClick(()=>{
    Router.push(RoutePath.ActivityPage)
  })
}

/*状态的使用问题*/
function statueName(statue:number) : string {
   switch (statue) {
     case 0:
       return '使用中'
     case 1:
       return '可使用'
     case 2:
       return '今日已用'
     default:
       return  '使用中'
   }
}

/*文本状态的属性设置*/
@Extend(Text) function fontText(isStatue : boolean = false){
  .align(Alignment.Center)
  .margin({left:$r('app.float.size_5'),
    right:$r('app.float.size_5'),
    top:isStatue == true ? $r('app.float.size_4') : $r('app.float.size_8')})
  .fontSize($r('app.float.font_13'))
  .fontWeight(isStatue == false ? FontWeight.Bold : FontWeight.Medium)
  .fontColor(isStatue == true ? $r('app.color.color_cb') :$r('app.color.color_333'))
  .height(isStatue == true ? $r('app.float.size_18'):$r('app.float.size_16'))
}

/*图片圆角 的属性和参数设置*/
@Extend(Image) function proxyImage() {
  .width($r('app.float.size_56'))
  .height($r('app.float.size_56'))
  .borderRadius($r('app.float.size_8'))
  .margin({left:$r('app.float.size_22'),right:$r('app.float.size_22'),top:$r('app.float.size_12')})
}

/*上下布局的参数和参数设置*/
@Extend(Column) function columProxy(index:number){
  .width($r('app.float.home_cell_width'))
  .height($r('app.float.home_cell_height'))
  .backgroundColor($r('app.color.start_window_background'))
  //.backgroundColor('#' + Math.floor(Math.random()*16777215).toString(16))
  .margin({left:index == 0 ? $r('app.float.size_24') : $r('app.float.size_8'),
    right:index == 10 ? $r('app.float.size_24') : 0 })
  .borderRadius($r('app.float.size_text_12'))
}
