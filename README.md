# online-exam-system-backend ｜ 通用在线考试系统

#### 友情提示

> 1. **项目体验地址**：[项目体验地址](http://exam.alan.org.cn)  
>    1. 管理员账号:admin 密码:123456
>    2. 教师账号:teacher 密码:123456
>    3. 教师账号:student 密码:123456
> 2. **配套前端项目**：[前端项目地址](https://github.com/Alanosy/online-exam-system-frontend)

#### 介绍

本项目致力于打造一款通用的在线考试系统，此项目为**后端项目，还有配套前端**，在上面有可以点击跳转过去。本项目主要优点是开发、部署简单快捷、界面设计友好、代码结构清晰，功能完整。

本项目还在更新中，欢迎小伙伴一起开发一起进步,具体可以参考下方参与贡献

如遇到Bug可以在issue中提出，会仔细回答各位

如果遇到部署问题，也可以加入下方的QQ群，会给大家解答，QQ群文件中放有该项目的配套资料

**=>如果各位喜欢，麻烦各位大佬点点Star<=**

##### 温馨提示

1. **=>登录页面可以登录三个角色<=**，分别为学生、教师和管理员,不同账号显示不用用户界面，具体账号登录管理员查看用户管理，默认密码都是123456
2. **=>加入班级请点击头像打开个人信息中加入<=**，班级口令请看教师或管理端班级口令查找
3. 数据库Sql文件在lib文件夹中

****

#### 其他服务（有偿）

博主提供代部署服务

提供接单服务，价格从优

提供讲解，或写文档服务

#### 功能介绍

本项目包含以下功能

用户管理、班级管理、试卷中心、刷题中心、考试记录、错题本、考试管理、题库管理、试题管理、证书管理、我的证书、成绩分析、阅卷管理、公告管理、切屏检测、证书生成

最近新功能：

讨论功能，Ai阅卷、题库添加分类管理、成绩分析添加查看用户试卷、添加考试可以直接选题和抽题

#### 项目展示

<table>
    <tr>
        <td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/管理端.png"/></td>
        <td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/教师端.png"/></td>
      	<td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/学生端.png"/></td>
    </tr>
</table>

#### 安装

1. 拉取项目

   ``` bash
   git clone https://github.com/Alanosy/online-exam-system-backend.git
   ```

2. 导入IDEA，配置好maven、java版本（需要java8版本）

3. 配置application-dev.yml，配置好mysql和redis。（注意：最好使用Mysql5.7版本）

4. 如果需要上传图片需要配置阿里云OSS或者本地自己部署Minio服务然后在配置文件中配置

5. 配置好后直接点运行就可以使用了，如果运行不起来，可以加入QQ群提问

#### 开发环境

| 工具  | 版本号   | 下载                                                         |
| ----- | -------- | ------------------------------------------------------------ |
| JDK   | **8**    | https://www.oracle.com/cn/java/technologies/downloads/#java8 |
| MySQL | **5.7**  | https://dev.mysql.com/downloads/mysql/5.7.html               |
| Redis | **5**    | https://redis.io/download                                    |
| Nginx | **1.22** | http://nginx.org/en/download.html                            |

#### 相关文档

<table>
    <tr>
        <td>功能结构图</td>
        <td>技术栈</td>
    </tr>
  <tr>
        <td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/%E5%8A%9F%E8%83%BD%E7%BB%93%E6%9E%84%E5%9B%BE.drawio.png"/></td>
        <td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/技术栈.png"/></td>
    </tr>
  <tr>
        <td>ER图</td>
        <td>连接池</td>
    </tr>
  <tr>
        <td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/ER图.png"/></td>
        <td><img src="https://github.com/Alanosy/online-exam-system-backend/blob/master/img/连接池.png"/></td>
    </tr>
</table>


#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

#### 联系方式

QQ群：1034380536  <=可以先加这个

微信：fignet

邮箱：fignet@163.com

## 许可证

[Apache License 2.0](https://github.com/macrozheng/mall/blob/master/LICENSE)

Copyright (c) 2018-2024 macrozheng

### 通用在线考试系统（后端）项目分析报告

本报告针对该后台项目进行了深入分析，涵盖了项目的整体架构、技术栈、核心业务模块以及关键类的作用说明。

---

#### 1. 项目整体架构与技术栈

该项目采用主流的 **Spring Boot** 框架开发，遵循经典的 **MVC** 三层架构（Controller-Service-Mapper），并集成了以下核心技术栈：

*   **核心框架**：Spring Boot 2.x
*   **权限安全**：Spring Security + JWT
*   **持久层**：MyBatis-Plus
*   **数据库**：MySQL 5.7+
*   **缓存**：Redis
*   **文档/接口**：Swagger (Knife4j)
*   **工具类**：Hutool, FastJSON, Lombok
*   **人工智能**：集成 LLM (大模型) 用于 AI 阅卷与辅助功能
*   **文件存储**：支持阿里云 OSS 和本地 Minio

---

#### 2. 核心业务模块划分

项目功能逻辑清晰，主要分为以下几个核心模块：

1.  **权限与用户管理**：处理登录、注册、验证码、角色权限控制（管理员、教师、学生）。
2.  **班级管理**：班级创建、学生加入班级等。
3.  **题库与试题管理**：支持单题录入、Excel 批量导入、题库分类管理。
4.  **考试与阅卷管理**：考试发布、自动/人工阅卷、AI 辅助阅卷、切屏检测防作弊。
5.  **统计与分析**：班级人数统计、考试成绩分析、用户学习时长统计等。
6.  **互动与公告**：讨论区功能、系统公告发布。

---

#### 3. 核心类及其主要方法功能说明

以下是项目中关键类的详细功能分析：

##### 3.1 权限认证模块 (`cn.org.alan.exam.controller.AuthController`)
*   **作用**：负责系统的安全访问控制。
*   **主要方法**：
   *   `login(LoginForm)`：用户登录，验证身份并分发 Token。
   *   `logout()`：用户注销，清除 Session/Token 信息。
   *   `register(UserForm)`：学生用户注册。
   *   `getCaptcha()`：生成图形验证码，防止暴力破解。
   *   `trackPresence()`：心跳接口，记录学生在线状态及登录时长。

##### 3.2 考试控制模块 (`cn.org.alan.exam.controller.ExamController`)
*   **作用**：核心业务逻辑，管理考试全生命周期。
*   **主要方法**：
   *   `createExam(ExamAddForm)`：教师/管理员创建新考试。
   *   `startExam(examId)`：学生开始参加考试，初始化考试状态。
   *   `addAnswer(ExamQuAnswerAddForm)`：提交题目答案（支持实时保存）。
   *   `addCheat(examId)`：记录学生作弊行为（如切屏次数）。
   *   `getGradeExamList()`：获取阅卷列表。

##### 3.3 试题管理模块 (`cn.org.alan.exam.controller.QuestionController`)
*   **作用**：维护题库内容。
*   **主要方法**：
   *   `addSingleQuestion(QuestionFrom)`：手动添加单道题目（支持单选、多选、判断、简答）。
   *   `importQuestion(repoId, file)`：通过解析 Excel 模板批量导入试题。
   *   `pagingQuestion()`：多条件搜索分页查询题目。

##### 3.4 统计分析模块 (`cn.org.alan.exam.controller.StatController`)
*   **作用**：数据看板，为管理决策提供依据。
*   **主要方法**：
   *   `getStudentGradeCount()`：各班级人数分布统计。
   *   `getExamGradeCount()`：各班级参加考试的频率与分布统计。
   *   `getAllCount()`：系统全局数据概览（班级、试卷、题目总数）。

##### 3.5 AI 辅助工具类 (`cn.org.alan.exam.utils.agent.impl.LLMUtil`)
*   **作用**：集成大语言模型，提升系统智能化水平。
*   **主要方法**：
   *   `getChatResponse(msg)`：与大模型进行交互，获取响应。
   *   `createAssistant()`：配置并创建一个 AI 助手实例，用于自动阅卷或智能答疑。

---

#### 4. 项目亮点与建议

*   **亮点**：
   1.  **AOP 日志处理**：`LogAsPect` 类实现了完善的请求响应日志记录，并能自动脱敏（如过滤密码字段），便于排查问题。
   2.  **灵活的导入导出**：提供了强大的 Excel 导入导出功能，极大地减轻了题库维护的工作量。
   3.  **智能化尝试**：引入了 AI 阅卷，是目前在线考试系统中较为前沿的功能。
*   **建议**：
   *   项目结构非常标准，适合二次开发。在实际部署时，请确保 `application-dev.yml` 中的 Redis 和 MySQL 配置正确，特别是 AI 阅卷功能所需的 API Key 需自行配置。

该项目代码结构规范，逻辑分层明确，是一个非常优秀的通用后台管理系统参考模板。