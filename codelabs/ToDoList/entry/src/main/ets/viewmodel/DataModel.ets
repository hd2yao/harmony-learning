import CommonConstants from "../common/constants/CommonConstants";

// 保存和操作页面上显示的数据
export class DataModel {
  private tasks: Array<string> = CommonConstants.TODO_DATA;

  getData(): Array<string> {
    return this.tasks;
  }
}

export default new DataModel();