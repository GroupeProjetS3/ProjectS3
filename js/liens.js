function billetterie(){
	for(var i = 0; i<document.getElementsByClassName("billetterie").length; i++)
		document.getElementsByClassName('billetterie')[i].setAttribute('href', './billetterie.php')
}