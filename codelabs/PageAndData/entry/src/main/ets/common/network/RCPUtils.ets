/**
 * 进行 RCP 网络请求
 * 1. 使用 RCP 发起 GET 请求，获取一张箭头图片并保存在沙箱路径中，并返回沙箱路径对应的 uri，以便使用箭头图片作为首页列表的布局元素
 * 2. 使用 RCP 发起 POST 请求，获取官网中的图片与文本信息，并将其封装在实体类数组中，以便将这些信息作为首页列表的布局元素
 */

import { rcp } from '@kit.RemoteCommunicationKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import ResponseData from '../../viewmodel/ResponseData/ResponseData';
import ListInfo from '../../viewmodel/ResponseData/ListInfo';

const TAG: string = 'RCPUtils';
const list_source: string = 'https://svc-drcn.developer.huawei.com/community/servlet/consumer/' +
  'partnerActivityService/v1/developer/activity/terminalActivities/list';

export class RCPUtils {
  rcpSession: rcp.Session;

  constructor() {
    this.rcpSession = rcp.createSession();
  }

  async getRCPRequest(cacheDir: string): Promise<string> {
    let responsePictureUri: string = '';
    await this.rcpSession.get('https://developer.huawei.com/system/modules/org.opencms.portal.template.core/' +
      'resources/harmony/img/jiantou_right.svg')
      .then((response) => {
        let filePath = cacheDir + '/test.svg';
        let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        responsePictureUri = fileUri.getUriFromPath(filePath);
        fileIo.writeSync(file.fd, response.body);
        fileIo.closeSync(file.fd);
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, TAG, `err: err code is ${err.code}, err message is ${JSON.stringify(err)}`);
      });
    return responsePictureUri;
  }

  async postRCPRequest(): Promise<ListInfo[]> {
    let responseData: Array<ListInfo> = [];
    let requestContent: rcp.RequestContent = {
      'status': '1',
      'belong': '1',
      'language': 'cn',
      'needTop': 1,
      'displayChannel': [1, 3],
      'count': 4,
      'pagestart': 1,
      'type': '1,4,5,6'
    }
    await this.rcpSession.post(list_source, requestContent).then((response) => {
      let result: ResponseData = response.toJSON() as ResponseData;
      responseData = result.value.list;
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, TAG, `err: err code is ${err.code}, err message is ${JSON.stringify(err)}`);
    });
    return responseData;
  }

  destroySession() {
    this.rcpSession.close();
  }
}
