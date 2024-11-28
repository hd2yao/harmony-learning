@Component
export default struct ToDoItem {
  private content?: string;
  @State isComplete: boolean = false;

  @Builder labelIcon(icon: Resource) {
    Image(icon)
  }

  build() {
  }
}