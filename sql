
SQL 通用数据类型: - 数据库表中的每个列都要求有名称和数据类型。Each column in a database table is required to have a name and a data type.
    
    SQL 开发人员必须在创建 SQL 表时决定表中的每个列将要存储的数据的类型。数据类型是一个标签，是便于 SQL 了解每个列期望存储什么类型的数据的指南，它也标识了 SQL 如何与存储的数据进行交互。
    
    下面的表格列出了 SQL 中通用的数据类型：

        +-------------------------------+---------------------------------------------------------+
        |           数据类型            |                          描述                           |
        +-------------------------------+---------------------------------------------------------+
        |  CHARACTER(n)                 |  字符/字符串.固定长度n。                                |
        +-------------------------------+---------------------------------------------------------+
        |  VARCHAR(n)或                 |  字符/字符串。可变长度。最大长度n。                     |
        |  CHARACTER VARYING(n)         |                                                         |
        +-------------------------------+---------------------------------------------------------+
        |  BINARY(n)                    |  二进制串。固定长度n。                                  |
        +-------------------------------+---------------------------------------------------------+
        |  BOOLEAN                      |  存储TRUE 或 FALSE 值                                   |
        +-------------------------------+---------------------------------------------------------+
        |  VARBINARY(n)或               |  二进制串。可变长度。最大长度n。                        |
        |  BINARY VARYING(n)            |                                                         |
        +-------------------------------+---------------------------------------------------------+
        |  INTEGER(p)                   |  整数值（没有小数点）。精度p。                          |
        +-------------------------------+---------------------------------------------------------+
        |  SMALLINT                     |  整数值（没有小数点）。精度5。                          |
        +-------------------------------+---------------------------------------------------------+
        |  INTEGER                      |  整数值（没有小数点）。精度10。                         |
        +-------------------------------+---------------------------------------------------------+
        |  BIGINT                       |  整数值（没有小数点）。精度19。                         |
        +-------------------------------+---------------------------------------------------------+
        |  DECIMAL(p,s)                 |  精确数值，精度p，小数点后位数s。例如：decimal(5,2)是一 |  
        |                               |  个小数点前有3位数小数点，后有2位数的数字。             |
        +-------------------------------+---------------------------------------------------------+
        |  NUMERIC(p,s)                 |  精确数值，精度p，小数点后位数s。（与DECIMAL相同）      |
        +-------------------------------+---------------------------------------------------------+
        |  FLOAT(p)                     |  近似数值，尾数精度P。一个采用以10为基数的指数计数法的浮|
        |                               |  点数。该类型的size参数由一个指定最小精度的单一数字组成 |
        +-------------------------------+---------------------------------------------------------+
        |  REAL                         |  近似数值，尾数精度7                                    |
        +-------------------------------+---------------------------------------------------------+
        |  FLOAT                        |  近似数值，尾数精度16                                   |
        +-------------------------------+---------------------------------------------------------+
        |  DOUBLE PRECISION             |  近似数值，尾数精度16                                   |
        +-------------------------------+---------------------------------------------------------+
        |  DATE                         |  存储年、月、日的值                                     |
        +-------------------------------+---------------------------------------------------------+
        |  TIME                         |  存储小时、分、秒的值                                   |
        +-------------------------------+---------------------------------------------------------+
        |  TIMESTAMP                    |  厚储年、月、日、小时、分、秒的值                       |
        +-------------------------------+---------------------------------------------------------+
        |  INTERVAL                     |  由一些整数字段组成，代表一段时间，取决于区间的类型     |
        +-------------------------------+---------------------------------------------------------+
        |  ARRAY                        |  元素的固定长度的有序集合                               |
        +-------------------------------+---------------------------------------------------------+
        |  MULTISET                     |  元素的可变长度的无序集合                               |
        +-------------------------------+---------------------------------------------------------+
        |  XML                          |  存储XML数据                                            |
        +-------------------------------+---------------------------------------------------------+

    SQL 数据类型快速参考手册，然而，不同的数据库对数据类型定义提供不同的选择。
			
		下面的表格显示了各种不同的数据库平台上一些数据类型的通用名称：    

        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  数据类型         | Access                 | SQL Server         | Oracle            | MySQL            | PostgreSQL         |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  string(variable) | Text(<256) memo (65k+) |  Varchar           | Varchar Varchar2  | Varchar          | Varchar            |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  boolean          | Yes/No                 |  Bit               | Byte              | N/A              | Boolean            |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  integer          | Number(integer)        |  Int               | Number            | Int Integer      | Int Integer        |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  float            | Number(single)         |  Float Real        | Number            | Float            | Numeric            |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  currency         | Currency               |  Money             | N/A               | N/A              | Money              |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  string(fixed)    | N/A                    |  Char              | Char              | Char             | Char               |
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+
        |  binary object    | OLE Object Memo        |  Binary(fixed up to| Long              | Blob             | Binary             |
        |                   |                        |  8K)               | Raw               | Text             | Varbinary          |
        |                   |                        |  Varbinary (<8K)   |                   |                  |                    | 
        |                   |                        |  Image (<2GB)      |                   |                  |                    |    
        +-------------------+------------------------+--------------------+-------------------+------------------+--------------------+

    创建数据库:

      1.1

		MariaDB [hidb]> CREATE TABLE students(id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,name CHAR(30) NOT NULL,age TINYINT UNSIGNED,gender ENUM('F','M'),major VARCHAR(200));  
		Query OK, 0 rows affected (0.00 sec)

		MariaDB [hidb]> DESC students;
		+--------+---------------------+------+-----+---------+----------------+
		| Field  | Type                | Null | Key | Default | Extra          |
		+--------+---------------------+------+-----+---------+----------------+
		| id     | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
		| name   | char(30)            | NO   |     | NULL    |                |
		| age    | tinyint(3) unsigned | YES  |     | NULL    |                |
		| gender | enum('F','M')       | YES  |     | NULL    |                |
		| major  | varchar(200)        | YES  |     | NULL    |                |
		+--------+---------------------+------+-----+---------+----------------+
		5 rows in set (0.00 sec)

      1.2

        [root@localhost ~]# GANDER=('F' 'M')           --首先定义数组
		[root@localhost ~]# echo ${GANDER[0]}
		F
		[root@localhost ~]# echo ${GANDER[1]}
		M
		[root@localhost ~]# for i in {1..100}; do mysql -e "INSERT INTO hidb.students(name,age,gender) VALUES ('stu$i','$[$RANDOM%80+18]','${GANDER[$RANDOM%2]}')"; done

		MariaDB [hidb]> desc students;
		+--------+---------------------+------+-----+---------+----------------+
		| Field  | Type                | Null | Key | Default | Extra          |
		+--------+---------------------+------+-----+---------+----------------+
		| id     | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
		| name   | char(30)            | NO   |     | NULL    |                |
		| age    | tinyint(3) unsigned | YES  |     | NULL    |                |
		| gender | enum('F','M')       | YES  |     | NULL    |                |
		| major  | varchar(200)        | YES  |     | NULL    |                |
		+--------+---------------------+------+-----+---------+----------------+
		5 rows in set (0.00 sec)

		MariaDB [hidb]> SELECT * FROM students;
		+-----+--------+------+--------+-------+
		| id  | name   | age  | gender | major |
		+-----+--------+------+--------+-------+
		|   1 | stu1   |   45 | F      | NULL  |
		|   2 | stu2   |   43 | M      | NULL  |
		|   3 | stu3   |   36 | F      | NULL  |
		|   4 | stu4   |   55 | M      | NULL  |
		|   5 | stu5   |   69 | M      | NULL  |
		|   6 | stu6   |   68 | M      | NULL  |
		|   7 | stu7   |   36 | F      | NULL  |
		|   8 | stu8   |   58 | F      | NULL  |
		|   9 | stu9   |   27 | F      | NULL  |
		|  10 | stu10  |   25 | F      | NULL  |
		|  11 | stu11  |   91 | M      | NULL  |
		|  12 | stu12  |   45 | M      | NULL  |
		|  13 | stu13  |   97 | M      | NULL  |
		|  14 | stu14  |   21 | F      | NULL  |
		|  15 | stu15  |   26 | F      | NULL  |
		|  16 | stu16  |   87 | M      | NULL  |
		|  17 | stu17  |   34 | F      | NULL  |
		|  18 | stu18  |   85 | M      | NULL  |
		|  19 | stu19  |   66 | M      | NULL  |
		|  20 | stu20  |   51 | F      | NULL  |
		|  21 | stu21  |   97 | M      | NULL  |
		|  22 | stu22  |   69 | F      | NULL  |
		|  23 | stu23  |   22 | F      | NULL  |
		|  24 | stu24  |   64 | M      | NULL  |
		|  25 | stu25  |   42 | M      | NULL  |
		|  26 | stu26  |   28 | M      | NULL  |
		|  27 | stu27  |   24 | M      | NULL  |
		|  28 | stu28  |   38 | M      | NULL  |
		|  29 | stu29  |   43 | M      | NULL  |
		|  30 | stu30  |   74 | M      | NULL  |
		|  31 | stu31  |   95 | F      | NULL  |
		|  32 | stu32  |   37 | M      | NULL  |
		|  33 | stu33  |   90 | M      | NULL  |
		|  34 | stu34  |   18 | M      | NULL  |
		|  35 | stu35  |   95 | F      | NULL  |
		|  36 | stu36  |   62 | F      | NULL  |
		|  37 | stu37  |   66 | F      | NULL  |
		|  38 | stu38  |   51 | M      | NULL  |
		|  39 | stu39  |   96 | M      | NULL  |
		|  40 | stu40  |   78 | F      | NULL  |
		|  41 | stu41  |   55 | M      | NULL  |
		|  42 | stu42  |   49 | F      | NULL  |
		|  43 | stu43  |   68 | F      | NULL  |
		|  44 | stu44  |   23 | F      | NULL  |
		|  45 | stu45  |   54 | F      | NULL  |
		|  46 | stu46  |   45 | F      | NULL  |
		|  47 | stu47  |   65 | F      | NULL  |
		|  48 | stu48  |   72 | M      | NULL  |
		|  49 | stu49  |   85 | F      | NULL  |
		|  50 | stu50  |   26 | F      | NULL  |
		|  51 | stu51  |   26 | F      | NULL  |
		|  52 | stu52  |   95 | M      | NULL  |
		|  53 | stu53  |   20 | F      | NULL  |
		|  54 | stu54  |   71 | F      | NULL  |
		|  55 | stu55  |   86 | M      | NULL  |
		|  56 | stu56  |   82 | F      | NULL  |
		|  57 | stu57  |   72 | M      | NULL  |
		|  58 | stu58  |   75 | F      | NULL  |
		|  59 | stu59  |   97 | F      | NULL  |
		|  60 | stu60  |   42 | M      | NULL  |
		|  61 | stu61  |   29 | M      | NULL  |
		|  62 | stu62  |   74 | F      | NULL  |
		|  63 | stu63  |   22 | M      | NULL  |
		|  64 | stu64  |   55 | M      | NULL  |
		|  65 | stu65  |   83 | M      | NULL  |
		|  66 | stu66  |   43 | F      | NULL  |
		|  67 | stu67  |   59 | M      | NULL  |
		|  68 | stu68  |   43 | F      | NULL  |
		|  69 | stu69  |   35 | M      | NULL  |
		|  70 | stu70  |   76 | M      | NULL  |
		|  71 | stu71  |   77 | M      | NULL  |
		|  72 | stu72  |   61 | M      | NULL  |
		|  73 | stu73  |   96 | F      | NULL  |
		|  74 | stu74  |   87 | F      | NULL  |
		|  75 | stu75  |   43 | M      | NULL  |
		|  76 | stu76  |   26 | F      | NULL  |
		|  77 | stu77  |   55 | F      | NULL  |
		|  78 | stu78  |   80 | F      | NULL  |
		|  79 | stu79  |   58 | F      | NULL  |
		|  80 | stu80  |   38 | F      | NULL  |
		|  81 | stu81  |   73 | M      | NULL  |
		|  82 | stu82  |   66 | F      | NULL  |
		|  83 | stu83  |   57 | M      | NULL  |
		|  84 | stu84  |   28 | M      | NULL  |
		|  85 | stu85  |   97 | F      | NULL  |
		|  86 | stu86  |   41 | F      | NULL  |
		|  87 | stu87  |   23 | F      | NULL  |
		|  88 | stu88  |   86 | F      | NULL  |
		|  89 | stu89  |   19 | M      | NULL  |
		|  90 | stu90  |   30 | M      | NULL  |
		|  91 | stu91  |   36 | M      | NULL  |
		|  92 | stu92  |   20 | F      | NULL  |
		|  93 | stu93  |   97 | M      | NULL  |
		|  94 | stu94  |   86 | M      | NULL  |
		|  95 | stu95  |   50 | F      | NULL  |
		|  96 | stu96  |   32 | F      | NULL  |
		|  97 | stu97  |   45 | M      | NULL  |
		|  98 | stu98  |   65 | F      | NULL  |
		|  99 | stu99  |   35 | M      | NULL  |
		| 100 | stu100 |   66 | F      | NULL  |
		+-----+--------+------+--------+-------+
		100 rows in set (0.00 sec)

      1.3 创建索引
        MariaDB [hidb]> CREATE INDEX age ON students(age);        --> 创建索引
		Query OK, 0 rows affected (0.04 sec)
		Records: 0  Duplicates: 0  Warnings: 0

		MariaDB [hidb]> SHOW INDEXES FROM students;               --> 查看students里的索引
		+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
		| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
		+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
		| students |          0 | PRIMARY  |            1 | id          | A         |         100 |     NULL | NULL   |      | BTREE      |         |               |
		| students |          1 | age      |            1 | age         | A         |         100 |     NULL | NULL   | YES  | BTREE      |         |               |
		+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
		2 rows in set (0.00 sec)


SQL语法:

    SQL SELECT : 查询语法--SELECT 语句用于从数据库中选取数据。

    	SELECT column_name,column_name FROM table_name; 与 SELECT * FROM table_name; (column_name 列的名称)
            示例:MariaDB [zabbixdb]> SELECT hk_services,hk_trends_mode  FROM config\G  
				 *************************** 1. row ***************************
				    hk_services: 365d
				 hk_trends_mode: 1
			  	 1 row in set (0.00 sec)

        SQL SELECT DISTINCT -- 在表中，一个列可能会包含多个重复值，有时您也许希望仅仅列出不同（distinct）的值。DISTINCT 关键词用于返回唯一不同的值
            
            SELECT DISTINCT column_name,column_name FROM table_name;  -- DISTINCT用来过滤重复内容的  distinct:有区别的            
            示例: 下图是Websites表的所有内容
            +----+--------------+---------------------------+-------+---------+
			| id | name         | url                       | alexa | country |
			+----+--------------+---------------------------+-------+---------+
			| 1  | Google       | https://www.google.cm/    | 1     | USA     |
			| 2  | 淘宝          | https://www.taobao.com/   | 13    | CN      |
			| 3  | 菜鸟教程      | http://www.runoob.com/    | 4689  | CN      |
			| 4  | 微博          | http://weibo.com/         | 20    | CN      |
			| 5  | Facebook     | https://www.facebook.com/ | 3     | USA     |
			+----+--------------+---------------------------+-------+---------+
			5 rows in set (0.00 sec)

			SELECT DISTINCT country FROM Websites;
			+---------+
			| country |
			+---------+
		    | USA     |
		    | CN      |
			+---------+
			2 rows in set (0.00 sec)

		SQL WHERE 子句
		    SELECT column_name,column_name FROM table_name WHERE column_name operator value; -- WHERE 子句用于提取那些满足指定标准的记录。	  
		    示例:
		    SELECT * FROM Websites WHERE country='CN';  -- SQL 语句从 "Websites" 表中选取国家为 "CN" 的所有网站：
            +----+--------------+---------------------------+-------+---------+
			| id | name         | url                       | alexa | country |
			+----+--------------+---------------------------+-------+---------+
			| 2  | 淘宝          | https://www.taobao.com/   | 13    | CN      |
			| 3  | 菜鸟教程      | http://www.runoob.com/    | 4689  | CN      |
			| 4  | 微博          | http://weibo.com/         | 20    | CN      |
			+----+--------------+---------------------------+-------+---------+
			3 rows in set (0.00 sec)
            
            示例:
            SELECT * FROM Websites WHERE id=1;  -- SQL 使用单引号来环绕文本值（大部分数据库系统也接受双引号）。在上个实例中 'CN' 文本字段使用了单引号。如果是数值字段，请不要使用引号。
            +----+--------------+---------------------------+-------+---------+
			| id | name         | url                       | alexa | country |
			+----+--------------+---------------------------+-------+---------+
			| 1  | Google       | https://www.google.cm/    | 1     | USA     |
            +----+--------------+---------------------------+-------+---------+		
            1 row in set (0.04 sec)	

            WHERE 子句中的运算符,在WHERE子句中使用:
			+------------+---------------------------------------------------------+
			|     =      |  等于                                                   |
			+------------+---------------------------------------------------------+
			|     <>     |  不等于。注释:在SQL的一些版本中,该操作符可被写成!=      | 
			+------------+---------------------------------------------------------+
			|     >      |  大于                                                   |
			+------------+---------------------------------------------------------+
			|     <      |  小于                                                   |
			+------------+---------------------------------------------------------+
			|     >=     |  大于等于                                               |
			+------------+---------------------------------------------------------+
			|     <=     |  小于等于                                               |
			+------------+---------------------------------------------------------+
			|   BETWEEN  |  在某个范围内                                           |
			+------------+---------------------------------------------------------+
			|    LIKE    |  搜索某种模式                                           |
			+------------+---------------------------------------------------------+
			|     IN     |  指定针对某个列的多个可能值                             |
			+------------+---------------------------------------------------------+      

          加强示例:
           1.
            MariaDB [zabbixdb]> SELECT * FROM users WHERE alias='Admin';    -- 在zabbixdb库中查找 users表里有个别名为Admin的行
			+--------+-------+--------+---------------+----------------------------------+-----+-----------+------------+-------+---------+------+---------+----------------+------------+---------------+---------------+
			| userid | alias | name   | surname       | passwd                           | url | autologin | autologout | lang  | refresh | type | theme   | attempt_failed | attempt_ip | attempt_clock | rows_per_page |
			+--------+-------+--------+---------------+----------------------------------+-----+-----------+------------+-------+---------+------+---------+----------------+------------+---------------+---------------+
			|      1 | Admin | Zabbix | Administrator | 5fce1b3e34b520afeffb37ce08c7cd66 |     |         1 | 0          | en_US | 30s     |    3 | default |              0 |            |             0 |            50 |
			+--------+-------+--------+---------------+----------------------------------+-----+-----------+------------+-------+---------+------+---------+----------------+------------+---------------+---------------+
			1 row in set (0.00 sec)

		   2.
		    MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid > 110 and idx2 = 0;   --> 查询profiles表 满足 profileid >110 并且 idx2 =0 的行,  and若是or就是或的意思(or满足1个条件就匹配)
			+-----------+--------+------------------------------+------+----------+-----------+-----------+--------+------+
			| profileid | userid | idx                          | idx2 | value_id | value_int | value_str | source | type |
			+-----------+--------+------------------------------+------+----------+-----------+-----------+--------+------+
			|       114 |      1 | web.actionconf.filter_name   |    0 |        0 |         0 |           |        |    3 |
			|       115 |      1 | web.actionconf.filter_status |    0 |        0 |        -1 |           |        |    2 |
			|       116 |      1 | web.actionconf.eventsource   |    0 |        0 |         0 |           |        |    2 |
			+-----------+--------+------------------------------+------+----------+-----------+-----------+--------+------+	

		   3.
		    MariaDB [zabbixdb]> SELECT * FROM profiles WHERE not profileid > 5;  -- 查询profiles表 不满足profileid >5 的行 包含5
		    +-----------+--------+-------------------------+------+----------+-----------+----------------+--------+------+
			| profileid | userid | idx                     | idx2 | value_id | value_int | value_str      | source | type |
			+-----------+--------+-------------------------+------+----------+-----------+----------------+--------+------+
			|         1 |      1 | web.dashbrd.dashboardid |    0 |        1 |         0 |                |        |    1 |
			|         2 |      1 | web.dashbrd.period      |    1 |        0 |      3600 |                |        |    2 |
			|         3 |      1 | web.dashbrd.stime       |    1 |        0 |         0 | 20171130161555 |        |    3 |
			|         4 |      1 | web.dashbrd.isnow       |    1 |        0 |         1 |                |        |    2 |
			|         5 |      1 | web.menu.admin.last     |    0 |        0 |         0 | adm.gui.php    |        |    3 |
			+-----------+--------+-------------------------+------+----------+-----------+----------------+--------+------+
			5 rows in set (0.00 sec)
	                                  +--------+--------+--------+
				逻辑运算的优先级 ()   |   not  |  and   |    or  |
				                      +--------+--------+--------+
		   
		   4.  特殊条件 WHERE

		    4.1 空值判断： is null
		        MariaDB [zabbixdb]> SELECT * FROM profiles WHERE value_str is null;   查找profiles 的value_str列里有没有空值 (因为没有所以没值列出)
				Empty set (0.00 sec)
            
            4.2 between and (在之间的值)
                MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid between 5 and 10;  -- 查找profileid为5到10之间的行 包含5和10
				+-----------+--------+---------------------------+------+----------+-----------+-------------+--------+------+
				| profileid | userid | idx                       | idx2 | value_id | value_int | value_str   | source | type |
				+-----------+--------+---------------------------+------+----------+-----------+-------------+--------+------+
				|         5 |      1 | web.menu.admin.last       |    0 |        0 |         0 | adm.gui.php |        |    3 |
				|         6 |      1 | web.users.filter.usrgrpid |    0 |        0 |         0 |             |        |    1 |
				|         7 |      1 | web.users.php.sort        |    0 |        0 |         0 | alias       |        |    3 |
				|         8 |      1 | web.users.php.sortorder   |    0 |        0 |         0 | ASC         |        |    3 |
				|         9 |      1 | web.paging.lastpage       |    0 |        0 |         0 | items.php   |        |    3 |
				|        10 |      1 | web.menu.config.last      |    0 |        0 |         0 | hosts.php   |        |    3 |
				+-----------+--------+---------------------------+------+----------+-----------+-------------+--------+------+
            
            4.2.1
                MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid < 10 AND (value_str='ASC' OR value_str='alias');  把AND和(OR) 结合使用
				+-----------+--------+-------------------------+------+----------+-----------+-----------+--------+------+
				| profileid | userid | idx                     | idx2 | value_id | value_int | value_str | source | type |
				+-----------+--------+-------------------------+------+----------+-----------+-----------+--------+------+
				|         7 |      1 | web.users.php.sort      |    0 |        0 |         0 | alias     |        |    3 |
				|         8 |      1 | web.users.php.sortorder |    0 |        0 |         0 | ASC       |        |    3 |
				+-----------+--------+-------------------------+------+----------+-----------+-----------+--------+------+
				2 rows in set (0.00 sec)


		    4.3 IN
		        MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid in (5,10,15,20);  -- 查找profileid为 5,10,15,20的行
				+-----------+--------+--------------------------+------+----------+-----------+-------------+--------+------+
				| profileid | userid | idx                      | idx2 | value_id | value_int | value_str   | source | type |
				+-----------+--------+--------------------------+------+----------+-----------+-------------+--------+------+
				|         5 |      1 | web.menu.admin.last      |    0 |        0 |         0 | adm.gui.php |        |    3 |
				|        10 |      1 | web.menu.config.last     |    0 |        0 |         0 | hosts.php   |        |    3 |
				|        15 |      1 | web.items.filter_groupid |    0 |        0 |         0 |             |        |    1 |
				|        20 |      1 | web.items.filter_key     |    0 |        0 |         0 |             |        |    3 |
				+-----------+--------+--------------------------+------+----------+-----------+-------------+--------+------+
				4 rows in set (0.00 sec)	

			4.4 like -- 模糊查询
			    MariaDB [zabbixdb]> SELECT * FROM profiles WHERE idx2 like '2%';  -- 查找profiles的idx2列 模糊查找有2的值
				+-----------+--------+-----------------------+-------+----------+-----------+----------------+--------+------+
				| profileid | userid | idx                   | idx2  | value_id | value_int | value_str      | source | type |
				+-----------+--------+-----------------------+-------+----------+-----------+----------------+--------+------+
				|        71 |      1 | web.item.graph.period | 28250 |        0 |       300 |                |        |    2 |
				|        72 |      1 | web.item.graph.stime  | 28250 |        0 |         0 | 20171121172344 |        |    3 |
				|        73 |      1 | web.item.graph.isnow  | 28250 |        0 |         1 |                |        |    2 |
				|       106 |      1 | web.item.graph.period | 28252 |        0 |       300 |                |        |    2 |
				|       107 |      1 | web.item.graph.stime  | 28252 |        0 |         0 | 20171121204835 |        |    3 |
				|       108 |      1 | web.item.graph.isnow  | 28252 |        0 |         1 |                |        |    2 |
				|       111 |      1 | web.item.graph.period | 28253 |        0 |       300 |                |        |    2 |
				|       112 |      1 | web.item.graph.stime  | 28253 |        0 |         0 | 20171122202457 |        |    3 |
				|       113 |      1 | web.item.graph.isnow  | 28253 |        0 |         1 |                |        |    2 |
				+-----------+--------+-----------------------+-------+----------+-----------+----------------+--------+------+
				9 rows in set (0.00 sec)

				    补充:    % 表示多个字值，_ 下划线表示一个字符；
							 2% : 为能配符，正则表达式，表示的意思为模糊查询信息为 2开头的。
							 %2% : 表示查询包含2的所有内容。
							 %2_ : 表示查询以2在倒数第二位的所有内容。

		    4.5 ORDER BY 排序语法	
		        MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid < 10 ORDER BY type ;  查询profileid小于10的表 用type值进行排序
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+
				| profileid | userid | idx                       | idx2 | value_id | value_int | value_str      | source | type |
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+
				|         1 |      1 | web.dashbrd.dashboardid   |    0 |        1 |         0 |                |        |    1 |
				|         6 |      1 | web.users.filter.usrgrpid |    0 |        0 |         0 |                |        |    1 |
				|         2 |      1 | web.dashbrd.period        |    1 |        0 |      3600 |                |        |    2 |
				|         4 |      1 | web.dashbrd.isnow         |    1 |        0 |         1 |                |        |    2 |
				|         3 |      1 | web.dashbrd.stime         |    1 |        0 |         0 | 20171206213920 |        |    3 |
				|         5 |      1 | web.menu.admin.last       |    0 |        0 |         0 | adm.gui.php    |        |    3 |
				|         7 |      1 | web.users.php.sort        |    0 |        0 |         0 | alias          |        |    3 |
				|         8 |      1 | web.users.php.sortorder   |    0 |        0 |         0 | ASC            |        |    3 |
				|         9 |      1 | web.paging.lastpage       |    0 |        0 |         0 | items.php      |        |    3 |
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+		

			  4.5.1 			 
			    MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid < 10 ORDER BY type DESC;  查询profileid小于10的表 用type值进行降序排序 (DESC 降序)
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+
				| profileid | userid | idx                       | idx2 | value_id | value_int | value_str      | source | type |
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+
				|         3 |      1 | web.dashbrd.stime         |    1 |        0 |         0 | 20171206213920 |        |    3 |
				|         5 |      1 | web.menu.admin.last       |    0 |        0 |         0 | adm.gui.php    |        |    3 |
				|         7 |      1 | web.users.php.sort        |    0 |        0 |         0 | alias          |        |    3 |
				|         8 |      1 | web.users.php.sortorder   |    0 |        0 |         0 | ASC            |        |    3 |
				|         9 |      1 | web.paging.lastpage       |    0 |        0 |         0 | items.php      |        |    3 |
				|         2 |      1 | web.dashbrd.period        |    1 |        0 |      3600 |                |        |    2 |
				|         4 |      1 | web.dashbrd.isnow         |    1 |        0 |         1 |                |        |    2 |
				|         1 |      1 | web.dashbrd.dashboardid   |    0 |        1 |         0 |                |        |    1 |
				|         6 |      1 | web.users.filter.usrgrpid |    0 |        0 |         0 |                |        |    1 |
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+

		      4.5.2
		        MariaDB [zabbixdb]> SELECT * FROM profiles WHERE profileid < 10 ORDER BY idx2,type ;  使用再个条件进行排序(排在前面的为首要,后面为次要条件)  
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+
				| profileid | userid | idx                       | idx2 | value_id | value_int | value_str      | source | type |
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+
				|         1 |      1 | web.dashbrd.dashboardid   |    0 |        1 |         0 |                |        |    1 |
				|         6 |      1 | web.users.filter.usrgrpid |    0 |        0 |         0 |                |        |    1 |
				|         5 |      1 | web.menu.admin.last       |    0 |        0 |         0 | adm.gui.php    |        |    3 |
				|         7 |      1 | web.users.php.sort        |    0 |        0 |         0 | alias          |        |    3 |
				|         8 |      1 | web.users.php.sortorder   |    0 |        0 |         0 | ASC            |        |    3 |
				|         9 |      1 | web.paging.lastpage       |    0 |        0 |         0 | items.php      |        |    3 |
				|         2 |      1 | web.dashbrd.period        |    1 |        0 |      3600 |                |        |    2 |
				|         4 |      1 | web.dashbrd.isnow         |    1 |        0 |         1 |                |        |    2 |
				|         3 |      1 | web.dashbrd.stime         |    1 |        0 |         0 | 20171206213920 |        |    3 |
				+-----------+--------+---------------------------+------+----------+-----------+----------------+--------+------+		
             
                ORDER BY 多列的时候，先按照第一个idx2排序，在按照第二个type排序；如上述教程最后一个例子：
				 1）、先将type值这一列排序，同为1的排前面，同属23的排后面；
				 2）、然后在第一次排序的基础上，再根据idx2值的大小排列。
				 3）、ORDER BY 排列时，不写明ASC DESC的时候，默认是ASC。
		
		SQL INSERT INTO 语句 可以有两种编写形式。
              1. 无需指定要插入数据的列名，只需提供被插入的值即可：
                INSERT INTO table_name VALUES (value1,value2,value3,...);
                
                示例: MariaDB [shiyandb]> INSERT INTO wangzhan VALUES (2,"淘宝","https://www.taobao.com/",13,"CN");
					  Query OK, 1 row affected (0.00 sec)


					  MariaDB [shiyandb]> SELECT * FROM wangzhan;
						+------+--------+-------------------------+-------+---------+
						| id   | name   | url                     | alexa | country |
						+------+--------+-------------------------+-------+---------+
						|    1 | Google | https://www.google.com/ | 1     | USA     |
						|    2 | 淘宝   | https://www.taobao.com/ | 13    | CN      |
						+------+--------+-------------------------+-------+---------+
						2 rows in set (0.00 sec)

              2. 需要指定列名及被插入的值：
                INSERT INTO table_name (column1,column2,column3,...) VALUES (value1,value2,value3,...);                 

                示例: MariaDB [shiyandb]> INSERT INTO wangzhan (id,name,url,alexa,country) VALUES (1,"Google","https://www.google.com/","1","USA");
                      Query OK, 1 row affected (0.00 sec)

                      MariaDB [shiyandb]> SELECT * FROM wangzhan;
						+------+--------+-------------------------+-------+---------+
						| id   | name   | url                     | alexa | country |
						+------+--------+-------------------------+-------+---------+
						|    1 | Google | https://www.google.com/ | 1     | USA     |
						+------+--------+-------------------------+-------+---------+
						1 row in set (0.00 sec)
						 
              3. 我们也可以在指定的列插入数据
                  
                  示例:

                  MariaDB [shiyandb]> INSERT INTO wangzhan (name,url,country) VALUES ("京东","https://www.jd.com/","CN");
					Query OK, 1 row affected (0.01 sec)

					MariaDB [shiyandb]> SELECT * FROM wangzhan;
					+------+----------+---------------------------+-------+---------+
					| id   | name     | url                       | alexa | country |
					+------+----------+---------------------------+-------+---------+
					|    1 | Google   | https://www.google.com/   | 1     | USA     |
					|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
					| NULL | 微博     | http://weibo.com/         | 20    | CN      |
					| NULL | NULL     | NULL                      | NULL  | NULL    |
					|    3 | 微博     | http://weibo.com/         | 20    | CN      |
					|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
					| NULL | 京东     | https://www.jd.com/       | NULL  | CN      |
					+------+----------+---------------------------+-------+---------+
					7 rows in set (0.00 sec)

		SQL UPDATE 语句 -- UPDATE 语句用于更新表中的记录。

            语法:UPDATE table_name SET column1=value1,column2=value2,... WHERE some_column=some_value;

                示例:UPDATE 表里id的值 WHERE name名就'京东'的记录

                MariaDB [shiyandb]> UPDATE wangzhan SET id=5 WHERE name='京东';
				Query OK, 1 row affected (0.00 sec)
				Rows matched: 1  Changed: 1  Warnings: 0

				MariaDB [shiyandb]> SELECT * FROM wangzhan;                    
				+------+----------+---------------------------+-------+---------+
				| id   | name     | url                       | alexa | country |
				+------+----------+---------------------------+-------+---------+
				|    1 | Google   | https://www.google.com/   | 1     | USA     |
				|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
				| NULL | 微博     | http://weibo.com/         | 20    | CN      |
				| NULL | NULL     | NULL                      | NULL  | NULL    |
				|    3 | 微博     | http://weibo.com/         | 20    | CN      |
				|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
				|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
				+------+----------+---------------------------+-------+---------+
				7 rows in set (0.00 sec)

				****************************Update 警告！ *********************************

				在更新记录时要格外小心！在上面的实例中，如果我们省略了 WHERE 子句，如下所示：
				UPDATE Websites SET alexa='5000', country='USA'
				执行以上代码会将 Websites 表中所有数据的 alexa 改为 5000，country 改为 USA。
				执行没有 WHERE 子句的 UPDATE 要慎重，再慎重。

		SQL DELETE 语句 -- DELETE 语句用于删除表中的记录。		

            语法: DELETE FROM table_name WHERE some_column=some_value;  
                  DELETE * FROM table_name;
                  DELETE FROM table_name;

                示例:

                   MariaDB [shiyandb]> SELECT * FROM wangzhan;                         
					+------+----------+---------------------------+-------+---------+
					| id   | name     | url                       | alexa | country |
					+------+----------+---------------------------+-------+---------+
					|    1 | Google   | https://www.google.com/   | 1     | USA     |
					|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
					| NULL | 微博     | http://weibo.com/         | 20    | CN      |
					| NULL | NULL     | NULL                      | NULL  | NULL    |
					|    3 | 微博     | http://weibo.com/         | 20    | CN      |
					|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
					|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
					+------+----------+---------------------------+-------+---------+
					7 rows in set (0.00 sec)

					MariaDB [shiyandb]> DELETE FROM wangzhan WHERE name='微博' OR id='null';  使用的逻辑判断直接删了两个
					Query OK, 2 rows affected, 1 warning (0.00 sec)

					MariaDB [shiyandb]> SELECT * FROM wangzhan;                             
					+------+----------+---------------------------+-------+---------+
					| id   | name     | url                       | alexa | country |
					+------+----------+---------------------------+-------+---------+
					|    1 | Google   | https://www.google.com/   | 1     | USA     |
					|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
					| NULL | NULL     | NULL                      | NULL  | NULL    |
					|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
					|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
					+------+----------+---------------------------+-------+---------+
					5 rows in set (0.00 sec)

				示例: 删除NULL (空值的记录)
				    
				    MariaDB [shiyandb]> SELECT * FROM wangzhan;                                
					+------+----------+---------------------------+-------+---------+
					| id   | name     | url                       | alexa | country |
					+------+----------+---------------------------+-------+---------+
					|    1 | Google   | https://www.google.com/   | 1     | USA     |
					|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
					| NULL | NULL     | NULL                      | NULL  | NULL    |
					|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
					|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
					+------+----------+---------------------------+-------+---------+
					5 rows in set (0.00 sec)

					MariaDB [shiyandb]> DELETE FROM wangzhan WHERE id is null; 	

				    MariaDB [shiyandb]> SELECT * FROM wangzhan;               
					+------+----------+---------------------------+-------+---------+
					| id   | name     | url                       | alexa | country |
					+------+----------+---------------------------+-------+---------+
					|    1 | Google   | https://www.google.com/   | 1     | USA     |
					|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
					|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
					|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
					+------+----------+---------------------------+-------+---------+
					4 rows in set (0.00 sec)

        SQL SELECT TOP,LIMIT,ROWNUM 子句
            
            SQL Server / MS Access 语法: SELECT TOP number|percent column_name(s) FROM table_name;

                示例:

		            MariaDB [shiyandb]> SELECT * FROM wangzhan LIMIT 2;
					+------+--------+-------------------------+-------+---------+
					| id   | name   | url                     | alexa | country |
					+------+--------+-------------------------+-------+---------+
					|    1 | Google | https://www.google.com/ | 1     | USA     |
					|    2 | 淘宝   | https://www.taobao.com/ | 13    | CN      |
					+------+--------+-------------------------+-------+---------+
					2 rows in set (0.00 sec)

        SQL LIKE 操作符 -- LIKE 操作符用于在 WHERE 子句中搜索列中的指定模式。

            SQL LIKE 语法: SELECT column_name(s) FROM table_name WHERE column_name LIKE pattern;

                示例:

                MariaDB [shiyandb]> SELECT * FROM wangzhan ;                                              +------+----------+---------------------------+-------+---------+
				| id   | name     | url                       | alexa | country |
				+------+----------+---------------------------+-------+---------+
				|    1 | Google   | https://www.google.com/   | 1     | USA     |
				|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
				|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
				|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
				|    6 | 天猫     | https://www.tmall.com/    | 5     | CN      |
				|    7 | 新浪     | https://www.xinlang.com   | 7     | CN      |
				+------+----------+---------------------------+-------+---------+
				6 rows in set (0.00 sec)

				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name LIKE "京%";
				+------+--------+---------------------+-------+---------+
				| id   | name   | url                 | alexa | country |
				+------+--------+---------------------+-------+---------+
				|    5 | 京东   | https://www.jd.com/ | NULL  | CN      |
				+------+--------+---------------------+-------+---------+
				1 row in set (0.00 sec)

				#提示："%" 符号用于在模式的前后定义通配符（缺省字母）。下面的 SQL 语句选取 name 以字母 "e" 结尾的所有客户

				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name LIKE "%e"; 
				+------+--------+-------------------------+-------+---------+
				| id   | name   | url                     | alexa | country |
				+------+--------+-------------------------+-------+---------+
				|    1 | Google | https://www.google.com/ | 1     | USA     |
				+------+--------+-------------------------+-------+---------+
				1 row in set (0.00 sec)

                #下面的 SQL 语句选取 name 包含模式 "oo" 的所有客户：
                
				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name LIKE "%oo%";
				+------+----------+---------------------------+-------+---------+
				| id   | name     | url                       | alexa | country |
				+------+----------+---------------------------+-------+---------+
				|    1 | Google   | https://www.google.com/   | 1     | USA     |
				|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
				+------+----------+---------------------------+-------+---------+
				2 rows in set (0.00 sec)

				#通过使用 NOT 关键字，您可以选取不匹配模式的记录.下面的 SQL 语句选取 name 不包含模式 "oo" 的所有客户：

				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name NOT LIKE "%oo%";
				+------+--------+-------------------------+-------+---------+
				| id   | name   | url                     | alexa | country |
				+------+--------+-------------------------+-------+---------+
				|    2 | 淘宝   | https://www.taobao.com/ | 13    | CN      |
				|    5 | 京东   | https://www.jd.com/     | NULL  | CN      |
				|    6 | 天猫   | https://www.tmall.com/  | 5     | CN      |
				|    7 | 新浪   | https://www.xinlang.com | 7     | CN      |
				+------+--------+-------------------------+-------+---------+
            
        SQL 通配符: 通配符可用于替代字符串中的任何其他字符。

            在 SQL 中，通配符与 SQL LIKE 操作符一起使用。SQL 通配符用于搜索表中的数据。
            
            在 SQL 中，可使用以下通配符：
            
            +--------------+-------------------------------------------+
            |    通配符    |                    描述                   |
            +--------------+-------------------------------------------+
            |      %       |   替代0个或多个字符                       |
            +--------------+-------------------------------------------+
            |      _       |   替代一个字符                            |
            +--------------+-------------------------------------------+
            |  [charlist]  |   字符列中的任何单一字符                  |
            +--------------+-------------------------------------------+
            | [^charlist]  |   不在字符列中的任何单一字符              |
            | 或           |                                           |
            | [!charlist]  |                                           |
            +--------------+-------------------------------------------+

                示例: MySQL 中使用 REGEXP 或 NOT REGEXP 运算符 (或 RLIKE 和 NOT RLIKE) 来操作正则表达式。

                MariaDB [shiyandb]> SELECT * FROM wangzhan ;                                              +------+----------+---------------------------+-------+---------+
				| id   | name     | url                       | alexa | country |
				+------+----------+---------------------------+-------+---------+
				|    1 | Google   | https://www.google.com/   | 1     | USA     |
				|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
				|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
				|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
				|    6 | 天猫     | https://www.tmall.com/    | 5     | CN      |
				|    7 | 新浪     | https://www.xinlang.com   | 7     | CN      |
				+------+----------+---------------------------+-------+---------+
				6 rows in set (0.00 sec)

                MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name  REGEXP '^[A-H]';   -- 以A-H开头的行  (regexp 正则表达式)
				+------+----------+---------------------------+-------+---------+
				| id   | name     | url                       | alexa | country |
				+------+----------+---------------------------+-------+---------+
				|    1 | Google   | https://www.google.com/   | 1     | USA     |
				|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
				+------+----------+---------------------------+-------+---------+
				2 rows in set (0.00 sec)
 
                MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name  REGEXP '^[^A-H]';  -- 在正则里的^为非 而''内的^是天头
				+------+--------+-------------------------+-------+---------+
				| id   | name   | url                     | alexa | country |
				+------+--------+-------------------------+-------+---------+
				|    2 | 淘宝   | https://www.taobao.com/ | 13    | CN      |
				|    5 | 京东   | https://www.jd.com/     | NULL  | CN      |
				|    6 | 天猫   | https://www.tmall.com/  | 5     | CN      |
				|    7 | 新浪   | https://www.xinlang.com | 7     | CN      |
				+------+--------+-------------------------+-------+---------+
				4 rows in set (0.00 sec)

		SQL IN 操作符 -- IN 操作符允许您在 WHERE 子句中规定多个值。

		    SQL IN 语法: SELECT column_name(s) FROM table_name WHERE column_name IN (value1,value2,...);
		
                示例: SQL语句选取name 为 淘宝 和 网易的所有网站

                MariaDB [shiyandb]> select * from wangzhan;
				+------+----------+---------------------------+-------+---------+
				| id   | name     | url                       | alexa | country |
				+------+----------+---------------------------+-------+---------+
				|    1 | Google   | https://www.google.com/   | 1     | USA     |
				|    2 | 淘宝     | https://www.taobao.com/   | 13    | CN      |
				|    4 | Facebook | https://www.facebook.com/ | 3     | USA     |
				|    5 | 京东     | https://www.jd.com/       | NULL  | CN      |
				|    6 | 天猫     | https://www.tmall.com/    | 5     | CN      |
				|    7 | 新浪     | https://www.xinlang.com   | 7     | CN      |
				|    8 | 网易     | http://www.163.com/       | 10    | CN      |
				|    9 | 淘宝     | http://www.taobao.com/    | 11    | CN      |
				+------+----------+---------------------------+-------+---------+
				8 rows in set (0.00 sec)

				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE name IN ("淘宝","网易");
				+------+--------+-------------------------+-------+---------+
				| id   | name   | url                     | alexa | country |
				+------+--------+-------------------------+-------+---------+
				|    2 | 淘宝   | https://www.taobao.com/ | 13    | CN      |
				|    8 | 网易   | http://www.163.com/     | 10    | CN      |
				|    9 | 淘宝   | http://www.taobao.com/  | 11    | CN      |
				+------+--------+-------------------------+-------+---------+
				3 rows in set (0.00 sec)

				#提示 IN 与 = 的异同
						 相同点：均在WHERE中使用作为筛选条件之一、均是等于的含义
						 不同点：IN可以规定多个值，等于规定一个值

						 IN
							SELECT column_name(s)
							FROM table_name
							WHERE column_name IN (value1,value2,...);
						 =
							SELECT column_name(s)
							FROM table_name
							WHERE column_name=value1;

		SQL BETWEEN 操作符 -- BETWEEN 操作符用于选取介于两个值之间的数据范围内的值。这些值可以是数值、文本或者日期。
		
		    SQL BETWEEN 语法: SELECT column_name(s) FROM table_name WHERE column_name BETWEEN value1 AND value2; 	

		        示例: SQL 语句选取 alexa 介于 1 和 7 之外的所有网站：
                
                MariaDB [shiyandb]> SELECT * FROM wangzhan;
				+------+---------------+---------------------------+-------+---------+
				| id   | name          | url                       | alexa | country |
				+------+---------------+---------------------------+-------+---------+
				|    1 | Google        | https://www.google.com/   | 1     | USA     |
				|    2 | 淘宝          | https://www.taobao.com/   | 13    | CN      |
				|    4 | Facebook      | https://www.facebook.com/ | 3     | USA     |
				|    5 | 京东          | https://www.jd.com/       | NULL  | CN      |
				|    6 | 天猫          | https://www.tmall.com/    | 5     | CN      |
				|    7 | 新浪          | https://www.xinlang.com   | 7     | CN      |
				|    8 | 网易          | http://www.163.com/       | 10    | CN      |
				|    9 | 淘宝          | http://www.taobao.com/    | 11    | CN      |
				|   10 | stackoverflow | http://stackoverflow.com/ | 0     | IND     |
				+------+---------------+---------------------------+-------+---------+
				9 rows in set (0.00 sec)

  				
				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE alexa NOT BETWEEN 1 AND 7 ;  
				+------+---------------+---------------------------+-------+---------+
				| id   | name          | url                       | alexa | country |
				+------+---------------+---------------------------+-------+---------+
				|    2 | 淘宝          | https://www.taobao.com/   | 13    | CN      |
				|    8 | 网易          | http://www.163.com/       | 10    | CN      |
				|    9 | 淘宝          | http://www.taobao.com/    | 11    | CN      |
				|   10 | stackoverflow | http://stackoverflow.com/ | 0     | IND     |
				+------+---------------+---------------------------+-------+---------+
				4 rows in set (0.00 sec)

                SQL 语句选取alexa介于 1 和 11 之间但 country 不为 USA 和 IND 的所有网站：

				MariaDB [shiyandb]> SELECT * FROM wangzhan WHERE (alexa BETWEEN 1 AND 11) AND NOT country IN ('USA','IND'); 
				+------+--------+-------------------------+-------+---------+
				| id   | name   | url                     | alexa | country |
				+------+--------+-------------------------+-------+---------+
				|    6 | 天猫   | https://www.tmall.com/  | 5     | CN      |
				|    7 | 新浪   | https://www.xinlang.com | 7     | CN      |
				|    8 | 网易   | http://www.163.com/     | 10    | CN      |
				|    9 | 淘宝   | http://www.taobao.com/  | 11    | CN      |
				+------+--------+-------------------------+-------+---------+
				4 rows in set (0.00 sec)

        SQL 别名 -- 通过使用 SQL，可以为表名称或列名称指定别名。基本上，创建别名是为了让列名称的可读性更强。

            列的 SQL 别名语法 : SELECT column_name AS alias_name FROM table_name;
            表的 SQL 别名语法 : SELECT column_name(s) FROM table_name AS alias_name;

                示例：列的别名修改

                MariaDB [shiyandb]> SELECT name AS mingzi, alexa AS paiming FROM wangzhan WHERE alexa > 7;
				+--------+---------+
				| mingzi | paiming |
				+--------+---------+
				| 淘宝   | 13      |
				| 网易   | 10      |
				| 淘宝   | 11      |
				+--------+---------+
				3 rows in set (0.00 sec)

                在下面的 SQL 语句中，我们把三个列（url、alexa 和 country）结合在一起，并创建一个名为 "site_info" 的别名：

				MariaDB [shiyandb]> SELECT name,CONCAT(url,',',alexa,',',country)AS site_info FROM wangzhan;
				+---------------+---------------------------------+
				| name          | site_info                       |
				+---------------+---------------------------------+
				| Google        | https://www.google.com/,1,USA   |
				| 淘宝          | https://www.taobao.com/,13,CN   |
				| Facebook      | https://www.facebook.com/,3,USA |
				| 京东          | NULL                            |
				| 天猫          | https://www.tmall.com/,5,CN     |
				| 新浪          | https://www.xinlang.com,7,CN    |
				| 网易          | http://www.163.com/,10,CN       |
				| 淘宝          | http://www.taobao.com/,11,CN    |
				| stackoverflow | http://stackoverflow.com/,0,IND |
				+---------------+---------------------------------+
				9 rows in set (0.00 sec)












Linux平台上推荐使用RPM包来安装Mysql,MySQL AB提供了以下RPM包的下载地址：
	MySQL - MySQL服务器。你需要该选项，除非你只想连接运行在另一台机器上的MySQL服务器。
	MySQL-client - MySQL 客户端程序，用于连接并操作Mysql服务器。
	MySQL-devel - 库和包含文件，如果你想要编译其它MySQL客户端，例如Perl模块，则需要安装该RPM包。
	MySQL-shared - 该软件包包含某些语言和应用程序需要动态装载的共享库(libmysqlclient.so*)，使用MySQL。
	MySQL-bench - MySQL数据库服务器的基准和性能测试工具。
    
    centos 6
		    yum install mysql
			yum install mysql-server
			yum install mysql-devel
	
	centos 7		
			如果是 CentOS 7 版本，由于 MySQL数据库已从默认的程序列表中移除，可以使用 mariadb 代替：
			yum install mariadb-server mariadb 


管理MySQL的命令 

    mysql> use RUNOOB;                                                               ----                选择要操作的Mysql数据库，使用该命令后所有Mysql命令都只针对该数据库。
    mysql> SHOW DATABASES;                                                           ----                列出 MySQL 数据库管理系统的数据库列表。
    mysql> SHOW TABLES;                                                              ----                显示指定数据库的所有表，使用该命令前需要使用 use 命令来选择要操作的数据库。
    mysql> SHOW COLUMNS FROM runoob_tbl;                                             ----                显示数据表的属性，属性类型，主键信息 ，是否为 NULL，默认值等其他信息。
    mysql> SHOW INDEX FROM runoob_tbl;                                               ----                显示数据表的详细索引信息，包括PRIMARY KEY（主键）
    SHOW TABLE STATUS LIKE [FROM db_name] [LIKE 'pattern'] \G:                       ----                该命令将输出Mysql数据库管理系统的性能及统计信息。
    	mysql> SHOW TABLE STATUS  FROM RUNOOB;                                           ----                # 显示数据库 RUNOOB 中所有表的信息
    	mysql> SHOW TABLE STATUS FROM RUNOOB LIKE 'runoob%';                             ----                # 表名以runoob开头的表的信息 
    	mysql> SHOW TABLE STATUS FROM RUNOOB LIKE 'runoob%'\G;                           ----                # 加上 \G，查询结果按列打印  	

    mysql> grant all on testdb.* to common_user@'%'                                  ----                授权用户在testdb.*表中的所有权限
        mysql> grant select on testdb.* to common_user@'%'                               ----                #授权查
		mysql> grant insert on testdb.* to common_user@'%'                               ----           	 #授权插入
		mysql> grant update on testdb.* to common_user@'%'                               ----           	 #授权修改
		mysql> grant delete on testdb.* to common_user@'%'	                             ----           	 #授权删除
