<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/collect/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">干部姓名:</span></label> <input
					class="input-medium ui-autocomplete-input" id="cardename"
					name="collectFormMap.cardename">
			</div>
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">问卷名称:</span></label> <input
					class="input-medium ui-autocomplete-input" id="question_name"
					name="collectFormMap.question_name">
			</div>
			
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">测评名称:</span></label> <input
					class="input-medium ui-autocomplete-input" id="evaluateName"
					name="collectFormMap.evaluateName">
			</div>
			
			<div class="form-group">
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			<a href="javascript:grid.exportData('/user/export.shtml')" class="btn btn-info" id="search">导出excel</a>
			</div>
		</form>
	</div>
	<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
	
	<div class="table-responsive">
		<div id="paging2" class="pagclass"></div>
	</div>
