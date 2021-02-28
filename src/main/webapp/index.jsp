<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2021/2/28
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AFP</title>
</head>
<body>
    <form action="afp/fileUpload" method="post" enctype="multipart/form-data">
        RNA type：<select name="RNA">
                    <option value ="snoRNA">snoRNA</option>
                    <option value ="lncRNA">lncRNA</option>
                    <option value="miRNA">miRNA</option>
                </select><br/>
        Upload fasta file：<input type="file" name="uploadFile"/><br/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
