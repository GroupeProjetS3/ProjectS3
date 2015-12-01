function field(type){
	if(document.getElementById("_"+type).value!=""){
		if("_"+type == "_Promo")
			document.getElementById("Promo").innerHTML = "<input name='promoField' type='text' placeholder='Code Promo'>";
		else if("_"+type == "_Licence")
			document.getElementById("Licence").innerHTML = "<input name='licenceField' type='text' placeholder='N° de Licence'>";
	}
	else
		document.getElementById(type).innerHTML = "";
}