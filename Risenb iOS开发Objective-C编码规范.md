#Risenb iOS开发Objective-C编码规范





## 1.类结构

### 1.0 pragma
	
	a.一级pragma： #pragma mark - ---------- xxx ----------
	  二级级pragma：#pragma mark - --- xxx ---
	  三级pragma  #pragma mark xxx 
	b.建议用xcode代码块保存

### 1.1结构
\#import <Xxx.h>

\#import "Xxx.h"

@class Xxx // 能用 @class 就不用 #import ""

\#define XXX xxx  // 宏定义

static NSString * const CellIdentifier = @"CellIdentifier" // 常量



@implemention

\#pragma mark - ---------- 懒加载 ----------

	- (NSMutableArray *)dataSourceArr {
    	if (!_dataSourceArr) {
        	_dataSourceArr = [NSMutableArray array];
    	}
    	return _dataSourceArr;
	}
	...

\#pragma mark - ---------- 生命周期 ----------

	- (instancetype)init {}   
	- (void)viewDidLoad {}  
	- (void)viewWillAppear:(BOOL)animated {}  
	- (void)didReceiveMemoryWarning {}  
	- (void)dealloc {} 
	...


\#pragma mark - ---------- 重写属性合成器 ---------- 

	- (void)setCustomProperty:(id)value {}  
	- (id)customProperty {}  
	...


\#pragma mark - ---------- IBActions ----------

	- (IBAction)submitButtonAction:(id)sender {} 
	...


\#pragma mark - ---------- 重写父类方法 ----------

	- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
	...

\#pragma mark - ---------- 公有方法 ----------
 
	- (void)publicMethod {}  
	...

\#pragma mark - ---------- 私有方法 ----------

\#pragma mark --- 数据初始化 ---

	- (void)initData {

	}

\#pragma mark --- UI布局 ---

	- (void)configUI {

	}

\#pragma mark --- 网络请求 ---

	- (void)netRequest {

	}

\#pragma mark 列表数据网络请求
	...

\#pragma mark --- 设置计时器 ---


\#pragma mark - ---------- 协议方法 ----------

\#pragma mark --- UITextFieldDelegate ---

\#pragma mark --- UITableViewDataSource ---
 
\#pragma mark --- UITableViewDelegate ---

\#pragma mark --- NSCopying ---

	- (id)copyWithZone:(NSZone *)zone {} 

...

@end


## 2.命名、变量、常量、宏、下划线


### 2.1 命名
	a.Apple命名规则尽可能坚持长的，描述性的方法和变量名，使代码尽可能做到自注释。
	b.驼峰命名规则
	c.字符前缀应该经常用在类和常量命名
	e.应为有意义的命名，除循环变量外，不得使用 i, j, k 等单字符作为名称
	d.不得使用关键字、保留字命名，如 id, const, bool 等。
	e.尽可能地避免出现魔术数字，应采用枚举类型、 常量、宏定义等方式赋予数字以具体意义。
	f.除非必要（如名称过长或已为众所周知的缩写），命名不应使用缩写。
	g.除非必要（如特定名称或没有合适的单词），命名应采用规范的英文单词，避免采用汉语拼音。
	h.尽可能用 NSInteger 和 CGFloat 代替 int 和 float
	
	
e.g.命名约定

| 范围 | 命名约定 | 示例 |
| --- |:-------:| ----:|
| NSArray | ...Arr(ay) | dataSourceArr(ay) |
| NSMutableArray | ...M(utable)Arr | dataSourceM(utable)Arr(ay) |
| NSDictionary | ...Dic(tionary) | resultDic(tionary) |
| NSMutableDictionary | ...M(utable)Dic | resultM(utable)Dic(tionary) |
| NSString | ...Str(ing) | accountStr(ing) |
| BOOL | is... | isShowButton |
| BOOL | 形容词 | variable |
| UIView | ...View | shareButtonsBackgroundView |
| UIButton | ...Btn | submitBtn |
| UIButton | ...Button | submitButton |
| UILabel | ...Lab(el) | priceLab(el) |
| 按钮点击 | ...Action | - (void)submitAction |
| 按钮点击 | ...ButtonClick | - (void)submitButtonClick |
	
### 2.2 变量
	变量尽量以描述性的方式来命名
	单个字符的变量命名应该尽量避免，除了在for()循环
	所有变量用属性合成器，而不是成员变量
	
	e.g.
	正确写法：NSString *IDNumberString 
	错误写法：NSString * IDNumberString、NSString* IDNumberString
	
### 2.3 常量
	a.常量是容易重复被使用和无需通过查找和代替就能快速修改值
	b.常量应该使用static来声明
	c.能用常量的地方就不用宏
	d.一定要有前缀，其余部分遵守驼峰命名规则
	
	e.g.
	static NSTimeInterval * const ZHXAuthCodeTimerInterval = 60.0f;
	
	
### 2.4 宏
	a.所有字母大写
	b.单词之间用下划线连接
	
	e.g.
	SCREEN_WIDTH
	
	
### 2.5 下划线
	a.当使用属性时，实例变量应该使用self.来访问和改变
	b.但有特例：在初始化方法里，实例变量(例如，_variableName)应该直接被使用来避免getters/setters潜在的副作用, 懒加载、dealloc方法里都应该直接用 _xxx, 而不是self.xxx
	c.局部变量不应该包含下划线
	d.访问属性的时候统一用self.xxx, 不要用_xxx
	
	
## 3.方法
	a.在方法签名中，应该在方法类型(-/+ 符号)之后有一个空格
	b.在方法各个段之间应该也有一个空格(符合Apple的风格)
	c.在参数之前应该包含一个具有描述性的关键字来描述参数
	d.“and”这个词的用法应该保留
	
### 3.1 Init方法
	a.Init方法应该遵循Apple生成代码模板的命名规则，返回类型应该使用instancetype而不是id。

	- (instancetype)init {  
  		self = [super init];  
  		if (self) {  
    		// ...  
  		}  
  		return self;  
	} 
	
### 3.2 类构造方法
	a.当类构造方法被使用时，它应该返回类型是instancetype而不是id。这样确保编译器正确地推断结果类型。

	@interface Airplane  
	
	+ (instancetype)airplaneWithType:(RWTAirplaneType)type;  

	@end 


## 4.常用语法结构

	
### 4.1 属性
	a.属性特性的顺序应该是storage、atomicity，与在Interface Builder连接UI元素时自动生成代码一致
	b.不可变字符串和block用copy修饰
	c.括号前后应该各保留一个空格 
	d.当生命数组和字典的时候尽可能用范型
	
	e.g.
	NSArray <NSString *> *tableViewDataSourceArray
	...
		
### 4.2 点语法
	a.点语法应该总是被用来访问和修改属性，因为它使代码更加简洁
	
### 4.3 字面值
	a.NSString、NSDictionary、NSArray和NSNumber的字面值应该在创建这些类的不可变实例时被使用。
	
	e.g.
	@[ @"1", @"2" ]、 @{ @"key" : @"value" }、@YES、@(2.5f)、...

## 4.4 布尔值
	a.Objective-C使用YES和NO。因为true和false应该只在CoreFoundation，C或C++代码使用。既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1和一个BOOL能被设置为8位。
	这是为了在不同文件保持一致性和在视觉上更加简洁而考虑。
	
	应该：
	if (someObject) {}  
	if (![anotherObject boolValue]) {} 
	
	不应该：
	if (someObject == nil) {}  
	if ([anotherObject boolValue] == NO) {}  
	
	b.如果BOOL属性的名字是一个形容词，属性就能忽略”is”前缀，但要指定get访问器的惯用名称。例如：
	@property (assign, getter=isEditable) BOOL editable;

### 4.5 枚举类型
	a.当使用enum时，推荐使用新的固定基本类型规格，因为它有更强的类型检查和代码补全。现在SDK有一个宏NS_ENUM()来帮助和鼓励你使用固定的基本类型。

	应该：
	typedef NS_ENUM(NSInteger, RWTLeftMenuTopItemType) {  
  		RWTLeftMenuTopItemMain,  
  		RWTLeftMenuTopItemShows,  
  		RWTLeftMenuTopItemSchedule  
	};
	
	你也可以显式地赋值(展示旧的k-style常量定义)：
	typedef NS_ENUM(NSInteger, RWTGlobalConstants) {  
  		RWTPinSizeMin = 1,  
  		RWTPinSizeMax = 5,  
  		RWTPinCountMin = 100,  
  		RWTPinCountMax = 500,  
	};
	
	旧的k-style常量定义应该避免除非编写Core Foundation C的代码。
	不应该：
	enum GlobalConstants {  
  		kMaxPinSize = 5,  
  		kMaxPinCount = 500,  
	};
	
### 4.6 Case语句
	a.大括号在case语句中并不是必须的，除非编译器强制要求。当一个case语句包含多行代码时，大括号应该加上。

	switch (condition) {  
		case 1:  
	    	// ...  
	    	break;  
  		case 2: {  
          // ...  
          // Multi-line example using braces  
          break;  
       }  
  		case 3:  
    		// ...  
    		break;  
  		default:   
    		// ...  
    		break;
    }
    
	b.有很时候，当相同代码被多个cases使用时，一个fall-through应该被使用。一个fall-through就是在case最后移除’break’语句，这样就能够允许执行流程跳转到下一个case值。为了代码更加清晰，一个fall-through需要注释一下。

	switch (condition) {  
  		case 1:  
    		// ** fall-through! **  
  		case 2:  
    		// code executed for values 1 and 2  
    		break;  
  		default:   
    		// ...  
    		break;  
	}
	
	c.当在switch使用枚举类型时，’default’是不需要的。例如：
	RWTLeftMenuTopItemType menuType = RWTLeftMenuTopItemMain;  
	switch (menuType) {  
  		case RWTLeftMenuTopItemMain:  
    		// ...  
    		break;  
  		case RWTLeftMenuTopItemShows:  
    		// ...  
    		break;  
  		case RWTLeftMenuTopItemSchedule:  
    		// ...  
    		break;  
	}

### 4.7 条件语句
	a.判断条件的括号两边各留一个空格
	b.即使只有一行代码，花括号也不能省
	c.else 与 if 语句的闭括号在同一行
	d.else 两边各留一个空格
	f.尽可能少用 if-else 嵌套

	e.g.
	正确写法
	if (!error) {  
  		return success;  
	} else {
		NSLog(@"xxx");
	}
	
	错误写法
	if (!error)  
  		return success;
  	错误写法
  	if (!error) return success;
	
### 4.8 三元操作符
	a.尽可能用三元操作符
	b.不用用三元操作符嵌套
	b.Non-boolean的变量与某东西比较，加上括号()会提高可读性。如果被比较的变量是boolean类型，那么就不需要括号。

	应该：
	NSInteger value = 5;  
	result = (value != 0) ? x : y;  
	BOOL isHorizontal = YES;  
	result = isHorizontal ? x : y; 
	
	不应该：
	result = a > b ? x = c > d ? c : d : y; 
	
	
	
### 4.9 黄金路径
	a.当使用条件语句编码时，左手边的代码应该是”golden” 或 “happy”路径。也就是不要嵌套if语句，多个返回语句也是OK。

	应该：
	- (void)someMethod {  
  		if (![someOther boolValue]) {  
    	return;  
  		}  
  		//Do something important  
	}  
	不应该：
	- (void)someMethod {  
  		if ([someOther boolValue]) {  
    	//Do something important  
  		}  
	} 

### 4.10 单例模式
	a.单例对象应该使用线程安全模式来创建共享实例。

	+ (instancetype)sharedInstance {  
  		static id sharedInstance = nil;  
  		static dispatch_once_t onceToken;  
  		dispatch_once(&onceToken, ^{  
    		sharedInstance = [[self alloc] init];  
  		});  
  		return sharedInstance;  
	} 
	


## 5.其它

### 5.1 空格
	a.缩进使用4个空格，确保在Xcode偏好设置来设置
	b.在 Xcode > Preferences > Text Editing将Tab和自动缩进都设置为4个空格
	c.方法大括号和其他大括号(if/else/switch/while 等.)总是在同一行语句打开但在新行中关闭。
	d.在方法之间应该有且只有一行，这样有利于在视觉上更清晰和更易于组织。在方法内的空白应该分离功能，但通常都抽离出来成为一个新方法。
	e.＋、－、＊、／、％ 前后各留一个空格

	
### 5.2 注释
	a.当需要注释时，注释应该用来解释这段特殊代码为什么要这样做。任何被使用的注释都必须保持最新或被删除。
	b.强烈建议用第三方插件VVDocumenter(https://github.com/onevcat/VVDocumenter-Xcode)


	

	
	

	





 
	
 
	

  		
  		

	

	

 
 
	