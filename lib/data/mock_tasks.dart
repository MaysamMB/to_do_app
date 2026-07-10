import '../models/tasks.dart';

const List<Task> mockTasks = [
  Task(
    name: 'Zina',
    id: '1',
    title: 'Study Flutter',
    description:
        'Finish learning Flutter widgets and layouts. Focus on StatelessWidget vs StatefulWidget, '
        'understand how the widget tree rebuilds, and practice building responsive layouts using '
        'Row, Column, and Expanded.',
    isCompleted: true,
    priority: 'High',
  ),
  Task(
    name: 'Banan',
    id: '2',
    title: 'Complete Dart Exercises',
    description:
        'Solve practice problems on functions and collections. Cover higher-order functions, '
        'closures, and common List/Map operations like map, where, and fold to get more comfortable '
        'with functional-style Dart code.',
    isCompleted: true,
    priority: 'Low',
  ),
  Task(
    name: 'Ayham',
    id: '3',
    title: 'Read Riverpod Documentation',
    description:
        'Understand the basics of state management. Go through Provider, StateProvider, and '
        'StateNotifierProvider, and take notes on when each one should be used in a real app.',
    isCompleted: false,
    priority: 'High',
  ),
  Task(
    name: 'Moath',
    id: '4',
    title: 'Workout',
    description:
        'Go to the gym for one hour. Do a full upper-body session followed by 20 minutes of cardio, '
        'then stretch properly to avoid soreness the next day.',
    isCompleted: true,
    priority: 'Mid',
  ),
  Task(
    name: 'Manal',
    id: '5',
    title: 'Buy Groceries',
    description:
        'Milk, eggs, bread, and fruits. Also check if we still have coffee and olive oil, and pick up '
        'some vegetables for the week since the fridge is almost empty.',
    isCompleted: false,
    priority: 'Low',
  ),
  Task(
    name: 'Tala',
    id: '6',
    title: 'Prepare Presentation',
    description:
        'Finish the slides for the Flutter project. Add screenshots of the final UI, write short '
        'speaker notes for each section, and double-check the timeline slide before sending it to the team.',
    isCompleted: true,
    priority: 'Mid',
  ),
  Task(
    name: 'Raneen',
    id: '7',
    title: 'Train for Presentation',
    description:
        'Finish training for the Flutter project presentation. Practice the delivery out loud at least '
        'twice, time each section, and prepare answers for likely questions about the architecture.',
    isCompleted: false,
    priority: 'High',
  ),
  Task(
    name: 'Samah',
    id: '8',
    title: 'Review Git Basics',
    description:
        'Practice branching, merging, and resolving conflicts. Try a few merge conflicts locally on '
        'purpose to get comfortable resolving them, and review the difference between merge and rebase.',
    isCompleted: false,
    priority: 'Low',
  ),
  Task(
    name: '',
    id: '9',
    title: 'Write Unit Tests',
    description:
        'Add unit tests for the task repository. Cover the create, update, delete, and fetch methods, '
        'including at least one test for an edge case like an empty task list.',
    isCompleted: true,
    priority: 'Low',
  ),
  Task(
    name: 'Noura',
    id: '10',
    title: 'Refactor Code',
    description:
        'Improve code readability and remove duplication. Extract repeated widget code into reusable '
        'components, rename unclear variables, and split the large build method into smaller functions.',
    isCompleted: false,
    priority: 'High',
  ),
  Task(
    name: 'Lama',
    id: '11',
    title: 'Update Resume',
    description:
        'Add recent Flutter projects and new skills. Mention the to-do app project specifically, '
        'highlight the state management work with Riverpod, and update the skills section with recent tools.',
    isCompleted: true,
    priority: 'Mid',
  ),
  Task(
    name: 'Maysam',
    id: '12',
    title: 'Read Clean Code',
    description:
        'Finish two chapters from the Clean Code book. Take notes on the naming conventions chapter '
        'especially, since it directly applies to the current project structure and file naming.',
    isCompleted: true,
    priority: 'Mid',
  ),
  Task(
    name: 'Joy',
    id: '13',
    title: 'Build Todo App',
    description:
        'Implement CRUD operations with Riverpod. Wire up create, read, update, and delete for tasks, '
        'connect the TaskDetailsPage to real state instead of mock data, and test each action manually '
        'before moving on to persistence.',
    isCompleted: false,
    priority: 'High',
  ),
  Task(
    name: 'Shemaa',
    id: '14',
    title: 'Fix UI Bugs',
    description:
        'Resolve layout issues on small screen devices. Check overflow errors on narrow screens, fix '
        'the chip row wrapping incorrectly, and confirm the RTL layout still looks right after the fixes.',
    isCompleted: true,
    priority: 'Low',
  ),
  Task(
    name: 'Sara',
    id: '15',
    title: 'Practice Algorithms',
    description:
        'Solve three array and string problems. Focus on two-pointer techniques and sliding window '
        'patterns, and write down the time complexity for each solution afterward.',
    isCompleted: false,
    priority: 'High',
  ),
  Task(
    name: '',
    id: '16',
    title: 'Organize Workspace',
    description:
        'Clean the desk and organize project files. Archive old project folders that are no longer '
        'active, and set up a clear naming convention for new ones going forward.',
    isCompleted: true,
    priority: 'Low',
  ),
  Task(
    name: '',
    id: '17',
    title: 'Plan Next Sprint',
    description:
        'Create tasks and priorities for the upcoming week. Break down the remaining CRUD work into '
        'smaller tasks, assign rough priorities to each one, and flag anything that depends on someone '
        'else finishing first.',
    isCompleted: false,
    priority: 'High',
  ),
];