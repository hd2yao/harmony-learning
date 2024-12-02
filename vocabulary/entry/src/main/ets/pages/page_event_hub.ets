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

  startAbilityTest(): void {
    let want: Want = {
      // Want 参数信息
    };
    this.context.startAbility(want);
  }

  build() {
  }
}