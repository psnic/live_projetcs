<%-- 
    Document   : RegisterDSC
    Created on : 18 Oct, 2023, 4:43:09 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/dsc-signer.js" type="text/javascript"></script>
	<script src="resources/js/dscapi-conf.js" type="text/javascript"></script>
	<script src="resources//js/jquery.blockUI.js" type="text/javascript"></script>
	<link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="resources/css/dsc-signer.css">
    </head>
    <body>
	<div id="panel"></div>

	<div id="login-overlay" class="modal-dialog">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<i class="fa fa-id-card" aria-hidden="true"></i> <span>Add/Modify
					Digital Signature</span>
			</div>
			<div class="panel-body">
				<div class="well">
					<form method="POST" action="#" class="form-horizontal" role="form">
						<h4>Digital Signature</h4>
						<div class="form-group" style="padding: 14px;">

							<div class="row">
								<div class="input-field col-md-12">
									<label for="cname">Name</label> <input type="text" id="cname" name="cname"
										class="form-control input-sm" autocomplete="off" readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<label for="serialNum">Serial Number</label> <input type="text" id="serialNum"
										name="serialNum" class="form-control input-sm" autocomplete="off"
										readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<label for="serialNum">Thumb Print</label> <input type="text" id="thumb"
										name="thumb" class="form-control input-sm" autocomplete="off" readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<label for="validFrom">Valid from</label> <input type="text" id="validFrom"
										name="validFrom" class="form-control input-sm" autocomplete="off"
										readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<label for="validTo">Valid to</label> <input type="text" id="validTo" name="validTo"
										class="form-control input-sm" autocomplete="off" readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<label for="cert">Certificate</label>
									<textarea type="text" id="cert" name="cert" class="form-control input-sm"
										autocomplete="off" readonly="true" rows="5"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<label for="sts">Status</label> <input type="text" id="sts" name="sts"
										class="form-control input-sm" autocomplete="off" readonly="true" /> <input
										type="hidden" id="pan" name="pan" class="form-control input-sm"
										autocomplete="off" readonly="true" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col-md-12">
									<button type="submit" class="btn btn-primary">Save/Update</button>

								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function () {

		loadCert();
		
		//$('#loadCert1233').click(function () {
			// var serialNo = $('#serialNum').val();
			// var cert = $('#cert').val();
			// if (serialNo == "" && cert == "") {
			// 	$.blockUI({ message: '<h5><img src="resources/images/please-wait-fb.gif" /> ...Initializing NICDSign.Please Wait...</h5>' });
			// }
			// setTimeout(
			// 	function () {
			// 		if (serialNo == "" && cert == "") {
			// 			$(document).ajaxStop($.unblockUI);
			// 			getDSCDetails();
			// 		}
			// 	}, 3000);
	//	});

		function getDSCDetails() {
			dscSigner.certificate(function (res) {
				$('#cname').val(res.certificates[0].subject);
				$('#pan').val(res.certificates[0].pan);
				$('#serialNum').val(res.certificates[0].serialNumber);
				$('#thumb').val(res.certificates[0].thumbprint);
				$('#validFrom').val(res.certificates[0].notBefore);
				$('#validTo').val(res.certificates[0].notAfter);
				$('#cert').val(res.certificates[0].certificate);
				$('#sts').val("ACTIVE");
				$('#panel').hide();
			});
		}

		function loadCert(){
			var serialNo = $('#serialNum').val();
			var cert = $('#cert').val();
			if (serialNo == "" && cert == "") {
				$.blockUI({ message: '<h5><img src="resources/images/please-wait-fb.gif" /> ...Initializing NICDSign.Please Wait...</h5>' });
			}
			setTimeout(
				function () {
					if (serialNo == "" && cert == "") {
						$(document).ajaxStop($.unblockUI);
						getDSCDetails();
					}
				}, 3000);
		}

		var serialNo = $('#serialNum').val();
		var cert = $('#cert').val();
		if (serialNo == "" && cert == "") {
			$.blockUI({ message: '<h5><img src="resources/images/please-wait-fb.gif" /> .....Initializing NICDSign.Please Wait...</h5>' });
		}
		setTimeout(
			function () {
				if (serialNo == "" && cert == "") {
					$(document).ajaxStop($.unblockUI);
					getDSCDetails();
				}
			}, 3000);
	});
</script>
</html>
