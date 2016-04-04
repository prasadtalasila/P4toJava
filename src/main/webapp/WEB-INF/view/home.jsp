<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
	
</script>
</head>
<body>
	<h2>This is the javagen webapp!!</h2>


	<form accept-charset="UTF-8" role="form" method="GET"
		action="<c:url value="/index"/>">
		<button id="genHello" type="submit">Generate File</button>
	</form>

	<div>
		<input type="file" id="fileInput" />
	</div>
	<!-- <button id="genHello">Press to Generate</button> -->

	<script type="text/javascript">
		$("#genHello").click(
						function() {

							//Retrieve the first (and only!) File from the FileList object
							var f = document.getElementById("fileInput").files[0];

							if (f) {
								var r = new FileReader();
								r.onload = function(e) {
									var userParseGraph = e.target.result;
									$.ajax({
												url : '/p4tojava/read',
												type : 'GET',
												contentType : 'application/json; charset=utf-8',
												dataType : 'text',
												data : {
													graph : userParseGraph
												},
												success : function(data) {
													if (data === "success") {
														console.log("Success!")
													} else {
														alert("Error!!!");
													}
												},
												error : function() {
													console.log("Something went wrong. Please try again later.");
												}
											});
								}
								r.readAsText(f);

							} else {
								alert("Failed to load file");
							}

						});
	</script>
</body>
</html>
