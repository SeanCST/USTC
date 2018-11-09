### 1. 名字空间

* 使用一个完整的名字空间的语法为  —— `using namespace 名字空间标识符;`
* 使用名字空间中的某特定项的语法为 —— `using 名字空间标识符::成员;`

### 2. C++ 输入输出

* 使用不带参数的操纵符时（如 `hex`，`endl`），必须包含头文件 `iostream`
* 使用带参数的操纵符时（如 `setfill`， `setw`），必须包含头文件 `iomanip`
* 除了 `setw`，其他操纵符将永久地改变它所应用到的输入或输出流的状态
* `setw` 的影响仅持续到下一个输入或输出流操作
* 十六进制 ：`cout << hex << i;` 
* 八进制 ：`cout << oct << i;` 
* 十进制 ：`cout << dec << i;` 
* 操纵输出域宽 ：`cout << set(4) << i;`
* 定义特定的填充字符 ：`cout << setfill(*);`
* 定义浮点数的精度 ：`cout << setfill(*) << fixed << setprecision(2);` —— 输出两位小数，长度不足 `setw(10)`的部分用 ***** 填充，下面使用是以 `cout << setw(10) << a << endl;`的方式反映出前面所预设的格式
* 加上 `cout << fixed` 之后使用 `setprecision(n)` 表示输出的**小数位数**，否则（不加 `fixed`）表示输出的总的**有效位数**。前者为定点表示，后者为浮点表示
* 左对齐 `cout<< left` ，右对齐 `cout << right`，与 `setw()` 搭配使用
* `showpoint / noshowpoint` ：强行显示小数点（位数不足用 0 补充） / 取消强行显示小数点
* `showpos / noshowpos` ： 正数添加 + 号 / 取消
* `skipws / noskipws` ：输入前跳过空格 / 取消 