import window from '@ohos.window'
import { NavigationBar } from '../../../components/NavigationBar'
import { ActivityModel } from '../Model/ActivityModel'
import ActivityViewModel from '../ViewModel/ActivityViewModel'

@Entry
@Component
struct ActivityPage {
  @State dataList: ActivityModel[] = []
  @State barHeight : number = 90
  aboutToAppear(){
    ActivityViewModel.getActivity((list)=>{
      this.dataList = list
    })
  }

  setSystemStatusBar() {
    let context = getContext(this)
    window.getLastWindow(context, (error, data) => {
      //1、设置系统状态栏
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      //这里为什么要自己设置一个高度？因为系统返回的高度太高了，并不能正确的返回系统状态栏的高度，自己二次设置一个接近的值
      avoidArea.topRect.height = 90
      let statusBarHeight = avoidArea.topRect.height
      let bottomHeight = avoidArea.bottomRect.height
      this.barHeight =  bottomHeight + statusBarHeight
    })
  }

  build() {
    Column() {
       Stack() {
         /// 图片的列表数据源
         List() {
           ForEach(this.dataList, (item,index) => {
             activityItem(item,index)
           })
         }.ListStyle(this.barHeight)
         /// 导航栏
         NavigationBar({title: '热爱计划', backButton: true, alpha: 1}).align(Alignment.TopStart)
       }.stackBar()
    }
  }
}

/*活动的Cell item */
@Builder function activityItem(item:ActivityModel,index:number){
  Column() {
    Image(item.icon)
  }.width(item.width)
}

/*增加 从顶部 布局*/
@Extend(Stack) function stackBar() {
  .align(Alignment.TopStart).alignContent(Alignment.TopStart)
}

/* list 的属性及设计 */
@Extend(List) function ListStyle(barHeight:number) {
  .borderStyle(BorderStyle.Solid).width('100%').edgeEffect(EdgeEffect.None).padding({top:barHeight})
  .backgroundColor($r('app.color.color_f5f5f5'))
  .listDirection(Axis.Vertical).height('100%')
}