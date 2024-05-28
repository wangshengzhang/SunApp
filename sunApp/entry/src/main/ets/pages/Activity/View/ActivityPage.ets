import window from '@ohos.window'
import { NavigationBar } from '../../../components/NavigationBar'
import { ActivityModel } from '../Model/ActivityModel'
import ActivityViewModel from '../ViewModel/ActivityViewModel'

@Entry
@Component
struct ActivityPage {

  /*导航栏的高度*/
  @State barHeight : number = 90

  /* 获取导航栏的状态栏高度 */
  setSystemStatusBar() {
    window.getLastWindow(getContext(this),(error, data) => {
      //1、设置系统状态栏
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      //2、设置初始化的 高度
      avoidArea.topRect.height = 90
      //3、设置 该组件 的bar 高度
      this.barHeight =  avoidArea.topRect.height + avoidArea.bottomRect.height
    })
  }

  /* 进入该页面的获取 viewModel */
  aboutToAppear(){
    ActivityViewModel.getActivity()
  }

  /*开始布局*/
  build() {
    Column() {
       Stack() {
         /// 图片的列表数据源
         List() {
           ForEach(ActivityViewModel.dataSource, (item,index) => {
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