<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>编辑</title>
	<%@include file="/WEB-INF/views/common/commoncss.jsp" %>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
         <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row form-body form-horizontal m-t">
                        
                        <!-- ********* Form start  *********  -->
	                    <form class="form-horizontal m-t" id="modifyform">
	                    	<input type="hidden" id="memberid" value="${member.id}"/>
							
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-4 control-label">用户名：</label>
									<div class="col-sm-4">
										<input type="text" id="username" name="username" class="form-control required"
											placeholder="请输入用户名" value="${member.username}" disabled="disabled">
									</div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-4 control-label">姓名：</label>
									<div class="col-sm-4">
										<input type="text" id="realname" name="realname" class="form-control required"
											placeholder="请输入姓名" value="${member.realname}">
									</div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-4 control-label">手机号：</label>
									<div class="col-sm-4">
										<input type="text" id="phone" name="phone" class="form-control required isPhone"
											placeholder="请输入手机号" value="${member.phone}">
									</div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-4 control-label">邮箱：</label>
									<div class="col-sm-4">
										<input type="text" id="email" name="email" class="form-control email"
											placeholder="请输入邮箱" value="${member.email}">
									</div>
								</div>
							</div>
							
							<div class="col-md-7 col-sm-offset-5">
								<button  class="btn btn-primary"  type="submit">
								<i class="fa fa-check"> </i>更新</button>
							</div>
							
						</form>
						<!-- ********* Form end  *********  -->
						
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<%@include file="/WEB-INF/views/common/commonjs.jsp" %>

	<!-- jQuery Validation plugin javascript-->
	<script src="${ctxStatic}/user/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${ctxStatic}/user/js/plugins/validate/messages_zh.min.js"></script>
	<script src="${ctxStatic}/js/ajaxfileupload.js"></script>
	
	<script type="text/javascript">
	
		//数据校验
		$().ready(function () {
			// 在键盘按下并释放及提交后验证提交表单
			$("#modifyform").validate({
				submitHandler: function (form) {
					$.ajax({
					type : "post",
					url : "${ctxStatic}/personal/update",
					data : {
						id : $("#memberid").val(),
						username : $("#username").val(),
						realname : $("#realname").val(),
						phone : $("#phone").val(),
						email : $("#email").val(),
					},
					dataType : "json",
					async : true,
					success : function(data) {
						alert(data.message);
	               		console.log(data);
						window.location.href = "${ctxStatic}/personal/modifyPage";
					},
					error : function(data) {
						alert("error");
					}
				});
				}
			});
		});
	
	</script>
</body>

</html>