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
  function goAgain(){
	  var currentPage = document.getElementById("again");	 
	   window.location.href="/permission";
	    
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
				
				<form class="form-inline" id="searchForm" action="/permission" method="post">
                    <input type="hidden" name="currentPage" id="currentPage">
                    <a href="javascript:goAgain();" data-url="/permission?cmd=" class="btn btn-success btn_reload" id="again" style="margin: 10px;">
                        <span class="glyphicon glyphicon-repeat"></span>  重新加载
                    </a>
                </form>

				<table class="table table-striped table-hover">
					<thead>
						<tr>
						<th>编号</th>
                        <th>权限名称</th>
                        <th>权限表达式</th>
                        <th>操作</th>
						</tr>
					</thead>
					<c:forEach items="${pageInfo.data}" var="entity" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${entity.name}</td>
							<td>${entity.expression}</td>
							
							<td> <a href="/permission?cmd=delete&id=${entity.id}"
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
</body>
</html>
