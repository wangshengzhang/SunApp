
import List from '@ohos.util.List';
import { BaseViewModel, ResultCallback } from '../../../utils/base/BaseViewModel';
import { HomeModel } from '../Model/HomeModel';


export class  HomeViewModel extends BaseViewModel {

  dataList: HomeModel[] = []
  list  = [0,1,2,3,4,5,6,7,8,9,10]
  async getFunction(resultCallback? : ResultCallback) {
    this.list.forEach((element,index) => {
      let home: HomeModel = {
         icon: $r('app.media.magic_icon'),
         logo: 'logo.png',
         hotelName: 'Hotel Name ' + index.toString(),
         statue: index % 2,
         review: 'Review',
         km: 'Distance',
         price: 'Price',
         roomNight: 'Room Night',
         taxes: 'Taxes',
         numCount: 'Number Count'
      }
      this.dataList.push(home)
    });
    resultCallback?.(this.dataList)

  }
}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;