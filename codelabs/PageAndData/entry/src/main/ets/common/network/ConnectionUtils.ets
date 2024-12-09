/**
 * 网络连接工具：
 * 1. 能够完成是否有网络连接的校验，从而在点击登录时，不仅对账号密码进行非空校验，还要完成对网络状态的校验，无网络时不进行跳转
 * 2. 能够订阅网络状态，在网络状态变化时，主动触发弹窗提醒用户网络状态的变化
 */

import { connection } from '@kit.NetworkKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'ConnectionUtils';

/**
 * ConnectionUtils 类提供了监听网络的能力
 */
export class ConnectionUtils {
  /**
   * 检查监控网络是否已连接的方法
   */
  async isNetworkConnected(): Promise<boolean> {
    let result: boolean = false;
    // 通过 connection.getDefaultNet() 获取默认网络的句柄
    await connection.getDefaultNet().then(async (data: connection.NetHandle) => {
      // 当句柄的 netId 为 0 时，表示无网络连接
      if (data.netId === 0) {
        hilog.info(0x0000, TAG, 'network error');
        return;
      }

      // 使用 connection.getNetCapabilities() 将网络句柄传入，打印网络类型
      await connection.getNetCapabilities(data).then(
        (data: connection.NetCapabilities) => {
          let bearerTypes: Set<number> = new Set(data.bearerTypes);
          let bearerTypesNum = Array.from(bearerTypes.values());
          for (let item of bearerTypesNum) {
            if (item === 0) {
              result = true;
              hilog.info(0x0000, TAG, 'BEARER_CELLULAR');
            } else if (item === 1) {
              result = true;
              hilog.info(0x0000, TAG, 'BEARER_WIFI');
            } else if (item === 3) {
              result = true;
              hilog.info(0x0000, TAG, 'BEARER_ETHERNET');
            } else {
              return;
            }
          }
        })
    })
    return result;
  }
}

export default new ConnectionUtils();