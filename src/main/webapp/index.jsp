<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2021/3/1
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>service program - index page</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- header box -->
<div id="header">
    <div id="header_box" class="box">
        <div id="slogan"></div>
        <ul id="nav_box">
            <li><a href="http://lbci.tju.edu.cn/Gallery.htm">Gallery</a></li>
            <li><a href="http://lbci.tju.edu.cn/Teaching.htm">Teaching</a></li>
            <li><a href="http://lbci.tju.edu.cn/Members.htm">Members</a></li>
            <li><a href="http://lbci.tju.edu.cn/Research_project.htm">Research project</a></li>
            <li><a href="http://lbci.tju.edu.cn/Published_papers.htm">Published papers</a></li>
            <li><a href="http://lbci.tju.edu.cn/Online_services.htm">Online services</a></li>
            <li><a href="http://lbci.tju.edu.cn/Research_direction.htm">Research direction</a></li>
            <li><a href="http://lbci.tju.edu.cn/">Home</a></li>
        </ul>
    </div>
</div>
<!-- header box -->
<%--<div id="button_box" class="box">--%>
<%--    <a href="index.jsp">Server</a>--%>
<%--</div>--%>

<div id="main_box" class="box">
    <div id="main_title">Service page</div>

    <h3> Identifying non-coding RNA subcellular localization:</h3>
    <form action="afp/fileUpload" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <div style="margin: auto">
        <table width="100%">
            <tr>
                <td width="300px;" height="35px;" align="right">RNA type: </td>
                <td><label for="name"></label>
                    <select name="RNA" id="name">
                        <option value ="snoRNA">snoRNA</option>
                        <option value ="lncRNA">lncRNA</option>
                        <option value="miRNA">miRNA</option>
                    </select></td>
<%--                <td width="200px;">&nbsp;</td>--%>
            </tr>
            <tr>
                <td width="300px;" height="35px;" align="right">Fasta sequence: <br/></td>
                <td>
                    <textarea cols="150px" rows="5" wrap="soft" id="fastaSeq" name="fastaSeq" placeholder="Please input fasta sequence, or upload the fasta file below." maxlength="150"></textarea>
                </td>
                <td width="300px;">&nbsp;</td>
            </tr>
            <tr>
                <td width="300px;" height="35px;" align="right">Fasta file: <br/></td>
                <td><input type="file" name="uploadFile" id="uploadFile"/></td>
                <td width="300px;">&nbsp;</td>
            </tr>
            <tr>
                <td  align="right">Note: </td>
                <td bgcolor="#F5F5F5">
                    <p style="padding:20px;">You should input your query Fasta sequence in the input area, or upload the Fasta format file.<br/>
                        The number of sequences should be less than or equal to 200. The results will be shown after processing.<br/><br/>
                        Example:<br/>
                        >0|snoRNA|Example<br/>
                        CAGTAGTGATGAAATTCCACTTCATTGGTCCGTGTTTCTGAACCACATGATTTTCTCGGATGTTCTGATG<br/>
                    </p>

                </td>
                <td width="300px;">&nbsp;</td>
            </tr>
            <tr>
                <td width="300px;" height="35px;" align="right">&nbsp;</td>
                <td><input id="offline_submit" type="submit" value="Submit"></td>
                <td width="300px;">&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
    <br/>

    <h3> Service description:</h3>
    <p style="padding: 20px;">
        Non-coding RNAs (ncRNAs) are a type of RNA which are not used to encode protein sequences. Emerging evidence shows
        that lots of ncRNAs may participate in many biological processes and must be widely involved in many types of cancers. Therefore,
        understanding their functionality is of great importance. Similar to proteins, various functions of ncRNAs relies on their subcellular
        localizations. Traditional high-throughput methods in wet-lab to identify subcellular localization is time-consuming and costly. In this paper,
        we propose a novel computational method based on multi-kernel learning to identify multi-label ncRNA subcellular localizations, via graph
        regularized k-local hyperplane distance nearest neighbor algorithm. First, we construct six types of sequence-based feature descriptors
        and select important feature vectors. Then, we build a multi-kernel learning model with Hilbert-Schmidt independence criterion (HSIC) to
        obtain optimal weights for vairous features. Furthermore, we propose the graph regularized k-local hyperplane distance nearest neighbor
        algorithm (GHKNN) as a binary classification model for detecting one kind of non-coding RNA subcellular localization. Finally, we apply
        One-vs-Rest strategy to decompose multi-label problem of non-coding RNA subcellular localizations. Our method achieves excellent
        performance on three ncRNA datasets and three human ncRNA datasets. We evaluate our predictor on a novel multi-label benchmark
        set, and out-performs other outstanding machine learning methods. We expect that this model will be useful for the prediction of
        subcellular localization and the study of important functional mechanisms of ncRNAs. The flowchart is shown in the figure 1.
        <br/><br>
        This web server develops for ncRNAs subcelluar prediction. The predictor covers the following 3 types of RNAs: (1) miRNA, (2) lncRNA, (3) snoRNA.

    </p>

    <div style="text-align: center;">
        <img src="img/framework.png" alt="flow" width="599" height="250"/>
        <p>Fig.1.Framework of the whole prediction process.</p>
    </div>
    <br />

    <h3>Code and Datasets</h3>
    <p style="padding: 20px;">
        The codes are wrote by MATLAB in our paper, and can be downloaded from GitHub <a href="https://github.com/guofei-tju/Identify-NcRNA-Sub-Loc-MKGHkNN">https://github.com/guofei-tju/Identify-NcRNA-Sub-Loc-MKGHkNN</a>.
    </p>
    <br/>


    <h3>Contact</h3>
    <p style="padding: 20px;">
        Dr.Fei Guo<br>
        School of Computer Science and Technology, Tianjin University, China <br />
        E-mail: fguo@tju.edu.cn
    </p>
    <p style="padding: 20px;">
        Haohao Zhou<br>
        School of Computer Science and Technology, Tianjin University, China <br />
        E-mail: hzhou256@uwo.ca <br/>
    </p><br/>
</div>

<!-- footer box -->
<div id="footer_box" class="box">
    Address：Building 55B, Peiyang Park Campus No.135, Yaguan Road, Tianjin Haihe Education Park, Tianjin, China &nbsp;|&nbsp; P.C.：300050<br />
    Copyright：School of Computer Science and Technology, TianJin University. All Rights Reserved.
</div>
<!-- footer box -->
</body>


<script type="text/javascript">
    function check(){
        var myfile = document.getElementById("uploadFile").value;
        var seq = document.getElementById("fastaSeq").value;
        // if(myfile == null || myfile === '') {
        //     alert("Please select file");
        // }
        if((seq != null && seq !== '') || (myfile !== null && myfile !== ''))
            return true;
        alert("Please select file or input sequences in text area.");
        return false;
    }

</script>


</html>

