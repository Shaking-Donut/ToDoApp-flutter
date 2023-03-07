class Todo {
  final bool isChecked;
  final DateTime dateCreated;
  final String title;
  String desc;
  DateTime? dateDue;
  final String todoId;

  Todo(
      {this.dateDue,
      this.desc = '',
      required this.isChecked,
      required this.dateCreated,
      required this.title,
      required this.todoId});
}
