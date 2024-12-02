
let hi: string = 'hello';
hi = 'hello world!';

const hello: string = 'hello';
// hello = 'hello!';

for (let i = 0; i < 10; i ++) {
  console.log(i.toString());
}

function printStudentsInfo(students: string[]): void {
  for (let student of students) {
    console.log(student);
  }
}

let students: string[] = ['Xiao ming', 'Xiao Zhang', 'Xiao Wang', 'Xiao Li'];
students.forEach((student: string) => console.log(student));

enum ColorSet { Red, Green, Blue }
let c: ColorSet = ColorSet.Red;

class ZeroDivisor extends Error {}

function divide(a: number, b: number): number {
  if (b == 0) {
    throw new ZeroDivisor();
  }
  return a/b;
}

function process (a: number, b: number) {
  try {
    let res = divide(a, b);
    console.log('result: ' + res);
  } catch (x) {
    console.log('some error');
  }
}

function processData(s: string) {
  let error: Error | null = null;

  try {
    console.log('Data processed: ' + s);
  } catch (e) {
    error = e as Error;
  } finally {
    if (error != null) {
      console.log(`Error caught: input='${s}', message='${error.message}'`);
    }
  }
}

let sum = (x: number, y: number): number => {
  return x + y;
}

let sum1 = (x: number, y: number) => { return x + y; }
let sum2 = (x: number, y: number) => x + y;

// 闭包
function f(): () => number {
  let count = 0;
  let g = (): number => { count++; return count; };
  return g;
}

// 类
class Person {
  name: string = '';
  surname: string = '';

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  }
  fullName(): string {
    return this.name + this.surname;
  }
}

let p = new Person('John', 'Smith');
console.log(p.fullName());

// 字段
class Person1 {
  name?: string;

  setName(n: string): void {
    this.name = n;
  }

  getName(): string | undefined {
    return this.name;
  }
}

let jack = new Person1();
jack.getName()?.length;

// 方法
class RectangleSize {
  private height: number = 0;
  private width: number = 0;

  constructor(height: number, width: number) {
    this.height = height;
    this.width = width;
  }
  calculateArea(): number {
    return this.height * this.width;
  }
}

let square = new RectangleSize(10, 10);
square.calculateArea();

// 继承
class Person2 {
  name: string = '';
  private _age = 0;
  get age(): number {
    return this._age;
  }
}

class Employee extends Person2 {
  salary: number = 0;
  calculateTaxes(): number {
    return this.salary * 0.42;
  }
}

interface DataInterface {
  now(): string;
}
class MyData implements DataInterface {
  now(): string {
    return 'now';
  }
}

// 父类访问
class RectangleSize1 {
  protected height: number = 0;
  protected width: number = 0;

  constructor(h: number, w: number) {
    this.height = h;
    this.width = w;
  }
  
  draw() {
    /* 绘制边界 */
  }
}
class FilledRectangle extends RectangleSize1 {
  color: string = '';

  constructor(h: number, w: number, c: string) {
    super(h, w);
    this.color = c;
  }

  draw() {
    super.draw();
    super.height;
  }
}

// Record 类型
let map: Record<string, number> = {
  'John': 25,
  'Mary': 21,
}

// 抽象类
abstract class Base {
  field: number;

  constructor(p: number) {
    this.field = p;
  }
}

class Derived extends Base {
  constructor(p: number) {
    super(p);
  }
}

// 接口
interface AreaSize {
  calculateAreaSize(): number; // 方法的声明
  someMethod(): void;     // 方法的声明
}

class RectangleSize2 implements AreaSize {
  private width: number = 0;
  private height: number = 0;
  someMethod(): void {
    console.log('someMethod called');
  }
  calculateAreaSize(): number {
    this.someMethod(); // 调用另一个方法并返回结果
    return this.width * this.height;
  }
}
