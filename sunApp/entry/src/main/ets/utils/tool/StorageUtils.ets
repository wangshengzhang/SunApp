import dataPreferences from '@ohos.data.preferences'


const defaultPreferenceName = "OPEN_EYE_PREFERENCES"

type ValueType = number | string | boolean | Array<number> | Array<string> | Array<boolean>|any;


export class StorageUtils {

  private constructor() {

  }


  static readonly context = getContext();

  /**
   * 获取Prefer实例
   * @param preferenceName
   * @returns
   */
  static async getPreferences(preferenceName: string = defaultPreferenceName) {

    try {
      dataPreferences.getPreferences(this.context, defaultPreferenceName, function (err, val) {
        if (err) {
          console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
          return;
        }
        preferences = val;
        console.info("Succeeded in getting preferences.");
      })
    } catch (err) {
      console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
    }
  }

  static async put(key: string, value: ValueType, preferenceName: string = defaultPreferenceName) {

    try {
      preferences.put(key, value, function (err) {
        if (err) {
          console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
          return;
        }
        console.info("Succeeded in putting value of 'startup'.");
      })
    } catch (err) {
      console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
    }
  }

  /**
   * 获取值
   * @param key
   * @param defaultValue
   * @param preferenceName
   * @returns
   */
  static async get(key: string, defaultValue: ValueType = "", preferenceName: string = defaultPreferenceName) {
    // 获取实例
    try {
      preferences.get(key, defaultValue, function (err, val) {
        if (err) {
          console.error("Failed to get value of 'startup'. code =" + err.code + ", message =" + err.message);
          return;
        }
        console.info("Succeeded in getting value of 'startup'. val： " + val);
      })
    } catch (err) {
      console.error("Failed to get value of 'startup'. code =" + err.code + ", message =" + err.message);
    }
  }

  /**
   * 删除值
   * @param key
   * @param preferenceName
   * @returns
   */
  static async delete(key: string, preferenceName: string = defaultPreferenceName) {
    let preferences = await this.getPreferences(preferenceName)
    return await preferences.delete(key)
  }

  /**
   * 清空
   * @param preferenceName
   * @returns
   */
  static async clear(preferenceName: string = defaultPreferenceName) {
    let preferences = await this.getPreferences(preferenceName)
    return await preferences.clear()
  }
}