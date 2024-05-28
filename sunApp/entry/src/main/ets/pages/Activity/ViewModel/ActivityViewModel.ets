
  import { BaseViewModel, ResultCallback } from '../../../utils/base/BaseViewModel';
  import { ActivityModel } from '../Model/ActivityModel'

  export class ActivityViewModel extends  BaseViewModel {

    dataSource : ActivityModel[] = []

    dataArray = [
        $r('app.media.activioty_icon_1'),
        $r("app.media.activioty_icon_2"),
        $r("app.media.activioty_icon_3"),
        $r("app.media.activioty_icon_4"),
        $r("app.media.activioty_icon_5"),
        $r('app.media.activioty_icon_6'),
        $r('app.media.activioty_icon_7'),
        $r('app.media.activioty_icon_8'),
        $r('app.media.activioty_icon_9'),
        $r('app.media.activioty_icon_10'),
        $r('app.media.activioty_icon_11'),
        $r('app.media.activioty_icon_12'),
        $r('app.media.activioty_icon_13'),
        $r('app.media.activioty_icon_14'),
        $r('app.media.activioty_icon_15'),
        $r('app.media.activioty_icon_16'),
        $r('app.media.activioty_icon_17'),
        $r('app.media.activioty_icon_18')
    ]

    dataList = [
        '254','200','233','132','132','498','198','198','198',
        '198','198','64','164','136','136','136','136','334'
    ]

    async getActivity(resultCallback? : ResultCallback) {
       this.dataSource = []
       this.dataArray.forEach((element,index)=> {
         let model : ActivityModel = {
           index: index,
           icon:element,
           width: '100%',
           height: this.dataList[index]
         }
         this.dataSource.push(model)
       });
     }
  }

  let  activityViewModel = new ActivityViewModel()
  export default activityViewModel as  ActivityViewModel