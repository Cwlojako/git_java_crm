<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>叩丁狼教育-JavaWEB综合案例</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../common/header.jsp"%>
</head>
<body>

	<div class="container " style="margin-top: 20px">
		<%@include file="../common/top.jsp"%>
		<br /> <br />
		<div class="row">
			<div class="col-sm-3">
				<%@include file="../common/menu.jsp"%>
			</div>
			<div class="col-sm-9">
				<div class="row col-sm-10">
					<form class="form-horizontal" action="/department?cmd=saveOrUpdate"
						method="post" id="editForm">
						<input type="hidden" value="${dept.id}" name="id">
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">部门名称</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name"
									value="${dept.name }" placeholder="请输入部门名称">
							</div>
						</div>

						<div class="form-group">
							<label for="sn" class="col-sm-2 control-label">部门英名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="sn"
									value="${dept.sn }" name="sn" placeholder="请输入部门英文名">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-1 col-sm-6">
								<button id="btn_submit" type="submit" class="btn btn-default">保存</button>
								<button type="reset" class="btn btn-default">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>