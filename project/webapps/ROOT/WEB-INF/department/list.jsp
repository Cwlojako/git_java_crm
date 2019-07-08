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
				
				<form class="form-inline" id="searchForm" action="/department" method="post">
					<input type="hidden" name="currentPage" id="currentPage">
					<a href="/department?cmd=input" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> 添加</a>	
				</form>

				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>部门名称</th>
							<th>部门英文名</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach items="${pageInfo.data}" var="entity" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${entity.name}</td>
							<td>${entity.sn}</td>
							<td><a class="btn btn-info btn-xs"
								href="/department?cmd=input&id=${entity.id}"> <span
									class="glyphicon glyphicon-pencil"></span>编辑
							</a> <a href="javascript:;"
								class="btn btn-danger btn-xs" data-json='{"id":${entity.id }}'> <span
									class="glyphicon glyphicon-trash"></span>删除
							</a></td>
						</tr>
					</c:forEach>
				</table>
				<script type="text/javascript">
						$(".btn-danger").click(function(){
							var data = $(this).data('json');
							var id = data.id;
							layui.use('layer', function(){
								var layer = layui.layer;
								layer.msg('<br><h4 style="font-weight:800;">您确定删除吗?<h4><br>', {
									time: 20000, //20s后自动关闭
									yes: function(index, layero){
									   window.location.href="/department?cmd=delete&id="+id
									},
									btnAlign:'c',
									closeBtn:1,
									anim: 4,
									btn: ['确定', '返回']
								});
							});    
						})
				</script>
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
</body>
</html>
