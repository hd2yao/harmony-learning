import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {
  windowStage: window.WindowStage | undefined = undefined;
  tag: string = 'EntryAbility';
  domain: number = 0X0000;
  want: Want | undefined = undefined;
  launchParam: AbilityConstant.LaunchParam | undefined = undefined;

  windowStageEventFunc: (data: window.WindowStageEventType) => void = (data: window.WindowStageEventType): void => {
    hilog.info(
      this.domain,
      'Succeeded in enabling the listener for window stage event changes. Data: %{public}s',
      JSON.stringify(data) ?? ''
    )
  }


  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.want = want;
    this.launchParam = launchParam;
    hilog.info(this.domain, this.tag, '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(this.domain, this.tag, '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.windowStage = windowStage;

    // 为 WindowStage 设置事件订阅（获取/失焦、可见/不可见）
    try {
      windowStage.on('windowStageEvent', this.windowStageEventFunc)
    } catch (exception) {
      hilog.error(
        this.domain,
        'Failed to enable the listener for window stage event changes. Cause: %{public}',
        JSON.stringify(exception) ?? ''
      );
    }

    // Main window is created, set main page for this ability
    hilog.info(this.domain, this.tag, '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/LifeCyclePage', (err, data) => {
      if (err.code) {
        hilog.error(this.domain, this.tag, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(this.domain, this.tag, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    try {
      this.windowStage?.off('windowStageEvent');
    } catch (exception) {
      hilog.error(this.domain, 'Failed to disable the listener for window stage event changes. Cause: %{public}s',
        JSON.stringify(exception));
    }
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(this.domain, this.tag, '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(this.domain, this.tag, '%{public}s', 'Ability onBackground');
  }
}
