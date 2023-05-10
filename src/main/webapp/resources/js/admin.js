/**
 * 
 */
function deleteBrand(bname) {
  if (confirm("삭제하면 브랜드 내의 모든 상품이 사라집니다. 브랜드를 삭제하시겠습니까?")) {
    location.href = 'DBServlet?command=brand_delete&brandname=' + bname;
  }
}

function brandCheck(){
	if(document.frm.bName.value.length ==0){
		alert("브랜드 명을 입력하세요.");
		return false;
	}
	return true;
}

function go_bw()
{
var theForm = document.frm
theForm.action = "DBServlet?command=admin_brand_write"; 
theForm.submit();
}