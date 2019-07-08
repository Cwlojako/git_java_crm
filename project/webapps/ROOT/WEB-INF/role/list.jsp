<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>叩丁狼教育-JavaWEB综合案例</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../common/header.jsp"%>

<script type="text/javascript">  
  function goPage(pageNo){
	  var currentPage = document.getElementById("currentPage");	 
	    currentPage.value = pageNo;
	   $("#searchForm").submit();
	    
  }
 
</script>
</head>
<body>
	<div  class="container " style="margin-top: 20px">
		<%@include file="../common/top.jsp"%>
		<br /> <br />
		<div class="row">
			<div class="col-sm-3">
				<%@include file="../common/menu.jsp"%>
			</div>
			<div class="col-sm-9">
				<div class="row"></div>
				<!--高级查询--->
				
				<form class="form-inline" id="searchForm" action="/role" method="post">
					<input type="hidden" name="currentPage" id="currentPage">
					<a href="JavaScript:;" class="btn btn-success inputBtn" style="margin: 10px">
                        <span class="glyphicon glyphicon-plus"></span>  添加
                    </a>
				</form>

				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>角色姓名</th>
							<th>角色编号</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach items="${pageInfo.data}" var="entity" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${entity.name}</td>
							<td>${entity.sn}</td>
							<td>
							<a class="btn btn-info btn-xs inputBtn" href="javascript:;" 
							data-json='{"id":"${entity.id}","name":"${entity.name}","sn":"${entity.sn}"}'>
                             <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </a>
							<a href="/role?cmd=delete&id=${entity.id}"
								class="btn btn-danger btn-xs"> <span
									class="glyphicon glyphicon-trash"></span>删除
							</a></td>
						</tr>
					</c:forEach>
				</table>
				<div style="text-align:center">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	<li class="first"><a href="javascript:goPage(1);">首页</a></li>
					    <li class="prev">
					      <a href="javascript:goPage(${pageInfo.prevPage });"
					       aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="i" begin="1" end="${pageInfo.totalPage }">
					    	<li class="numInfo"><a href="javascript:goPage(${i});">${i}</a></li>
					    </c:forEach>
					    <li class="next">
					      <a href="javascript:goPage(${pageInfo.nextPage });" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					    <li class="last"><a href="javascript:goPage(${pageInfo.totalPage});">尾页</a></li>
					  </ul>
					</nav>
				</div>
				<script>
					var currentPage = ${pageInfo.currentPage}
					var totalPage = ${pageInfo.totalPage}
				</script>
				<script src="/js/common/PageDisabled.js"></script>
			</div>
		</div>
	</div>
<!-- 模态框 -->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                <h4 class="modal-title">角色编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/role?cmd=saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="${role.id}" name="id">
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">角色名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" value="" placeholder="请输入角色名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">角色英名：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="sn" value="" placeholder="请输入角色英文名">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary submitBtn" >保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div>
    </div>
</div>
	<script>
        //编辑
        $(function () {
            $(".inputBtn").click(function () {
                //弹出模态框
                $("#editModal").modal("show");
                //修改模态框标题
                $(".modal-title").html("角色添加");
                //数据复原
                $("#editForm")[0].reset();

                //部门回显数据
                var data = $(this).data("json");
                if(data){
                    $(".modal-title").html("角色编辑");
                    $("input[name='id']").val(data.id);
                    $("input[name='name']").val(data.name);
                    $("input[name='sn']").val(data.sn);
                }
            })

            $(function () {
                $(".submitBtn").click(function () {
                    $("#editForm").submit()
                })
            })

        })
    </script>
	
</body>
</html>
