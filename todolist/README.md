# flutter-todolist

## 💬 설명

이 App은 사용자가 할 일을 추가하고 편집할 수 있도록 도움을 주는 간단한 모바일 애플리케이션입니다.

&nbsp;

## 🖥️ 화면 구성

| 초기화면 | 목록화면 |
|:----:|:----:|
| <img src="https://github.com/kmseunh/flutter-projects/assets/105186724/799dfdee-78ef-46ee-b587-34d7f318b983" width="50%"> | <img src="https://github.com/kmseunh/flutter-projects/assets/105186724/6a960df5-78c1-4cdb-962d-95cea7953704" width="50%"> |

&nbsp;

## 🛠️ 기능 설명

- 사용자는 플로팅 액션 버튼을 눌러 새로운 할 일을 추가할 수 있습니다. 다이얼로그를 통해 새로운 할 일의 제목을 입력할 수 있습니다.
- 할 일 목록에서 각 항목의 제목을 탭하면 해당 할 일을 편집할 수 있는 다이얼로그가 표시됩니다. 여기서 사용자는 할 일의 제목을 수정할 수 있습니다.
- 사용자는 할 일 목록에서 각 항목을 좌우로 스와이프하여 해당 할 일을 삭제할 수 있습니다.
- 각 할 일 항목의 우측에는 완료 여부를 나타내는 체크박스가 있습니다. 사용자는 체크박스를 터치하여 할 일을 완료 상태로 변경할 수 있습니다.

&nbsp;

## </img> 주요 코드

```dart
class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Dismissible(
            key: Key(todo.title),
            onDismissed: (direction) {
              setState(() {
                todos.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Todo deleted'),
                ),
              );
            },
            child: TodoItem(
              todo: todo,
              onChanged: (value) {
                setState(() {
                  todo.isDone = value!;
                });
              },
              onTap: () {
                _editTodo(todo);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
```
