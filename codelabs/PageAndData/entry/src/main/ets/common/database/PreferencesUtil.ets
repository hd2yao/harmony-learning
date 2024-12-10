/**
 * 用户首选项工具：
 * 1. 能够在应用每次启动时，从用户首选项中读取一个与全局字体大小有关的数值（首选项的读取能力）
 * 2. 在想要修改全局字体大小时，将设置保存至用户首选项中，并持久化存储，以便下次应用启动时依旧能获得之前的配置（用户首选项的写入能力）
 */

import { preferences } from '@kit.ArkData';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const KEY_APP_FONT_SIZE = 'appFontSize';
const TAG: string = 'PreferencesUtil';

export class PreferencesUtil {
  preference?: preferences.Preferences;

  // 创建首选项实例
  getFontPreferences(context: Context) {
    this.preference = preferences.getPreferencesSync(context, { name: 'FontPreferences' });
    hilog.info(0x0000, TAG, 'create success');
  }

  // 保存数据并持久化
  saveChangeFontSize(fontSizeOffset: number) {
    this.preference?.putSync(KEY_APP_FONT_SIZE, fontSizeOffset);
    this.preference?.flush(
      (err: BusinessError) => {
        if (err) {
          hilog.error(0x0000, TAG, 'Failed to flush. code =' + err.code + ',' +
            ' message =' + err.message);
          return;
        }
        hilog.info(0x0000, TAG, 'Succeeded in flushing.');
      });
  }

  // 获取首选项中的数据
  getChangeFontSize() {
    let fontSizeOffset: number = 0;
    fontSizeOffset = this.preference?.getSync(KEY_APP_FONT_SIZE, 0) as number;
    return fontSizeOffset;
  }
}

export default new PreferencesUtil();