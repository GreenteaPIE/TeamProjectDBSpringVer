
function productWriteSubmit() {
	var theForm = document.frm
	theForm.action = "DBServlet?command=product_write";
	theForm.submit();
}
