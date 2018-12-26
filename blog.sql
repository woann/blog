-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2018-12-26 11:39:29
-- 服务器版本： 5.5.60-log
-- PHP 版本： 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_config`
--

CREATE TABLE `b_admin_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `config_key` varchar(255) DEFAULT NULL,
  `config_value` text,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_admin_config`
--

INSERT INTO `b_admin_config` (`id`, `name`, `config_key`, `config_value`, `type`, `created_at`, `updated_at`) VALUES
(7, '后台管理LOGO', 'admin_logo', '/uploads/avatar/20181107/5be269ef937d1.png', 'image', '2018-10-31 03:03:52', '2018-10-31 03:03:52'),
(9, '博客标题', 'blog_title', '吴先生的博客', 'string', '2018-12-17 12:11:04', '2018-12-17 12:11:04'),
(10, '声明', 'notice', '本站采用「署名 4.0 国际 (CC BY 4.0)」创作共享协议。通俗地讲，只要在使用时署名，那么使用者可以对本站所有原创内容进行转载、节选、混编、二次创作，允许商业性使用。', 'string', '2018-12-18 09:01:19', '2018-12-18 09:01:19'),
(11, '寄语', 'word', '<p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\">你只能闻到我的香水却没看到我的汗水</p><p style=\"text-align: center;\">你有你的规则</p><p style=\"text-align: center;\">我有我的选择</p><p style=\"text-align: center;\">你否定我的现在</p><p style=\"text-align: center;\">我决定我的将来</p><p style=\"text-align: center;\">你嘲笑我的一无所有</p><p style=\"text-align: center;\">不配去爱</p><p style=\"text-align: center;\">我可怜你总是等待</p><p style=\"text-align: center;\">你可以轻视我们的年轻</p><p style=\"text-align: center; \">我们会证明</p><p style=\"text-align: center;\">这是谁的时代</p><p style=\"text-align: center; \">梦想是注定孤独的旅行</p><p style=\"text-align: center; \">路上少不了质疑和嘲笑</p><p style=\"text-align: center; \">但那又怎样</p><p style=\"text-align: center; \">哪怕遍体鳞伤</p><p style=\"text-align: center; \">也要活得漂亮。<br></p><p style=\"text-align: center;\"><br></p>', 'text', '2018-12-18 09:03:01', '2018-12-24 17:43:04'),
(12, '我的头像', 'blog_avatar', '/uploads/config/20181218/5c18b90d354c8.jpeg', 'image', '2018-12-18 17:08:30', '2018-12-18 17:08:30'),
(13, '网站小图标', 'favicon_icon', '/uploads/config/20181218/5c18bcffbb9d9.ico', 'image', '2018-12-18 17:25:21', '2018-12-18 17:25:21'),
(14, '网站title', 'website_title', '吴先生的博客 - 东北IT清流', 'string', '2018-12-19 13:12:59', '2018-12-19 13:12:59'),
(15, '网站关键字', 'keywords', '吴先生的博客,php,golang,php博客,golang博客,golang技术交流,沈阳golang', 'string', '2018-12-19 13:13:26', '2018-12-19 13:13:26'),
(16, '网站描述', 'description', '吴先生的博客是一个技术分享社区', 'string', '2018-12-19 13:13:45', '2018-12-19 13:13:45');

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_menu`
--

CREATE TABLE `b_admin_menu` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `b_admin_menu`
--

INSERT INTO `b_admin_menu` (`id`, `pid`, `name`, `url`, `icon`, `sort`, `created_at`, `updated_at`) VALUES
(1, 0, '文章管理', '/admin/article', 'mdi mdi-grease-pencil', 10, '2018-12-19 10:52:49', '2018-12-19 10:52:49'),
(2, 1, '写文章', '/admin/article/add', NULL, 10, '2018-12-19 10:53:11', '2018-12-19 10:53:11'),
(3, 1, '文章列表', '/admin/article', NULL, 9, '2018-12-19 17:20:34', '2018-12-19 17:20:34'),
(4, 0, '文章分类', '/admin/category', 'mdi mdi-source-branch', 8, '2018-12-19 17:24:46', '2018-12-19 17:24:46'),
(6, 0, '回收站', '/admin/recover', 'mdi mdi-delete', 6, '2018-12-19 17:26:59', '2018-12-19 17:26:59'),
(7, 0, '轮播管理', '/admin/banner', 'mdi mdi-file-image', 11, '2018-12-19 17:33:39', '2018-12-19 17:33:39');

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_permission`
--

CREATE TABLE `b_admin_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `route` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `b_admin_permission`
--

INSERT INTO `b_admin_permission` (`id`, `name`, `route`, `created_at`, `updated_at`) VALUES
(3, '所有权限', 'admin/menu/list,admin/menu/add,admin/menu/update/{id},admin/menu/del/{id},admin/role/list,admin/permission/list,admin/permission/add,api/set_callback_url,admin/role/add,admin/role/update/{id},admin/role/del/{id},admin/permission/update/{id},admin/permission/del/{id},admin/administrator/list,admin/administrator/add,admin/administrator/update/{id},admin/administrator/del/{id},admin/upload,admin/403,login,set_callback_url,/,console,403,edit/info/{id},logout', '2018-10-30 03:13:20', '2018-10-30 08:18:53');

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_role`
--

CREATE TABLE `b_admin_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `b_admin_role`
--

INSERT INTO `b_admin_role` (`id`, `name`, `des`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', '系统最高权限', '2018-10-30 03:43:03', '2018-10-30 07:25:03');

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_role_menu`
--

CREATE TABLE `b_admin_role_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单-权限关系表';

--
-- 转存表中的数据 `b_admin_role_menu`
--

INSERT INTO `b_admin_role_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(6, 1, 6),
(7, 1, 7);

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_role_permission`
--

CREATE TABLE `b_admin_role_permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关系表';

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_user`
--

CREATE TABLE `b_admin_user` (
  `id` int(11) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `account` varchar(30) NOT NULL,
  `password` varchar(500) NOT NULL,
  `clear_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

--
-- 转存表中的数据 `b_admin_user`
--

INSERT INTO `b_admin_user` (`id`, `avatar`, `nickname`, `account`, `password`, `clear_password`) VALUES
(1, '/uploads/avatar/20181031/5bd90252493d1.jpg', '最牛逼的程序员', 'admin', '$2y$10$66R/M4kFezI/PDlXf1DEfuRmlBSREyMlVgxTzG8s1JmAoq1TrQ3B2', 'wqg951122');

-- --------------------------------------------------------

--
-- 表的结构 `b_admin_user_role`
--

CREATE TABLE `b_admin_user_role` (
  `id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员-角色关系表';

--
-- 转存表中的数据 `b_admin_user_role`
--

INSERT INTO `b_admin_user_role` (`id`, `admin_user_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `b_article`
--

CREATE TABLE `b_article` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `author` varchar(255) NOT NULL,
  `des` varchar(1000) CHARACTER SET utf8mb4 NOT NULL,
  `view` int(11) NOT NULL DEFAULT '200',
  `tags` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_article`
--

INSERT INTO `b_article` (`id`, `category_id`, `cover`, `title`, `author`, `des`, `view`, `tags`, `content`, `recommend`, `top`, `state`, `created_at`) VALUES
(5, 4, '/uploads/avatar/20181219/5c19faf1d91c6.png', 'Light-php 基于swoole的高性能php框架', '吴先生的博客', '🚀Light-php是一个基于swoole的高性能php框架，轻量的封装和易用性，使它在中小型高性能项目中有着出色的表现。', 121, 'swoole,PHP,高性能', '> 🚀`Light-php`是一个基于swoole的高性能php框架，轻量的封装和易用性，使它在中小型高性能项目中有着出色的表现。\r\n\r\n## 环境要求\r\n\r\n| 依赖 | 说明 |\r\n| -------- | -------- |\r\n| [PHP](https://secure.php.net/manual/zh/install.php) | `>= 7.2` `推荐7.2` |\r\n| [Swoole](https://www.swoole.com/) | `>= 4.2.9` `从2.0.12开始不再支持PHP5` `推荐4.2.9+` |\r\n| [Linux](https://www.linux.org/) | `大部分的linux系统都可以` `推荐centos` |\r\n\r\n## 安装教程\r\n\r\n1-1.通过[Composer](https://getcomposer.org/)安装([packagist](https://packagist.org/packages/woann/light-php)),此方式安装版本可能不是最新的，出现此问题请用1-2方式安装。\r\n```bash\r\ncomposer create-project woann/light-php -vvv\r\n```\r\n\r\n1-2.通过[Git](https://git-scm.com/)安装。\r\n```bash\r\ngit clone https://github.com/woann/Light-php.git\r\n```\r\n\r\n2.重命名`.env.example`文件为`.env`,并配置\r\n\r\n3.项目根目录下执行 `php bin\\light start` 启动服务\r\n\r\n![image.png](https://upload-images.jianshu.io/upload_images/9160823-d5a075e73fd5faeb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n4.浏览器访问`http://127.0.0.1:9521` 即可看到欢迎页面。至此，框架就安装完成了。\r\n\r\n## 配置文件\r\n1.Light-php的配置文件在`/config`目录下，框架集成了全局环境配置文件`/.env`,常规配置都在.env文件中进行配置。\r\n\r\n2.`/config/app.php`,框架主要配置文件主要用来配置`swoole`扩展相关参数。\r\n\r\n3.`/config/databases.php`,数据库配置文件，配置了数据库连接相关参数。\r\n\r\n4.`/config/hook.php`,配置钩子(钩子主要用来将业务逻辑和通知服务分离)。\r\n\r\n5.`/config/redis.php`,`redis`配置文件，配置了`redis`连接相关参数。\r\n\r\n6.`/config/route.php`,路由配置文件。\r\n\r\n7.以上配置文件具体参数意义在代码中都有注释，这里不做更多介绍\r\n\r\n## 路由\r\n\r\n以下是一个路由示例`/config/route.php`，包含http路由和websocket路由(注意：路由中，控制器参数为控制器的简写，实际控制器文件应在后追加`Controller`)\r\n```php\r\nreturn [\r\n    \'m\'             => \'index\',    //默认模块\r\n    \'c\'             => \'index\',    //默认控制器\r\n    \'a\'             => \'init\',     //默认操作\r\n    \'ext\'           => \'.html\',    //伪静态后缀    例如 .html\r\n    \'http\'          =>  [          //http路由\r\n        //uri-----请求方法----模块/控制器/方法----[中间件]\r\n        \'/\'     => [\'GET\',\'Index/Index/index\',\'Test\'],\r\n        \'test/\'    => [\'GET\',\'Index/Index/ws\']\r\n    ],\r\n    \'websocket\'     =>  [           //websocket路由\r\n        //uri----模块/控制器/方法\r\n        \'ws\' => \'Index/WebSocket/index\',\r\n    ]\r\n];\r\n```\r\n\r\n## 中间件\r\n\r\n中间件文件应建立在`/app/Middleware`目录下，类名与文件名要一致，并实现`Lib\\Middleware`接口，中间件处理方法名必须为`handle`,过滤后如果通过最终返回结果必须为`true`。示例：\r\n\r\n```php\r\n<?php\r\nnamespace app\\Middleware;\r\n\r\nuse Lib\\Middleware;\r\nclass Test implements Middleware{\r\n    public function handle($request)\r\n    {\r\n        //在此处理中间件判断逻辑，\r\n        //...\r\n\r\n        //程序最后通过验证后，返回true;\r\n        return true;\r\n    }\r\n}\r\n```\r\n\r\n## 控制器\r\n\r\n1.创建控制器，控制器文件应建立在`/app/Controller`目录下，类名与文件名要一致，必须继承`Lib\\Controller`类，示例：\r\n\r\n```php\r\n<?php\r\nnamespace app\\Controllers\\Index;\r\n\r\nuse Lib\\Controller;\r\n\r\nclass IndexController extends Controller {\r\n    //普通输出\r\n    public function index()\r\n    {\r\n        return \'hello world\';\r\n    }\r\n    \r\n    //输出json\r\n    public function index1()\r\n    {\r\n        return $this->json([\"code\" => 200, \"msg\" => \"success\"]);\r\n    }\r\n    \r\n    //调用模板\r\n     public function index2()\r\n    {\r\n        $a = \"test\";\r\n        //输出/app/resources/views目录下index.blade.php模板，并携带参数$a。支持用 . 拼接模板路径（和laravel中模板引擎部分一样）\r\n        return $this->view(\"index\",[\"a\" => $a]);\r\n        //也可以直接调用view函数\r\n        return view(\"admin.index\",[\"a\" => $a]);\r\n    }\r\n    \r\n}\r\n```\r\n\r\n2.获取参数\r\n\r\n```php\r\n    //获取get参数\r\n    $this->request->get()；//获取所有get参数:array\r\n    $this->request->get(\"name\")；//传参字符串，获取key为name的参数:string\r\n    $this->request->get([\"name\",\"age\"])；//传参数组，获取key为name和age的参数:array\r\n    \r\n    //获取post参数\r\n    $this->request->post()；//获取所有get参数:array\r\n    $this->request->post(\"name\")；//传参字符串，获取key为name的参数:string\r\n    $this->request->post([\"name\",\"age\"])；//传参数组，获取key为name和age的参数:array\r\n    \r\n    //获取上传文件\r\n    $this->request->getFiles();//获取所有\r\n    $this->request->getFile(\"image\");//获取指定文件\r\n    //文件上传\r\n    //--------文件----[路径]（基于/resources/uploads/）---[新文件名]（默认为随机生成）\r\n    uploadFile($file,\"banner\",\"test.png\");//上传文件方法 开发者也可以不用此方法自己写上传操作\r\n```\r\n\r\n## 钩子\r\n\r\n1.创建钩子，钩子文件应建立在`/app/Hook`目录下，类名与文件名要一致，必须继承`Lib\\BaseHook`类，示例：\r\n\r\n```php\r\n<?php\r\nnamespace app\\Hook;\r\n\r\nuse Lib\\BaseHook;\r\nuse Lib\\Log;\r\nclass TestHook extends BaseHook {\r\n    public function start($name,$ip,$port)\r\n    {\r\n        //当server启动时执行此钩子\r\n        Log::getInstance()->write(\'INFO\',$name,\"启动成功\",\"{$ip}:{$port}\",\"at\",date(\'Y-m-d H:i:s\'));\r\n    }\r\n    public function open($server,$fd){\r\n        //可以在此执行websocket链接成功后绑定用户id和fd的操作\r\n    }\r\n    public function close($server,$fd){\r\n        //可以在此执行websocket关闭链接后解绑用户id和fd的操作\r\n    }\r\n}\r\n```\r\n\r\n2.在钩子配置文件`/app/config/hook.php`中注册钩子\r\n\r\n```php\r\n<?php\r\nreturn [\r\n    //Server::onStart\r\n    \'start\'     => [\r\n        [\\app\\Hook\\TestHook::class,\'start\'],\r\n    ],\r\n    //Server::onOpen\r\n    \'open\'      => [\r\n        [\\app\\Hook\\TestHook::class,\'open\'],\r\n    ],\r\n    //Server::onClose\r\n    \'close\'     => [\r\n        [\\app\\Hook\\TestHook::class,\'close\'],\r\n    ],\r\n];\r\n\r\n```\r\n\r\n3.使用钩子\r\n\r\n```php\r\n//--获取钩子服务实例----监听方法--钩子名---参数（...）------\r\nHook::getInstance()->listen(\"start\",$this->name,$this->config[\'ip\'],$this->config[\'port\']);\r\n```\r\n## Task任务\r\n1.创建Task类，Task文件应建立在`/app/Task`目录下，类名与文件名要一致，示例：\r\n\r\n```php\r\n<?php\r\nnamespace app\\Task;\r\n\r\nclass Notice{\r\n    /**\r\n     * 给所有在线客户端发送消息\r\n     * @param $fd       发起请求的FD\r\n     * @param $data     要发送的内容\r\n     *\r\n     * @return bool\r\n     */\r\n    public function ToAll($fd,$data){\r\n        $fds = [] ;//用来存放所有客户端fd\r\n        foreach($this->server->connections as $client_fd){\r\n            if($fd != $client_fd && $this->server->exist($client_fd)){\r\n                //循环向客户端输出消息，排除掉发送者fd\r\n                $this->server->push($client_fd,$data);\r\n                $fds[] = $client_fd;\r\n            }\r\n        }\r\n        return \"已向[\".join(\",\",$fds).\"]发送通知内容：\".$data;\r\n    }\r\n}\r\n\r\n```\r\n2.控制器中投递任务\r\n\r\n```php\r\n//---------获取task示例----赋值server---------------投递任务---任务类------------方法------------参数\r\n\\Lib\\Task::getInstance()->setServer($this->server)->delivery(\\app\\Task\\Notice::class,\'ToAll\',[1,\"123\"]);\r\n```\r\n## WebSocket\r\n\r\n1.开启websocket server，配置`.env`文件`SERVER_TYPE=websocket`,此配置环境下可同时监听http\r\n\r\n2.定义路由，参考文档路由部分，在路由配置文件`/config/route.php`，`websocket`索引下定义路由。\r\n\r\n3.控制器示例\r\n```php\r\n<?php\r\nnamespace app\\Controllers\\Index;\r\n\r\nuse Lib\\WsController;\r\nclass WebSocketController extends WsController {\r\n    public function index()\r\n    {\r\n        //给客户端发送消息\r\n        //$this->>fd 客户端唯一标示\r\n        //$this->>server websocket server对象（此对象提供的功能参考swoole文档）\r\n        //\r\n        $data = \"哈哈哈我是一条消息\";\r\n        $data2 = \"这是一条通过task任务群发消息\";\r\n        $this->server->push($this->fd,$data);\r\n        //投递异步任务\r\n        $this->task->delivery (\\app\\Task\\Notice::class,\'ToAll\',[$this->fd,$data2]);\r\n    }\r\n\r\n}\r\n```\r\n\r\n4.前端略过(视图目录中有一个ws.blade.php文件，可以用来测试websocket)...\r\n\r\n## 数据库\r\n\r\n数据库采用`laravel`框架的`Illuminate\\Database`，熟悉laravel的小伙伴可极速上手。\r\n\r\n1.查询构建器，参考[文档](https://laravelacademy.org/post/9577.html)\r\n\r\n```php\r\n<?php\r\nnamespace app\\Controllers\\Index;\r\n\r\nuse Lib\\Controller;\r\nuse Lib\\DB;\r\nclass IndexController extends Controller {\r\n\r\n    public function index()\r\n    {\r\n        $res = DB::table(\'user\')->where(\'id\',1)->first();\r\n    }\r\n    \r\n}\r\n```\r\n\r\n2.Model,参考[文档](https://laravelacademy.org/post/9583.html)\r\n\r\n```php\r\nnamespace app\\Models;\r\n\r\nuse Illuminate\\Database\\Eloquent\\Model;\r\nclass User extends Model\r\n{\r\n    protected $table = \'user\';\r\n}\r\n```\r\n\r\n## 压力测试\r\n* 调用框架内一个json输出方法，输出如下内容：\r\n```json\r\n{\r\n    \"word\": \"hello world\"\r\n}\r\n```\r\n![image.png](https://upload-images.jianshu.io/upload_images/9160823-3ab2b3c662fb7ba6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* 方法内有一条查询语句的压力测试\r\n```php\r\n public function index(){\r\n        $res = DB::table(\'user\')->where(\'id\',\"=\",\"1\")->first();\r\n        return $this->json($res);\r\n    }\r\n```\r\n![image.png](https://upload-images.jianshu.io/upload_images/9160823-d79e85afedbcab85.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)', 1, 1, 0, '2018-12-19 16:06:12'),
(6, 2, '/uploads/avatar/20181219/5c19fe24000cf.png', 'yamecent-admin 基于laravel框架的rbac后台管理系统', '吴先生的博客', 'yamecent-admin是一款基于laravel框架进行封装的后台管理系统,其中包含：\r\n\r\nrbac权限管理模块\r\n完整的UI组件\r\n自定义配置管理\r\n图片上传,网络请求等常用的js公共函数\r\n持续维护中…', 29, 'php,laravel,后台管理,rbac', '# 欢迎使用yamecent-admin后台管理\r\n![LOGO](http://upload-images.jianshu.io/upload_images/9160823-5ca4487bc91ab57a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n## 项目简介\r\nyamecent-admin是一款基于laravel框架进行封装的后台管理系统,其中包含：\r\n\r\n* rbac权限管理模块\r\n* 完整的[UI组件](http://demo.cssmoban.com/cssthemes5/twts_141_PurpleAdmin/pages/ui-features/buttons.html)\r\n* 自定义配置管理\r\n* 图片上传,网络请求等常用的js公共函数\r\n* 持续维护中...\r\n\r\n\r\n## 安装教程\r\n* 执行安装命令 `composer create-project woann/yamecent-admin` 或者`git clone https://github.com/woann/yamecent-admin.git` \r\n* 配置域名(按laravel项目正常配置即可,解析到public目录)\r\n* 如发现权限相关问题 执行 chown -R 用户名:用户组 项目目录\r\n* 访问域名,登录即可进入管理系统\r\n* 首次访问域名时会跳转至安装页面![安装页面.jpg](https://upload-images.jianshu.io/upload_images/14769055-a5c3bae19726a891.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n* 填写完数据表配置之后，点击安装即可（有点小慢，喝口水）\r\n* 安装完之后就可以使用刚刚提交的管理员账号密码登录了（如果您想重新安装，要将/app/install/install.lock 文件删掉，重新访问网址即可）\r\n\r\n\r\n## js函数列表\r\n\r\n| 函数 | 用途 |\r\n| -------- | -------- |\r\n| myRequest(url,type,data,success,error){} | 发起ajax请求(包含laravel的token验证,loading等) |\r\n| function myConfirm(msg,confirm){} | 发起询问框 |\r\n| checkForm(){} | 验证表单 |\r\n| cutStr(){} | 限制td字数 |\r\n| batch(url){} | 批量操作 |\r\n| $(\"节点\").flatpickr(); | 时间选择器 |\r\n## 富文本\r\n * html\r\n ```html\r\n    <div class=\"form-group \">\r\n        <label >富文本</label>\r\n        <textarea  placeholder=\"请在此处编辑内容\"  id=\"editor\" style=\"height:400px;max-height:400px;overflow: hidden\"></textarea >   \r\n    </div>\r\n ```\r\n * javascript\r\n ```javascript\r\n    var editor = new wangEditor(\'editor\');\r\n    editor.config.uploadImgUrl = \"/admin/wangeditor/upload\";\r\n    // 隐藏掉插入网络图片功能。该配置，只有在你正确配置了图片上传功能之后才可用。\r\n    editor.config.hideLinkImg = false;\r\n    //关闭导航栏浮动\r\n    editor.config.menuFixed = false;\r\n    editor.create();\r\n ```\r\n * 示例\r\n![富文本编辑器](http://upload-images.jianshu.io/upload_images/14769055-b42c1b3b4f4ab979.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n## 时间选择器\r\n* yamecent-admin的时间选择器是引入flatpickr插件，支持多语言，各种格式的时间选择。[查看文档](https://flatpickr.js.org)\r\n* html\r\n ```html\r\n    <div class=\"form-group\">\r\n       <label >*生效时间</label>\r\n       <input type=\"text\"  class=\"form-control required calendar\" name=\"time\" placeholder=\"请选择时间\">\r\n    </div>\r\n ```\r\n * javascript\r\n ```javascript\r\n     $(\".calendar\").flatpickr({\r\n            dateFormat:\"Y-m-d H:i:S\",\r\n            enableTime:true,\r\n            enableSeconds:true\r\n            //更多配置百度搜索flatpickr即可找到\r\n        });\r\n ```\r\n  * 示例\r\n\r\n![时间选择器](https://upload-images.jianshu.io/upload_images/9160823-ee7dedaeb832a49c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n\r\n## 列表批量操作\r\n* html\r\n ```html\r\n    <!--按钮-->\r\n    <button type=\"button\" class=\"btn btn-sm btn-gradient-danger btn-icon-text\" onclick=\"batch(\'/admin/user/del/\')\">\r\n       <i class=\"mdi mdi-delete btn-icon-prepend\"></i>批量删除\r\n    </button>\r\n```\r\n```html\r\n    <!--全选复选框-->\r\n    <tr>\r\n        <th width=\"3%\">\r\n            <div class=\"form-check\">\r\n                <label class=\"form-check-label\">\r\n                    <input type=\"checkbox\" class=\"form-check-input batch-all\">\r\n                </label>\r\n            </div>\r\n         </th>\r\n        ...\r\n    </tr>\r\n```\r\n```html\r\n    <!--列表复选框-->\r\n    <tr>\r\n        <td>\r\n            <div class=\"form-check\">\r\n               <label class=\"form-check-label\">\r\n                   <input type=\"checkbox\" class=\"form-check-input td-check\" value=\"{{ $v->id }}\">\r\n               </label>\r\n            </div>\r\n        </td>\r\n        ...\r\n    </tr>\r\n ```\r\n\r\n * 示例\r\n![批量操作](http://upload-images.jianshu.io/upload_images/14769055-62ba575064933680.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n[1]: https://www.woann.cn\r\n[2]: http://xjj.woann.cn\r\n[3]: http://demo.woann.cn\r\n\r\n## 部分截图\r\n* 数据统计\r\n\r\n![数据统计](https://upload-images.jianshu.io/upload_images/9160823-33fd684515b11c2f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* 自定义配置（字符串，图片，富文本多种数据格式,可通过getConfig(\"key\")的方式获取配置值）\r\n\r\n![自定义配置](https://upload-images.jianshu.io/upload_images/9160823-bc9b710eaecf7ef7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* 权限管理\r\n\r\n![权限管理](https://upload-images.jianshu.io/upload_images/9160823-48859283e45b6fd2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* 菜单管理\r\n\r\n![菜单管理](https://upload-images.jianshu.io/upload_images/9160823-07eed87c32fc721c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* 管理员\r\n\r\n![管理员](https://upload-images.jianshu.io/upload_images/9160823-4b14ee0d83ab20da.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* 角色\r\n\r\n![角色](https://upload-images.jianshu.io/upload_images/9160823-f75c5aa058bf7e77.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n\r\n作者 [@woann][1]  [@xjj][2]   \r\n2018 年 10月 30日', 1, 0, 0, '2018-12-19 16:10:25'),
(7, 2, '/uploads/avatar/20181219/5c1a03ccd05ca.jpg', '[转] php 设计模式之单例模式', '吴先生的博客', '单例模式的几个要点,构造函数私有化,静态入口,实例化一次,用一个静态变量存储类的实例，只有第一次实例化的时候才赋值，以后都直接给出静态实例...', 24, 'php,单例模式,php经典设计模式', '## 构造函数私有化\r\n```php\r\nclass Test\r\n{\r\n    // 设置 一个封装的构造方法\r\n    private function __construct()\r\n    {\r\n        //占位, 不允许 new 这个对象\r\n    }\r\n}\r\n```\r\n## 静态入口\r\n```php\r\nclass TestInstance\r\n{\r\n    public static $_instance = null;\r\n    //为了防止外部new这个类，所以构造方法用protected，这是单例模式的关键之处\r\n    private function __construct()\r\n    {\r\n        //占位, 不允许 new 这个对象\r\n    }\r\n    //用一个静态变量存储类的实例，只有第一次实例化的时候才赋值，以后都直接给出静态实例\r\n    public static function getInstance()\r\n    {\r\n        return self::$_instance;\r\n    }\r\n}\r\n```\r\n## 实例化一次\r\n```php\r\nclass TestInstance\r\n{\r\n    public static $_instance = null;\r\n    //为了防止外部new这个类，所以构造方法用protected，这是单例模式的关键之处\r\n    private function __construct()\r\n    {\r\n        //占位, 不允许 new 这个对象\r\n    }\r\n    //用一个静态变量存储类的实例，只有第一次实例化的时候才赋值，以后都直接给出静态实例\r\n    public static function getInstance()\r\n    {\r\n        //todo::这里关键\r\n        if(!isset(self::$_instance)){\r\n            self::$_instance = new static();\r\n        }\r\n        return self::$_instance;\r\n    }\r\n}\r\n```', 1, 0, 0, '2018-12-19 16:41:04'),
(8, 2, '/uploads/avatar/20181219/5c1a0509c1559.jpg', '加速composer开启多线程安装下载', '吴先生的博客', '如果需要通过 composer 进行安装 composer 包,因为某种历史原因是不能够安装好的,虽然有国内Composer中国全量镜像,但是速度也挺慢的,有什么办法呢?', 22, 'composer,加速', '&nbsp;&nbsp;&nbsp;&nbsp;如果需要通过 composer 进行安装 composer 包,因为某种历史原因是不能够安装好的,虽然有国内Composer中国全量镜像,但是速度也挺慢的,有什么办法呢?\r\n## 安装插件\r\n```\r\ncomposer global require hirak/prestissimo\r\n```', 1, 0, 0, '2018-12-20 17:43:52'),
(9, 1, '/uploads/avatar/20181219/5c1a065d1cdf3.jpg', 'golang基础学习-字符串和整型互转', '吴先生的博客', '在golang语言中字符串和整数之间的转换相比PHP有点复杂。刚学习的人，尤其学过PHP，秒级可以搞定的事情，\r\n这里却要使用strcov包中函数转换，orz~~~~。\r\n没办法入了golang的大门，就要继续探究下去。', 42, 'golang,数据类型转换', '## 字符串转成整型\r\n函数：\r\n```golang\r\nfunc Atoi(s string) (int, error)\r\n```\r\n举例：\r\n```golang\r\nv := \"10\"\r\n if s, err := strconv.Atoi(v); err == nil {\r\n      fmt.Printf(\"%T, %v\", s, s)\r\n }\r\n //输出 int,10\r\n ```\r\n## 整型转成字符串\r\n函数：\r\n```\r\nfunc Itoa(i int) string\r\n```\r\n举例：\r\n```\r\ni := 10\r\ns := strconv.Itoa(i)\r\nfmt.Printf(\"%T, %v\\n\", s, s)\r\n//输出 string,10\r\n```', 1, 0, 0, '2018-12-19 16:53:04'),
(10, 5, '/uploads/avatar/20181219/5c1a0ad5e7899.jpg', 'mysql的水平分库分表和垂直分库分表', '吴先生的博客', '把整个系统划分为不同的业务模块,根据业务模块把数据库系统划分为不同的数据库,这种方式可以突破d 单机单库的性能瓶颈,也可以针对不同的业务数据进行分级的管理,维护和扩展.', 22, 'mysql,数据库,分表', '## 垂直分库\r\n&emsp;&emsp;把整个系统划分为不同的业务模块,根据业务模块把数据库系统划分为不同的数据库,这种方式可以突破d 单机单库的性能瓶颈,也可以针对不同的业务数据进行分级的管理,维护和扩展.\r\n## 垂直分表\r\n&emsp;&emsp;大表分小表,基于关系数据列进行拆分,把列比较多的表拆分为多个表,表之前有从属关系,这种拆分一般在数据库设计的时候就完成,否则系统的改动会比较大,这种拆分方式便于维护,也能避免数据跨页问题\r\n![image.png](https://www.aicyun.com/static/upload/image/2017/12/13/%E5%9E%82%E7%9B%B4%E5%92%8C%E6%B0%B4%E5%B9%B3-1.jpg)\r\n### 通常我们按以下原则进行垂直拆分:\r\n* 把不常用的字段单独放在一张表;\r\n* 把text，blob等大字段拆分出来放在附表中;\r\n* 经常组合查询的列放在一张表中;\r\n## 水平分表\r\n&emsp;&emsp;将表中不同的数据按照某种规则将数据分布到同库的不同表中,降低单表的数据量,提高数据的更改和查询性能,这种方式一般很少使用,因为使用的还是同一个数据库,在库级别还是存在连接数, io,cpu等性能瓶颈.\r\n![image.png](https://www.aicyun.com/static/upload/image/2017/12/13/%E5%9E%82%E7%9B%B4%E5%92%8C%E6%B0%B4%E5%B9%B3-2.jpg)\r\n### 水平拆分的一些技巧\r\n#### 拆分原则\r\n&emsp;&emsp;通常情况下，我们使用取模的方式来进行表的拆分;比如一张有400W的用户表users，为提高其查询效率我们把其分成4张表users1，users2，users3，users4\r\n通过用ID取模的方法把数据分散到四张表内Id%4+1 = [1,2,3,4]\r\n然后查询,更新,删除也是通过取模的方法来查询\r\n```php\r\n$_GET[\'id\'] = 17,\r\n17%4 + 1 = 2,  \r\n$tableName = \'users\'.\'2\'\r\nSelect * from users2 where id = 17;\r\n```\r\n&emsp;&emsp;在insert时还需要一张临时表uid_temp来提供自增的ID,该表的唯一用处就是提供自增的ID;\r\n```\r\ninsert into uid_temp values(null);\r\n```\r\n&emsp;&emsp;得到自增的ID后,又通过取模法进行分表插入;\r\n>注意,进行水平拆分后的表,字段的列和类型和原表应该是相同的,但是要记得去掉auto_increment自增长\r\n\r\n#### 其他\r\n* 部分业务逻辑也可以通过地区，年份等字段来进行归档拆分;\r\n* 进行拆分后的表，只能满足部分查询的高效查询需求，这时我们就要在产品策划上，从界面上约束用户查询行为。比如我们是按年来进行归档拆分的,这个时候在页面设计上就约束用户必须要先选择年,然后才能进行查询;\r\n* 在做分析或者统计时，由于是自己人的需求,多点等待其实是没关系的,并且并发很低,这个时候可以用union把所有表都组合成一张视图来进行查询,然后再进行查询;\r\n```\r\nCreate view users as select from users1 union select from users2 union.........\r\n```\r\n## 水平分库分表\r\n&emsp;&emsp;和水平分表类似,只是数据分布到不同的库的表中,可以缓解单机单库的性能瓶颈,这种方式使用比较普遍', 1, 0, 0, '2018-12-19 17:18:45'),
(11, 3, '/uploads/avatar/20181219/5c1a54fc75dcb.jpg', '[原创] nginx实现动态生成缩略图 已在线上实际应用', '吴先生的博客', '现在很多的项目都是一个服务端提供多个设备（手机、PC、平板等）显示数据，而且各种设备的不同型号又有很多种，这种情况就会需要很多各种尺寸的缩略图，此文章将会详细介绍nginx对图片的动态裁切和压缩缩略图。', 32, 'nginx缩略图,nginx动态生成缩略图,nginx', '## 场景\r\n&emsp;&emsp;假设现在有一个项目，目录为/home/wwwroot/test，项目保存原图的路径是/home/wwwroot/test/public/uploads，现在创建缩略图的缓存目录/home/wwwroot/test/public/cache,假设你的nginx配置文件分为nginx.conf，并且针对单个项目有子配置文件（如www.test.com.conf）,nginx.conf中引入了www.test.com.conf\r\n\r\n1.配置文件nginx.conf,在原有配置的基础上添加8080端口监听:\r\n![](https://admin.woann.cn/uploads/wangeditor/20181219/5c1a562018732.png)\r\n\r\n2.配置文件nginx.conf,在原有配置的基础上添加压缩处理图片的功能(image_resize):\r\n![](https://admin.woann.cn/uploads/wangeditor/20181219/5c1a5640e35c4.png)\r\n\r\n3.配置文件www.test.com.conf,在原有配置的基础上添加接收压缩图片的请求处理:\r\n![](https://admin.woann.cn/uploads/wangeditor/20181219/5c1a5656e99d2.png)\r\n\r\n## 处理流程\r\n* 假设有一张原图，在/home/wwwroot/test/public/uploads/1.jpg下，原图url:http://www.test.com/uploads/1.jpg\r\n\r\n* 当请求url:http://www.test.com/resize_100x100/uploads/1.jpg时，这个请求进入了location ~* ^/resize,接着判断image_path这个目录下是否存在这张图片,如果存在直接返回给用户\r\n\r\n* 如果不存在，则转发到http://127.0.0.1:8080/image_resize/uploads/1.jpg?width=100&height=100;\r\n\r\n* image_resize将图片裁剪压缩并缓存到服务器本地/home/wwwroot/test/public/cache/resize_100x100/uploads/1.jpg,并返\r\n\r\n### 配置代码（nginx.conf）：\r\n```\r\n listen 8080;\r\n```\r\n```\r\nlocation /image_resize {\r\n                alias /home/wwwroot/yamecent/admin/public;#源文件路径\r\n                image_filter crop $arg_width $arg_height;\r\n                image_filter_jpeg_quality 75;\r\n                access_log off;\r\n        }\r\n```\r\n\r\n### 配置代码（www.test.com.conf）：\r\n```\r\nlocation ~* ^/resize {\r\n            root /home/wwwroot/test/public/cache;#初始加载路径\r\n            set $width 150;\r\n            set $height 100;\r\n            set $dimens \"\";\r\n\r\n            if ($uri ~* \"^/resize_(\\d+)x(\\d+)/(.*)\" ) {\r\n                set $width $1;\r\n                set $height $2;\r\n                set $image_path $3;\r\n                set $demins \"_$1x$2\";\r\n            }\r\n\r\n            if ($uri ~* \"^/resize/(.*)\" ) {\r\n                set $image_path $1;\r\n            }\r\n\r\n            set $image_uri image_resize/$image_path?width=$width&height=$height;\r\n\r\n            if (!-f $request_filename) {\r\n                proxy_pass http://127.0.0.1:8080/$image_uri;\r\n                break;\r\n            }\r\n            proxy_store on;\r\n            proxy_temp_path /home/wwwroot/test/public/cache;#缓存路径\r\n            proxy_store_access user:rw group:rw all:r;\r\n            proxy_set_header Host $host;\r\n            access_log on;\r\n        }\r\n```\r\n##  效果\r\n![](https://admin.woann.cn/uploads/wangeditor/20181219/5c1a5706344c8.png)\r\n\r\n如有疑问请评论或者联系qq304550409', 1, 0, 0, '2018-12-19 22:35:20'),
(12, 3, '/uploads/avatar/20181220/5c1af889c31f0.png', 'Centos安装配置Supervisord', '吴先生的博客', 'Supervisord 是用 Python 实现的一款非常实用的进程管理工具，supervisord 还要求管理的程序是非 daemon 程序，supervisord 会帮你把它转成 daemon 程序。', 19, '进程守护,supervisord', '## 安装\r\n```\r\nyum install supervisor\r\n```\r\n## 设置开机启动\r\n```\r\nsystemctl enable supervisord.service\r\n```\r\n## 配置文件\r\n* supervisord 的配置 文件是` /etc/supervisord.conf`\r\n* 自定义配置文件目录是`/etc/supervisord.d`,该目录下文件已`.ini`为后缀\r\n\r\n## 添加配置\r\n在`/etc/supervisord.d`目录下新建后缀为`.ini`的配置文件，内容如下（示例）：\r\n```\r\n[program:nginx]\r\ndirectory = /www/lanmps/bin                                 ; 程序的启动目录\r\ncommand = /www/lanmps/bin/nginx start                ; 启动命令，可以看出与手动在命令行启动的命令是一样的\r\nautostart = true                                                         ; 在 supervisord 启动的时候也自动启动\r\nstartsecs = 5                                            ; 启动 5 秒后没有异常退出，就当作已经正常启动了\r\nautorestart = true                                   ; 程序异常退出后自动重启\r\nstartretries = 3                                        ; 启动失败自动重试次数，默认是 3\r\nuser = www                                           ; 用哪个用户启动\r\nredirect_stderr = true                               ; 把 stderr 重定向到 stdout，默认 false\r\nstdout_logfile_maxbytes = 20MB                   ; stdout 日志文件大小，默认 50MB\r\nstdout_logfile_backups = 20                          ; stdout 日志文件备份数\r\n; stdout 日志文件，需要注意当指定目录不存在时无法正常启动，所以需要手动创建目录（supervisord 会自动创建日志文件）\r\nstdout_logfile = /www/logs/usercenter_stdout.log\r\nstopasgroup=false     ;默认为false,进程被杀死时，是否向这个进程组发送stop信号，包括子进程\r\nkillasgroup=false     ;默认为false，向进程组发送kill信号，包括子进程\r\n\r\n; 可以通过 environment 来添加需要的环境变量，一种常见的用法是修改 PYTHONPATH\r\n; environment=PYTHONPATH=$PYTHONPATH:/path/to/somewhere\r\n```\r\n\r\n## supervisord 管理\r\n\r\nSupervisord 安装完成后有两个可用的命令行 supervisord 和 supervisorctl，命令使用解释如下：\r\n\r\n* supervisord，初始启动 Supervisord，启动、管理配置中设置的进程。\r\n* supervisorctl stop programxxx，停止某一个进程(programxxx)，programxxx 为 [program:beepkg] 里配置的值，这个示例就是 beepkg。\r\n* supervisorctl start programxxx，启动某个进程\r\n* supervisorctl restart programxxx，重启某个进程\r\n* supervisorctl stop groupworker: ，重启所有属于名为 groupworker 这个分组的进程(start,restart 同理)\r\n* supervisorctl stop all，停止全部进程，注：start、restart、stop 都不会载入最新的配置文件。\r\n* supervisorctl reload，载入最新的配置文件，停止原有进程并按新的配置启动、管理所有进程。\r\n* supervisorctl update，根据最新的配置文件，启动新配置或有改动的进程，配置没有改动的进程不会受影响而重启。\r\n>注意：显示用 stop 停止掉的进程，用 reload 或者 update 都不会自动重启。', 0, 0, 0, '2018-12-20 10:09:55'),
(13, 3, '/uploads/avatar/20181220/5c1b8af9c2b4d.png', 'Docker学习笔记（Linux安装篇）', '吴先生的博客', 'Docker 是一个开源的应用容器引擎，基于 Go 语言 并遵从Apache2.0协议开源。\r\n\r\nDocker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\r\n\r\n容器是完全使用沙箱机制，相互之间不会有任何接口（类似 iPhone 的 app）,更重要的是容器性能开销极低。', 221, 'docker,docker安装', '## 安装\r\n### 1.执行安装命令\r\n```shell\r\nwget -qO- https://get.docker.com/ | sh\r\n```\r\n然后会自动执行获取到的安装脚本文件，此过程安装脚本会自动为你匹配你的linux发行版本。\r\n安装完成后有个提示（WARNING）：\r\n```shell\r\nWARNING: Adding a user to the \"docker\" group will grant the ability to run\r\n         containers which can be used to obtain root privileges on the\r\n         docker host.\r\n         Refer to https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface\r\n         for more information.\r\n```\r\n当要以非root用户可以直接运行docker时，需要执行 `sudo usermod -aG docker user(替换成用户名)` 命令(作用是将指定用户添加到docker用户组)，然后重新登陆。\r\n### 2.启动\r\n```shell\r\nsudo service docker start\r\n```\r\n\r\n### 3.测试运行hello-world\r\n```shell\r\ndocker run hello-world\r\n```\r\n## 镜像加速\r\n鉴于国内网络问题，后续拉取 Docker 镜像十分缓慢，我们可以需要配置加速器来解决，我使用的是网易的镜像地址：http://hub-mirror.c.163.com。\r\n\r\n新版的 Docker 使用 /etc/docker/daemon.json（Linux） 或者 %programdata%\\docker\\config\\daemon.json（Windows） 来配置 Daemon。\r\n\r\n请在该配置文件中加入（没有该文件的话，请先建一个）：\r\n```json\r\n{\r\n  \"registry-mirrors\": [\"http://hub-mirror.c.163.com\"]\r\n}\r\n```', 1, 0, 0, '2018-12-20 20:30:31'),
(14, 2, '/uploads/avatar/20181220/5c1b8c57edbd2.jpg', 'php使用jwt用户身份认证', '吴先生', 'JSON WEB Token（JWT，读作 [/dʒɒt/]），是一种基于JSON的、用于在网络上声明某种主张的令牌（token）。JWT通常由三部分组成: 头信息（header）, 消息体（payload）和签名（signature）。', 218, 'jwt,jwt验证', '### 封装类\r\n```php\r\n// +----------------------------------------------------------------------\r\n// | Created by PhpStorm\r\n// +----------------------------------------------------------------------\r\n// | Date: 2018/9/10\r\n// +----------------------------------------------------------------------\r\n// | Blog: ( https://www.woann.cn )\r\n// +----------------------------------------------------------------------\r\n// | Author: woann <304550409@qq.com>\r\n// +----------------------------------------------------------------------\r\nnamespace App\\Utility;\r\n\r\nclass JwtBase {\r\n    //头部\r\n    private static $header=array(\r\n        \'alg\'=>\'HS256\', //生成signature的算法\r\n        \'typ\'=>\'JWT\'  //类型\r\n    );\r\n    //使用HMAC生成信息摘要时所使用的密钥\r\n    private static $key=\'KEY\';\r\n\r\n    /**\r\n     * 获取jwt token\r\n     * @param array $payload jwt载荷  格式如下非必须\r\n     * [\r\n     * \'iss\'=>\'jwt_admin\', //该JWT的签发者\r\n     * \'iat\'=>time(), //签发时间\r\n     * \'exp\'=>time()+7200, //过期时间\r\n     * \'nbf\'=>time()+60, //该时间之前不接收处理该Token\r\n     * \'sub\'=>\'www.admin.com\', //面向的用户\r\n     * \'jti\'=>md5(uniqid(\'JWT\').time()) //该Token唯一标识\r\n     * ]\r\n     * @return bool|string\r\n     */\r\n    public static function getToken(array $payload)\r\n    {\r\n        $arr = [\r\n            \'iss\'=>\'yamecent\', //该JWT的签发者\r\n            \'iat\'=>time(), //签发时间\r\n            \'exp\'=>time()+3600*24*15, //过期时间\r\n            \'nbf\'=>time(), //该时间之前不接收处理该Token\r\n            \'sub\'=>\'\', //面向的用户\r\n            \'jti\'=>md5(uniqid(\'JWT\').time()) //该Token唯一标识\r\n        ];\r\n        $payload = array_merge($arr,$payload);\r\n        if(is_array($payload))\r\n        {\r\n            $base64header=self::base64UrlEncode(json_encode(self::$header,JSON_UNESCAPED_UNICODE));\r\n            $base64payload=self::base64UrlEncode(json_encode($payload,JSON_UNESCAPED_UNICODE));\r\n            $token=$base64header.\'.\'.$base64payload.\'.\'.self::signature($base64header.\'.\'.$base64payload,self::$key,self::$header[\'alg\']);\r\n            return $token;\r\n        }else{\r\n            return false;\r\n        }\r\n    }\r\n\r\n\r\n    /**\r\n     * 验证token是否有效,默认验证exp,nbf,iat时间\r\n     * @param string $Token 需要验证的token\r\n     * @return bool|string\r\n     */\r\n    public static function verifyToken(string $Token)\r\n    {\r\n        $tokens = explode(\'.\', $Token);\r\n        if (count($tokens) != 3)\r\n            return false;\r\n\r\n        list($base64header, $base64payload, $sign) = $tokens;\r\n\r\n        //获取jwt算法\r\n        $base64decodeheader = json_decode(self::base64UrlDecode($base64header), JSON_OBJECT_AS_ARRAY);\r\n        if (empty($base64decodeheader[\'alg\']))\r\n            return false;\r\n\r\n        //签名验证\r\n        if (self::signature($base64header . \'.\' . $base64payload, self::$key, $base64decodeheader[\'alg\']) !== $sign)\r\n            return false;\r\n\r\n        $payload = json_decode(self::base64UrlDecode($base64payload), JSON_OBJECT_AS_ARRAY);\r\n\r\n        //签发时间大于当前服务器时间验证失败\r\n        if (isset($payload[\'iat\']) && $payload[\'iat\'] > time())\r\n            return false;\r\n\r\n        //过期时间小宇当前服务器时间验证失败\r\n        if (isset($payload[\'exp\']) && $payload[\'exp\'] < time())\r\n            return false;\r\n\r\n        //该nbf时间之前不接收处理该Token\r\n        if (isset($payload[\'nbf\']) && $payload[\'nbf\'] > time())\r\n            return false;\r\n\r\n        return $payload;\r\n    }\r\n\r\n\r\n\r\n\r\n    /**\r\n     * base64UrlEncode  https://jwt.io/ 中base64UrlEncode编码实现\r\n     * @param string $input 需要编码的字符串\r\n     * @return string\r\n     */\r\n    private static function base64UrlEncode(string $input)\r\n    {\r\n        return str_replace(\'=\', \'\', strtr(base64_encode($input), \'+/\', \'-_\'));\r\n    }\r\n\r\n    /**\r\n     * base64UrlEncode https://jwt.io/ 中base64UrlEncode解码实现\r\n     * @param string $input 需要解码的字符串\r\n     * @return bool|string\r\n     */\r\n    private static function base64UrlDecode(string $input)\r\n    {\r\n        $remainder = strlen($input) % 4;\r\n        if ($remainder) {\r\n            $addlen = 4 - $remainder;\r\n            $input .= str_repeat(\'=\', $addlen);\r\n        }\r\n        return base64_decode(strtr($input, \'-_\', \'+/\'));\r\n    }\r\n\r\n    /**\r\n     * HMACSHA256签名  https://jwt.io/ 中HMACSHA256签名实现\r\n     * @param string $input 为base64UrlEncode(header).\".\".base64UrlEncode(payload)\r\n     * @param string $key\r\n     * @param string $alg  算法方式\r\n     * @return mixed\r\n     */\r\n    private static function signature(string $input, string $key, string $alg = \'HS256\')\r\n    {\r\n        $alg_config=array(\r\n            \'HS256\'=>\'sha256\'\r\n        );\r\n        return self::base64UrlEncode(hash_hmac($alg_config[$alg], $input, $key,true));\r\n    }\r\n}\r\n```\r\n\r\n### 使用\r\n1.生成\r\n```php\r\n$token = JwtBase::getToken([\'user_id\'=>$user->id]);//生成token\r\n```\r\n\r\n2.验证\r\n```php\r\n$header = $request->header(\'Authorization\');//验证\r\n        $token = explode(\' \',$header);\r\n        if(!$header || !$token){\r\n            return $this->json(419,\'登录信息已过期，重新登录\');\r\n        }\r\n        $data = JwtBase::verifyToken($token[1]);\r\n        if(!$data){\r\n            return $this->json(419,\'登录信息已过期，重新登录\');\r\n        }\r\n```', 0, 0, 0, '2018-12-20 20:37:47'),
(15, 9, '/uploads/avatar/20181220/5c1b905b7ad78.jpeg', '[转] Laravel 应用性能调优', '吴先生的博客', '性能一直是 Laravel 框架为人诟病的一个点，所以调优 Laravel 程序算是一个必学的技能。接下来分享一些开发的最佳实践，还有调优技巧，大家有别的建议也欢迎留言讨论。', 224, 'Laravel,Laravel性能调优', '### 1. 关闭应用 debug\r\n打开应用根目录下的 .env 文件，把 debug 设置为 false。\r\n```\r\nAPP_DEBUG=false\r\n```\r\n### 2. 缓存配置信息\r\n```\r\nphp artisan config:cache\r\n```\r\n运行以上命令可以把 config 文件夹里所有配置信息合并到一个bootstrap/cache/config.php 文件中，减少运行时载入文件的数量。\r\n\r\n### 3. 缓存路由信息\r\n```\r\nphp artisan route:cache\r\n```\r\n运行以上命令会生成文件 bootstrap/cache/routes.php。路由缓存可以有效的提高路由器的注册效率，在大型应用程序中效果越加明显。\r\n```\r\nphp artisan route:clear\r\n```\r\n运行以上命令会清除路由缓存，也就是删除 bootstrap/cache/routes.php 文件。\r\n\r\n### 4. 类映射加载优化\r\n```\r\nphp artisan optimize --force\r\n```\r\n运行以上命令能够把常用加载的类合并到一个文件中，通过减少文件的加载来提高运行效率。这个命令会生成 `bootstrap/cache/compiled.php` 和` bootstrap/cache/services.json` 两个文件。\r\n\r\n通过修改 config/compile.php 文件可以添加要合并的类。\r\n\r\n在生产环境中不需要指定 --force 参数文件也可以自动生成。\r\n```\r\nphp artisan clear-compiled\r\n```\r\n运行以上命令会清除类映射加载优化，也就是删除 `bootstrap/cache/compiled.php` 和 `bootstrap/cache/services.json` 两个文件。\r\n\r\n### 5. 自动加载优化\r\n```\r\ncomposer dumpautoload -o\r\n```\r\nLaravel 应用程序是使用 composer 来构建的。这个命令会把 PSR-0 和 PSR-4 转换为一个类映射表来提高类的加载速度。\r\n>注意：php artisan optimize --force 命令里已经做了这个操作。\r\n\r\n### 6. 根据需要只加载必要的中间件\r\nLaravel 应用程序内置了并开启了很多的中间件。每一个 Laravel 的请求都会加载相关的中间件、产生各种数据。在 `app/Http/Kernel.php` 中注释掉不需要的中间件（如 session 支持）可以极大的提升性能。\r\n\r\n### 7. 使用即时编译器\r\nHHVM 和 OPcache 都能轻轻松松的让你的应用程序在不用做任何修改的情况下，直接提高 50% 或者更高的性能。', 0, 0, 0, '2018-12-20 20:51:41'),
(16, 9, '/uploads/avatar/20181221/5c1c9669a376c.png', 'Docker下安装配置lnmp环境', '吴先生的博客', '“容器化”部署已经是一种趋势，你还在为安装环境而大费周章的配置各种文件，敲各种命令吗？基于docker极速搭建lnmp环境，让phper对环境部署有一个新的定义。', 328, 'docker,docker搭建lnmp,lnmp环境搭建,lnmp', '>前提：已经成功安装Docker\r\n\r\n## 创建mysql容器\r\n### 执行以下命令创建容器\r\n```\r\ndocker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=wqg951122 --name woann_mysql mysql:5.6\r\n```\r\n参数说明\r\n* -d 让容器在后台运行\r\n* -p 添加主机到容器的端口映射(hostPort:containerPort)\r\n* -e 设置环境变量，这里是设置mysql的root用户的初始密码*\r\n* –name 容器的名字，随便取，但是必须唯一\r\n\r\n### 进入到容器(其他容器进入方法都是一样的，替换容器名执行命令即可)\r\n```\r\ndocker exec -ti woann_mysql /bin/bash\r\n```\r\n参数说明\r\n* -t 在容器里生产一个伪终端\r\n* -i 对容器内的标准输入 (STDIN) 进行交互\r\n\r\n### 安装vim（每个创建的容器都要执行此步骤，后续忽略）\r\n刚创建的容器没有安装vim，所以要手动安装，先执行\r\n```\r\napt update\r\n```\r\n再执行\r\n```\r\napt-get install vim\r\n```\r\n安装完毕即可\r\n\r\n## 创建php容器\r\n### 执行以下命令创建容器\r\n```\r\ndocker run -d -v /home/wwwroot:/home/wwwroot -p 9000:9000 --link woann_mysql:mysql --name woann_phpfpm php:7.2-fpm\r\n```\r\n参数说明\r\n* -d 让容器在后台运行\r\n* -p 添加主机到容器的端口映射\r\n* -v 添加目录映射，即主机上的`/home/wwwroot`和容器中`/home/wwwroot`目录是同步的\r\n* –name 容器的名字\r\n* –link 与另外一个容器建立起联系，这样我们就可以在当前容器中去使用另一个容器里的服务。\r\n这里如果不指定–link参数其实也是可以得，因为容器本身也是有ip的且唯一，所以我们也可以直接利用ip去访问容器。\r\n### 添加php测试文件\r\n在`/home/wwwroot`目录下添加测试php文件`index.php`\r\n内容：\r\n```\r\n<?php\r\nphpinfo();\r\n```\r\n## 创建nginx容器\r\n### 执行以下命令创建容器\r\n```\r\ndocker run -d -p 80:80  -v /home/wwwroot:/home/wwwroot --link woann_phpfpm:phpfpm --name woann_nginx nginx\r\n```\r\n参数说明：\r\n* -d 让容器在后台运行\r\n* -p 添加主机到容器的端口映射\r\n* -v 添加目录映射,这里最好nginx容器的根目录最好写成和php容器中根目录一样。但是不一点非要一模一样,如果不一样在配置nginx的时候需要注意\r\n* –name 容器的名字\r\n* –link 与另外一个容器建立起联系\r\n\r\n### 进入到nginx容器修改配置文件\r\n* nginx配置文件目录在`/etc/nginx/`目录下\r\n* 主配置文件为`/etc/nginx/nginx.conf`\r\n* 引用配置文件为`/etc/nginx/conf.d/*.conf`\r\n* nginx默认创建了一个引用配置文件(/etc/nginx/conf.d/default.conf)\r\n执行\r\n```\r\nvim /etc/nginx/conf.d/default.conf\r\n```\r\n添加如下代码，让nginx接收到php请求时自动转发到phpfpm容器\r\n```nginx\r\nlocation ~ \\.php$ {\r\n        root           /home/wwwroot;\r\n        fastcgi_pass   phpfpm:9000;\r\n        fastcgi_index  index.php;\r\n        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;\r\n        include        fastcgi_params;\r\n    }\r\n```\r\n## 测试结果\r\n### 查看刚才创建的所有容器\r\n```\r\ndocker ps\r\n```\r\n该命令查看所有正在运行的容器，如查看所有，在命令后加`-a`\r\n如下图所示\r\n![](https://admin.woann.cn/uploads/wangeditor/20181221/5c1c9ca639d5c.png)\r\n\r\n### 测试\r\n用浏览器访问`http://127.0.0.1/index.php`,即可看到phpinfo的信息页面。至此lnmp搭建完毕。', 1, 0, 0, '2018-12-21 15:59:12'),
(17, 1, '/uploads/avatar/20181226/5c22eee8ac1de.png', 'golang时间戳转几秒前 几分钟前 几小时前 几天前 几年前', '吴先生的博客', '在日常开发过程中，我们可能会遇到这种需求：发布时间显示距离现在时间有多久，也就是几秒前 几分钟前 几小时前 几天前 几年前。接下来就用go原因实现这个需求。', 217, 'golang,golang几秒前,golang几分钟前', '### 废话不多说直接上代码\r\n```golang\r\n/**\r\n* @时间转换函数\r\n* @param atime string 要转换的时间戳（秒）\r\n* @return string\r\n*/\r\nfunc StrTime (atime int64) string{\r\n	var byTime = []int64{365*24*60*60,24*60*60,60*60,60,1}\r\n	var unit = []string{\"年前\",\"天前\",\"小时前\",\"分钟前\",\"秒钟前\"}\r\n	now := time.Now().Unix()\r\n	ct := now - atime\r\n	if ct < 0{\r\n		return \"刚刚\"\r\n	}\r\n	var res string\r\n	for i := 0;i < len(byTime);i++{\r\n		if ct < byTime[i]{\r\n			continue\r\n		}\r\n		var temp = math.Floor(float64(ct / byTime[i]))\r\n		ct = ct % byTime[i];\r\n		if temp > 0 {\r\n			var tempStr string\r\n			tempStr = strconv.FormatFloat(temp,\'f\',-1,64)\r\n			res = MergeString(tempStr,unit[i]) //此处调用了一个我自己封装的字符串拼接的函数（你也可以自己实现）\r\n		}\r\n		break//我想要的形式是精确到最大单位，即：\"2天前\"这种形式，如果想要\"2天12小时36分钟48秒前\"这种形式，把此处break去掉，然后把字符串拼接调整下即可（别问我怎么调整，这如果都不会我也是无语）\r\n	}\r\n	return res\r\n}\r\n\r\n/**\r\n* @des 拼接字符串\r\n* @param args ...string 要被拼接的字符串序列\r\n* @return string\r\n*/\r\nfunc MergeString (args ...string) string {\r\n	buffer := bytes.Buffer{}\r\n	for i:=0; i<len(args); i++ {\r\n		buffer.WriteString(args[i])\r\n	}\r\n	return buffer.String()\r\n}\r\n\r\n```\r\n\r\n## 测试\r\n```golang\r\nfunc main() {\r\n	res := StrTime(1545793886)\r\n	fmt.Println(res)\r\n	//打印出的结果 \"19秒钟前\"\r\n}\r\n```', 1, 0, 0, '2018-12-26 11:12:53'),
(18, 3, '/uploads/avatar/20181226/5c22f3f4f229c.jpg', '[转] Centos7 上 用crontab 实现php计划任务', '简书', 'crontab命令常见于Unix和类Unix的操作系统之中，用于设置周期性被执行的指令。该命令从标准输入设备读取指令，并将其存放于“crontab”文件中，以供之后读取和执行。', 204, 'linux,定时任务,crontab', '### 首先用命令检查服务是否在运行\r\n```\r\nsystemctl status crond.service\r\n```\r\n### 如果服务器上没有装有crontab ,则可以执行\r\n```\r\nyum install vixie-cron\r\nyum install crontabs\r\n```\r\n### 常用指令\r\n```\r\nsystemctl restart crond.service #启动服务\r\n\r\nsystemctl reload crond.service #重新载入配置\r\n\r\nsystemctl status crond.service #查看crontab服务状态\r\n\r\nsystemctl enable crond.service #开机自启动\r\n```\r\n###启动服务之后可以输入指令\r\n```\r\ncrontab -e #进入定时任务编辑\r\n```\r\n### 相关参数\r\n```\r\n基本格式 :\r\n* * * * * command\r\n分　 时　 日　 月　 周　 命令\r\n第1列表示分钟1～59 每分钟用*或者 */1表示\r\n第2列表示小时1～23（0表示0点）\r\n第3列表示日期1～31\r\n第4列表示月份1～12\r\n第5列标识号星期0～6（0表示星期天）\r\n第6列要运行的命令\r\n```\r\n### 例子\r\n```shell\r\n*/2 * * * * curl -o /home/index.html www.baidu.com #每隔两分钟使用curl 访问www.baidu.com 并将结果写入/home/index.html 文件\r\n```', 0, 0, 0, '2018-12-26 11:26:05');

-- --------------------------------------------------------

--
-- 表的结构 `b_banner`
--

CREATE TABLE `b_banner` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `des` varchar(255) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_banner`
--

INSERT INTO `b_banner` (`id`, `article_id`, `url`, `image`, `des`, `state`) VALUES
(1, 0, 'https://github.com/woann/Light-php', '/uploads/banner/20181220/5c1b9678da509.png', 'Light-php框架', 0),
(2, 0, 'https://github.com/woann/yamecent-admin', '/uploads/banner/20181220/5c1b989797230.png', 'yamecent-admin', 0);

-- --------------------------------------------------------

--
-- 表的结构 `b_category`
--

CREATE TABLE `b_category` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '值越大排序越靠前',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0显示 1隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_category`
--

INSERT INTO `b_category` (`id`, `pid`, `name`, `icon`, `sort`, `state`) VALUES
(1, 0, 'Golang', 'mdi mdi-google', 99, 0),
(2, 0, 'PHP', 'mdi mdi-language-php', 98, 0),
(3, 0, '服务器', 'mdi mdi-server', 97, 0),
(4, 2, 'swoole', NULL, 96, 0),
(5, 0, '数据库', 'mdi mdi-database', 95, 0),
(6, 0, '前端', 'mdi mdi-web', 94, 1),
(9, 2, 'Laravel', NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `b_url`
--

CREATE TABLE `b_url` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `data_id` varchar(20) NOT NULL,
  `from` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `b_url`
--

INSERT INTO `b_url` (`id`, `title`, `url`, `cover`, `data_id`, `from`, `created_at`) VALUES
(119, '分布式事务中间件  TCC-Transaction 源码分析 —— TCC 实现', 'https://juejin.im/entry/5c22a884e51d4550442a57ba', '', '5c22a884e51d4550442a', '掘金', 1545790520),
(120, '为什么阿里巴巴要求程序员谨慎修改serialVersionUID 字段的值', 'https://juejin.im/entry/5c2192de6fb9a049e2320859', '', '5c2192de6fb9a049e232', '掘金', 1545790520),
(121, '既生 Redis 何生 LevelDB ？', 'https://juejin.im/post/5c22e049e51d45206d12568e', 'https://user-gold-cdn.xitu.io/2018/12/26/167e8443bd84a7eb?imageView2/1/w/120/h/120/q/85/interlace/1', '5c22e049e51d45206d12', '掘金', 1545790520),
(122, '详解 Kubernetes Pod 的实现原理', 'https://juejin.im/entry/5c22d2b2f265da611b58631f', '', '5c22d2b2f265da611b58', '掘金', 1545790521),
(123, '分布式事务中间件  TCC-Transaction 源码分析 —— 调试环境搭建', 'https://juejin.im/entry/5c2157046fb9a049b13e38e3', '', '5c2157046fb9a049b13e', '掘金', 1545790521),
(124, '【Java进阶面试系列之五】消息中间件集群崩溃，如何保证百万生产数据不丢失？【石杉的架构笔记】', 'https://juejin.im/post/5c1e51fd6fb9a049a81f4f35', 'https://user-gold-cdn.xitu.io/2018/12/22/167d677ffa17fdd0?imageView2/1/w/120/h/120/q/85/interlace/1', '5c1e51fd6fb9a049a81f', '掘金', 1545790521),
(125, '为什么Java中有三种基础的类加载器？', 'https://juejin.im/post/5c21c208f265da611c26ffda', '', '5c21c208f265da611c26', '掘金', 1545790521),
(126, '解读mysql的索引和事务的正确姿势', 'https://juejin.im/post/5c20dba7f265da612b139cd0', '', '5c20dba7f265da612b13', '掘金', 1545790522),
(127, 'IDEA支付宝小程序开发流程——项目搭建', 'https://juejin.im/post/5c20c144f265da610f63bc9f', 'https://user-gold-cdn.xitu.io/2018/12/24/167dff5d2a71aa93?imageView2/1/w/120/h/120/q/85/interlace/1', '5c20c144f265da610f63', '掘金', 1545790522),
(128, '对于Ping的过程，你真的了解吗？', 'https://juejin.im/post/5c15ec0f6fb9a049ec6af8b2', '', '5c15ec0f6fb9a049ec6a', '掘金', 1545790522),
(129, '什么是ClassLoader', 'https://juejin.im/entry/5c21a3f86fb9a049fd0fde41', '', '5c21a3f86fb9a049fd0f', '掘金', 1545790522),
(130, '举个栗子看如何做MySQL 内核深度优化', 'https://juejin.im/post/5c21a4075188256d983317a6', '', '5c21a4075188256d9833', '掘金', 1545790523),
(131, '分布式作业系统 Elastic-Job-Cloud 源码分析 —— 高可用', 'https://juejin.im/entry/5c2005855188257d99376293', '', '5c2005855188257d9937', '掘金', 1545790523),
(132, '成熟的 Git 分支模型', 'https://juejin.im/post/5c1a4d1df265da6170071422', '', '5c1a4d1df265da617007', '掘金', 1545790523),
(133, 'Java Builder 模式,你搞懂了么?', 'https://juejin.im/post/5c2088205188251920598d85', '', '5c208820518825192059', '掘金', 1545790523),
(134, '看图轻松理解并查集', 'https://juejin.im/post/5c202b74f265da61461e2b02', 'https://user-gold-cdn.xitu.io/2018/12/24/167ddaae242d593b?imageView2/1/w/120/h/120/q/85/interlace/1', '5c202b74f265da61461e', '掘金', 1545790524),
(135, '详解tomcat的连接数与线程池', 'https://juejin.im/entry/5c21a3cf6fb9a049b82a7bfe', '', '5c21a3cf6fb9a049b82a', '掘金', 1545790524),
(136, '订单服务的设计思考', 'https://juejin.im/post/5c1e4d48f265da61120500e3', '', '5c1e4d48f265da611205', '掘金', 1545790524),
(137, '《快学 Go 语言》第 15 课 —— 反射', 'https://juejin.im/post/5c2040d76fb9a049c643d9bd', '', '5c2040d76fb9a049c643', '掘金', 1545790524),
(138, '看动画理解「链表」实现LRU缓存淘汰算法', 'https://juejin.im/post/5c202c13f265da61620d6649', '', '5c202c13f265da61620d', '掘金', 1545790524),
(139, '2018 年年终总结 - J_Knight_', 'https://juejin.im/post/5c1fa32751882537c0766e30', 'https://user-gold-cdn.xitu.io/2018/12/25/167e16f52b5b956c?imageView2/1/w/120/h/120/q/85/interlace/1', '5c1fa32751882537c076', '掘金', 1545791474),
(140, '2018 年度复盘', 'https://juejin.im/post/5c22cd166fb9a04a0c2e7a93', 'https://user-gold-cdn.xitu.io/2018/12/26/167e7f16bee75c36?imageView2/1/w/120/h/120/q/85/interlace/1', '5c22cd166fb9a04a0c2e', '掘金', 1545791474),
(141, '开源即责任', 'https://juejin.im/post/5c21a3ea5188254eaa5c4486', 'https://user-gold-cdn.xitu.io/2018/12/25/167e4ca8ec759d52?imageView2/1/w/120/h/120/q/85/interlace/1', '5c21a3ea5188254eaa5c', '掘金', 1545791474),
(142, '掘金 AMA：我是前端娱乐圈的老人 & Facebook 实习生 -- 黄玄，你有什么问题要问我？', 'https://juejin.im/post/5c223c70e51d455fb310b9ab', '', '5c223c70e51d455fb310', '掘金', 1545791474),
(143, '不思考才是真正的危机', 'https://juejin.im/post/5c20efd051882520f278661a', '', '5c20efd051882520f278', '掘金', 1545791474),
(144, '程序猿生存指南-39 潜龙出渊', 'https://juejin.im/post/5c21dfbff265da61764ae8ea', '', '5c21dfbff265da61764a', '掘金', 1545791474),
(145, '停止学习框架', 'https://juejin.im/post/5c1a839f518825780008537d', '', '5c1a839f518825780008', '掘金', 1545791474),
(146, '从零实现Vue的组件库（四）- File-Reader实现', 'https://juejin.im/post/5c218af3f265da61570580a1', '', '5c218af3f265da615705', '掘金', 1545791474),
(147, '程序猿生存指南-38 枯木逢春', 'https://juejin.im/post/5c204578f265da6167205372', '', '5c204578f265da616720', '掘金', 1545791474),
(148, '一个刚毕业前端的年度总结', 'https://juejin.im/post/5c21ece7e51d452aaa7c5744', '', '5c21ece7e51d452aaa7c', '掘金', 1545791474),
(149, '驳 《停止学习框架》', 'https://juejin.im/post/5c1b469af265da6125781140', '', '5c1b469af265da612578', '掘金', 1545791474),
(150, 'bitMap原理及实战', 'https://juejin.im/post/5c221a80e51d457054161b9c', '', '5c221a80e51d45705416', '掘金', 1545791474),
(151, '从博客系统回顾我的 2018 年前端生涯', 'https://juejin.im/entry/5c202c21e51d453af218ca8c', '', '5c202c21e51d453af218', '掘金', 1545791474),
(152, '驳 《驳 《驳 《停止学习框架》》》', 'https://juejin.im/post/5c1bad0be51d454c254d9cff', '', '5c1bad0be51d454c254d', '掘金', 1545791474),
(153, '干货：自动部署其实很简单', 'https://juejin.im/post/5c20d54df265da61442010d6', '', '5c20d54df265da614420', '掘金', 1545791474),
(154, '“驳”学指南', 'https://juejin.im/post/5c1ffe32e51d45687904da93', 'https://user-gold-cdn.xitu.io/2018/12/24/167dd01d592ef9e7?imageView2/1/w/120/h/120/q/85/interlace/1', '5c1ffe32e51d45687904', '掘金', 1545791474),
(155, 'JAVA基础之代码简洁之道', 'https://juejin.im/post/5c2191b6e51d45473a5beda4', '', '5c2191b6e51d45473a5b', '掘金', 1545791474),
(156, '驳《慎用 try catch》', 'https://juejin.im/post/5c199882f265da617464c745', '', '5c199882f265da617464', '掘金', 1545791474),
(157, '聊聊我的 Java 自学之路', 'https://juejin.im/post/5c21bae46fb9a04a07306562', 'https://user-gold-cdn.xitu.io/2018/12/25/167e3dd9270ed323?imageView2/1/w/120/h/120/q/85/interlace/1', '5c21bae46fb9a04a0730', '掘金', 1545791474),
(158, 'chrome的调试技巧', 'https://juejin.im/post/5c0e0fa0e51d452afa65d626', '', '5c0e0fa0e51d452afa65', '掘金', 1545791474),
(159, '网络协议 16 - DNS 协议：网络世界的地址簿', 'https://segmentfault.com/a/1190000017516810?utm_source=tag-newest', '', '1190000017516810', 'segmentfault', 1545791474),
(160, 'laravel学习日志 - 在Ubuntu下安装homestead', 'https://segmentfault.com/a/1190000017515918?utm_source=tag-newest', '', '1190000017515918', 'segmentfault', 1545791474),
(161, 'laravel数据填充报unexpected\'DB\'错误', 'https://segmentfault.com/q/1010000017505730?utm_source=tag-newest', '', '1010000017505730', 'segmentfault', 1545791474),
(162, 'Laravel的数据库迁移用处大吗？', 'https://segmentfault.com/q/1010000017505228?utm_source=tag-newest', '', '1010000017505228', 'segmentfault', 1545791474),
(163, 'Laravel上传文件报错，求助！', 'https://segmentfault.com/q/1010000017495358?utm_source=tag-newest', '', '1010000017495358', 'segmentfault', 1545791474),
(164, 'laravel怎么在controller里获取表单验证的错误信息？', 'https://segmentfault.com/q/1010000017494545?utm_source=tag-newest', '', '1010000017494545', 'segmentfault', 1545791474),
(165, 'Laravel 如何根据给定的 session 取出用户？', 'https://segmentfault.com/q/1010000017483145?utm_source=tag-newest', '', '1010000017483145', 'segmentfault', 1545791474),
(166, 'Laravel 5~嵌套评论的实现', 'https://segmentfault.com/a/1190000017463453?utm_source=tag-newest', '', '1190000017463453', 'segmentfault', 1545791474),
(167, 'laravel5.5和laravel-admin 安装小坑笔记', 'https://segmentfault.com/a/1190000017458194?utm_source=tag-newest', '', '1190000017458194', 'segmentfault', 1545791474),
(168, 'laravel多队列问题', 'https://segmentfault.com/q/1010000017455721?utm_source=tag-newest', '', '1010000017455721', 'segmentfault', 1545791474),
(169, '用公司本地的测试机上传图片到oss报错', 'https://segmentfault.com/q/1010000017415144?utm_source=tag-newest', '', '1010000017415144', 'segmentfault', 1545791474),
(170, 'laravel with    问题', 'https://segmentfault.com/q/1010000017406995?utm_source=tag-newest', '', '1010000017406995', 'segmentfault', 1545791474),
(171, 'Vuejs 实战观书有感 C1', 'https://segmentfault.com/a/1190000017389861?utm_source=tag-newest', '', '1190000017389861', 'segmentfault', 1545791474),
(172, 'laravel session在控制器中无法生效', 'https://segmentfault.com/q/1010000017379735?utm_source=tag-newest', '', '1010000017379735', 'segmentfault', 1545791474),
(173, 'Laravel-admin Driver [] is not supported', 'https://segmentfault.com/q/1010000017379636?utm_source=tag-newest', '', '1010000017379636', 'segmentfault', 1545791474),
(174, '来!狂撸一款PHP现代化框架 (路由的设计)', 'https://segmentfault.com/a/1190000017375509?utm_source=tag-newest', '', '1190000017375509', 'segmentfault', 1545791474),
(175, ' 如何在 Laravel 的观察者模型事件 (以及模型自定义事件) 上传递额外的参数', 'https://segmentfault.com/q/1010000017370061?utm_source=tag-newest', '', '1010000017370061', 'segmentfault', 1545791474),
(176, '如果和rancher2的启动协议从https改成http', 'https://segmentfault.com/q/1010000017514651?utm_source=tag-newest', '', '1010000017514651', 'segmentfault', 1545791474),
(177, 'Ethereum DPOS源码分析', 'https://segmentfault.com/a/1190000017505457?utm_source=tag-newest', '', '1190000017505457', 'segmentfault', 1545791474),
(178, '深入解析Go', 'https://segmentfault.com/p/1210000017503689?utm_source=tag-newest', '', '1210000017503689', 'segmentfault', 1545791474),
(179, 'foo、bar到底是什么意思', 'https://segmentfault.com/a/1190000017500898?utm_source=tag-newest', '', '1190000017500898', 'segmentfault', 1545791474),
(180, 'beego有办法创建多级控制器吗?', 'https://segmentfault.com/q/1010000017499719?utm_source=tag-newest', '', '1010000017499719', 'segmentfault', 1545791474),
(181, 'Go 堆栈的理解', 'https://segmentfault.com/a/1190000017498101?utm_source=tag-newest', '', '1190000017498101', 'segmentfault', 1545791474),
(182, '实现Golang和Erlang的连接（Port）', 'https://segmentfault.com/a/1190000017497793?utm_source=tag-newest', '', '1190000017497793', 'segmentfault', 1545791474),
(183, 'golang项目代码重构（二）', 'https://segmentfault.com/a/1190000017497334?utm_source=tag-newest', '', '1190000017497334', 'segmentfault', 1545791474),
(184, 'xorm怎么设置外键呀？', 'https://segmentfault.com/q/1010000017492300?utm_source=tag-newest', '', '1010000017492300', 'segmentfault', 1545791474),
(185, 'Python进阶：切片的误区与高级用法', 'https://segmentfault.com/a/1190000017488113?utm_source=tag-newest', '', '1190000017488113', 'segmentfault', 1545791474),
(186, 'Golang Error Handling 是好的设计吗？', 'https://segmentfault.com/a/1190000017485490?utm_source=tag-newest', '', '1190000017485490', 'segmentfault', 1545791474),
(187, 'golang方法取地址和取值的问题', 'https://segmentfault.com/q/1010000017482356?utm_source=tag-newest', '', '1010000017482356', 'segmentfault', 1545791474),
(188, 'golang的gin框架，各种接收参数的方式和各种绑定的区别？', 'https://segmentfault.com/q/1010000017481660?utm_source=tag-newest', '', '1010000017481660', 'segmentfault', 1545791474),
(189, 'beego框架代码分析', 'https://segmentfault.com/p/1210000017477560?utm_source=tag-newest', '', '1210000017477560', 'segmentfault', 1545791474),
(190, 'gin框架中到处都是gin.H，表示什么意思？', 'https://segmentfault.com/q/1010000017476060?utm_source=tag-newest', '', '1010000017476060', 'segmentfault', 1545791474),
(191, 'go 指针和内存分配详解', 'https://segmentfault.com/a/1190000017473672?utm_source=tag-newest', '', '1190000017473672', 'segmentfault', 1545791474),
(192, 'gin 安装之后无法运行 ', 'https://segmentfault.com/q/1010000017473072?utm_source=tag-newest', '', '1010000017473072', 'segmentfault', 1545791474),
(193, 'gorm更新查询疑惑？', 'https://segmentfault.com/q/1010000017471849?utm_source=tag-newest', '', '1010000017471849', 'segmentfault', 1545791474),
(194, 'beego字段隐藏的问题', 'https://segmentfault.com/q/1010000017467281?utm_source=tag-newest', '', '1010000017467281', 'segmentfault', 1545791474),
(195, '为啥我的laravel获取不到get的数据啊？', 'https://segmentfault.com/q/1010000017518149?utm_source=tag-newest', '', '1010000017518149', 'segmentfault', 1545795235),
(196, 'golang 如何获取底层类型名称？', 'https://segmentfault.com/q/1010000017518333?utm_source=tag-newest', '', '1010000017518333', 'segmentfault', 1545795235);

--
-- 转储表的索引
--

--
-- 表的索引 `b_admin_config`
--
ALTER TABLE `b_admin_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_menu`
--
ALTER TABLE `b_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_permission`
--
ALTER TABLE `b_admin_permission`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_role`
--
ALTER TABLE `b_admin_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_role_menu`
--
ALTER TABLE `b_admin_role_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_role_permission`
--
ALTER TABLE `b_admin_role_permission`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_user`
--
ALTER TABLE `b_admin_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_admin_user_role`
--
ALTER TABLE `b_admin_user_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_article`
--
ALTER TABLE `b_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- 表的索引 `b_banner`
--
ALTER TABLE `b_banner`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_category`
--
ALTER TABLE `b_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `b_url`
--
ALTER TABLE `b_url`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `b_admin_config`
--
ALTER TABLE `b_admin_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `b_admin_menu`
--
ALTER TABLE `b_admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `b_admin_permission`
--
ALTER TABLE `b_admin_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `b_admin_role`
--
ALTER TABLE `b_admin_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `b_admin_role_menu`
--
ALTER TABLE `b_admin_role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `b_admin_role_permission`
--
ALTER TABLE `b_admin_role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `b_admin_user`
--
ALTER TABLE `b_admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `b_admin_user_role`
--
ALTER TABLE `b_admin_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `b_article`
--
ALTER TABLE `b_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `b_banner`
--
ALTER TABLE `b_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `b_category`
--
ALTER TABLE `b_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `b_url`
--
ALTER TABLE `b_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
