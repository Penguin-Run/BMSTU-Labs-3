function show_result(data){
	var result = document.getElementById("result");
	result.innerHTML = "<hr/>Result is: " + data.value + "<hr/><p>"+Date()+"</p>";
	console.log("io_manager js handler triggered");
}

handleAjaxSuccess = function (event) {
	[data, status, xhr] = event.detail;
	show_result(data);
}

document.addEventListener('DOMContentLoaded', function () {
	document.querySelector("#calc_form").addEventListener(
		'ajax:success', handleAjaxSuccess)
})