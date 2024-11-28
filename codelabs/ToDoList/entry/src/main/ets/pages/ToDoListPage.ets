import ToDoItem from '../view/ToDoItem';

@Entry
@Component
struct ToDoListPage {
  private totalTasks: Array<string> = [];

  aboutToAppear(): void {
    // this.totalTasks =
  }

  build() {
    Column() {
      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({ content: item })
      }, (item: string) => JSON.stringify(item))
    }
  }
}