/*
  由于多个 ListItem 内容基本一致，我们将列表项的内容封装为实体类
  并通过循环渲染 ListItem 来避免代码冗余
 */

export default class ItemData {
  /**
   * ID of list item
   */
  id: number;
  /**
   * Text of list item
   */
  title: ResourceStr;
  /**
   * Image of list item
   */
  image: Resource;
  /**
   * Other resource of list item
   */
  others?: ResourceStr;

  constructor(id: number, title: ResourceStr, image: Resource, others?: ResourceStr) {
    this.id = id;
    this.title = title;
    this.image = image;
    this.others = others;
  }
}