var numInfo = document.getElementsByClassName('numInfo')
numInfo[currentPage-1].className = 'numInfo active'
if(currentPage == 1){
	$('.first').attr('class','disabled')
	$('.prev').attr('class','disabled')
}
if(currentPage == totalPage){
	$('.last').attr('class','disabled')
	$('.next').attr('class','disabled')
}