<h1>教务处web设计</h1>
此处实现了一个简单的教务处网页，关注点在功能的实现，没有考虑界面的美观等
实现的功能如下
<ul>
  <li>用户（学生/老师）的登陆</li>
  <li>用户个人信息的查看修改</li>
  <li>用户课表的查看</li>
  <li>课程成绩的录入与查看</li>
  <li>相关通知的下载</li>
</ul>
应用主要的相关技术：Java，JSP；少量的HTML，JS，servlet<br/>
<ul>
  <li>
    文件结构<br/>
    src-domain:数据类<br/>
    src-dao:操作类<br/>
    src-servlet:文件下载<br/>
    src-db:创建数据库与数据表，并添加初始数据到数据库中<br/>
    WebContent-files:数据库文件表中对应的文件所在地<br/>
    WebContent-html:html文件<br/>
    WebContent-jsp:jsp文件<br/>
  </li>
  <li>
    数据库结构<br/>
    数据库名：jwc_information<br/>
    数据表：account,allcurriculum,files,studentcur<br/>
  </li>
  <li>
    程序结构<br/>
    相关类的设计
      <ol>
        <li>
        数据类<br/>存放在src/domain目录下
          <ol>
             <li>
              Account类<br/>
              包含用户名（学号/工号），密码，姓名，性别，籍贯，出生日期，联系方式
            </li>
            <li>
              Student类<br/>
              该类继承自Account类，内部并没有添加额外的属性
            </li>
            <li>
              Teacher类<br/>
              该类继承自Account类，同Student类一样，内部并没有添加额外的属性
            </li>
            <li>
              Curriculum类<br/>
              该类包含开课教师工号，课程名，教师，上课时间，一周内的上课日期
            </li>
            <li>
              StudentCurriculum类<br/>
              该类继承自Curriculum类，包含学生的学号，以及成绩
            </li>
            <li>
              Files类<br/>
              该类包含文件ID，文件类型，路径，文件名<br/>
              （认为文件的相关属性保存在服务器中的数据库中，当下载文件时，在数据库中获取相应文件的属性进行下载）
            </li>
          </ol>
        </li>
        <li>
        操作类<br/>存放在src/dao目录下
          <ol>
            <li>
              SQLAccess类<br/>
              该类用于数据库的加载与连接
            </li>
            <li>
              AccountDAO类<br/>
              含有两个方法/()函数，一个是根据用户名与密码查找用户的findByUserid()函数，另一个是u更新用户信息的pdate()函数
            </li>
            <li>
              StudentDAO类<br/>
              该类继承自AccountDAO类，含有两个()函数，一个是获取学生课表的findStudentCurriculum()函数，另一个是根据学生学号取得学生姓名的FindName()函数
            </li>
            <li>
              TeacherDAO类<br/>
              该类继承自AccountDAO类，含有五个()函数
              <ul>
                <li>findAllCurriculum()函数，获取该老师的所有课程，输入为Teacher类变量</li>
                <li>findAllCurriculumByUserid()函数，获取该老师的所有课程，输入为老师的工号</li>
                <li>findALLStudent()函数，获取该老师所有的学生（不论课程），输入为Teacher类变量</li>
                <li>findALLStudent()函数，重载，获取该老师制定课程的所有学生，输入为Teacher类变量与课程名</li>
                <li>UpdateStudentGrade()函数，设置学生课程成绩，输入为Teacher类变量与课程（类型为ArrayList<StudentCurriculum>）</li>
              </ul>
            </li>
            <li>
              FileDAO类<br/>
              该类含有两个()函数，一个是获取服务器上所有的文件的getAllFiles()函数，另一个是获取指定文件信息的getFile()函数
            </li>
          <ol>
        </li>
      </ol>
      </ul>
  </li>
</ul>