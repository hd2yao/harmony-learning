/**
 * 进行 HTTP 网络请求
 * 1. 使用 HTTP 发起 GET 请求，获取一张箭头图片并保存在沙箱路径中，并返回沙箱路径对应的 uri，以便使用箭头图片作为首页列表的布局元素
 * 2. 使用 HTTP 发起 POST 请求，获取官网中的图片与文本信息，并将其封装在实体类数组中，以便将这些信息作为首页列表的布局元素
 */

import { http } from '@kit.NetworkKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';


export class HttpUtils {
  httpRequest: http.HttpRequest;

  constructor() {
    this.httpRequest = http.createHttp();
  }

  async getHttpRequest(cacheDir: string): Promise<string> {
    let responsePictureUri: string = '';
    await this.httpRequest.request('https://developer.huawei.com/system/modules/org.opencms.portal.template.core/' +
      'resources/harmony/img/jiantou_right.svg',
      {method: http.RequestMethod.GET }).then((data: http.HttpResponse) => {
      let filePath = cacheDir + '/test.svg';
      let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      responsePictureUri = fileUri.getUriFromPath(filePath);
      fileIo.writeSync(file.fd, data.result as ArrayBuffer);
      fileIo.closeSync(file.fd);
    })
    return responsePictureUri;
  }
}