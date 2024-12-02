import { common, Want } from '@kit.AbilityKit'

@Entry
@Component

/*
  在页面中获取 UIAbility 实例的上下文信息，包括：
  1. 导入依赖资源 context 模块
  2. 在组件中定义一个 context 变量
 */
struct Page_EventHub {
  private context = getContext(this) as common.UIAbilityContext;

  eventHubFunc(): void {
    // 不带参数触发自定义 “event1” 事件
    this.context.eventHub.emit('event1');
    // 带1个参数触发自定义“event1”事件
    this.context.eventHub.emit('event1', 1);
    // 带2个参数触发自定义“event1”事件
    this.context.eventHub.emit('event1', 2, 'test');
  }

  startAbilityTest(): void {
    let want: Want = {
      // Want 参数信息
    };
    this.context.startAbility(want);
  }

  build() {
  }
}