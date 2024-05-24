
import List from '@ohos.util.List';
import { BaseViewModel, ResultCallback } from '../../../utils/base/BaseViewModel';
import { HomeModel } from '../Model/HomeModel';


export class  HomeViewModel extends BaseViewModel {

  @State dataList: HomeModel[] = []
  @State list  = [0,1,2,3,4,5,6,7,8,9,10]
  async getFunction(resultCallback? : ResultCallback) {
    this.list.forEach(element => {
      let home: HomeModel = {
        icon: 'icon.png',
        logo: 'logo.png',
        hotelName: 'Hotel Name',
        start: 'Start Date',
        review: 'Review',
        km: 'Distance',
        price: 'Price',
        roomNight: 'Room Night',
        taxes: 'Taxes',
        numCount: 'Number Count'
      }
      this.dataList.push(home)
    });

  }
}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;