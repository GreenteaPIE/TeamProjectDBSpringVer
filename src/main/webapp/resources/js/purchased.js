/**
 * 
 */

 // 창 열기. 
function open_win(url,name){
	window.open(url, name, "width=500, height=230");
}

function submitCoupon(){
	var xhr = new XMLHttpRequest();
var url = "DBServlet"; // 전송할 서버 URL
xhr.open("POST", url, true);
xhr.setRequestHeader("Content-Type", "application/json");

const myMap = new Map();

var data = {
  
};

const divs = document.querySelectorAll('div'); // div 요소들 선택
divs.forEach(div => {
  const inputs = div.querySelectorAll('input'); // div의 하위 input 요소들 선택
  inputs.forEach(input => {
    data.input.name=input.value;
  });
});


var json = JSON.stringify(data);

xhr.onreadystatechange = function () {
  if (xhr.readyState === 4 && xhr.status === 200) {
    console.log(xhr.responseText);
  }
};

xhr.send(json);
}