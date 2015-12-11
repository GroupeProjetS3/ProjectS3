window.onload = function(){
	var formu = document.forms['billets'];
	var bouton = formu.elements['bouton'];
	
	chargeMatchs("matchs.request.php");

	bouton.onclick = function(){
			for(i = 0; i<document.getElementsByTagName('input').length-1; i++)
				if(document.getElementsByTagName('input')[i].checked)
					console.log(document.getElementById('labelMatch'+(i+1)).innerHTML);	
	}

	function viderNoeud(noeud) {
		while (noeud.hasChildNodes()) {
			noeud.removeChild(noeud.lastChild) ;
		}
	}
	
	var request = null;
	
	function chargeMatchs(url) {
		if (request != null) request.cancel() ;
		request = new Request({
			url : "matchs.request.php",
			// Méthode de la requête
			method   : "get",
			// Type de résultat attendu
			handleAs : 'json',
			// Associer la fonction de traitement
			onSuccess    : function (json) {
				viderNoeud(formu) ;
				for (var i in json) {
					var element = json[i] ;
					
					var nameInput = 'match'+element.id_match;
					
					var label = document.createElement('label');
						label.setAttribute('for',nameInput);

					var input = document.createElement('input');
						input.setAttribute('type','checkbox');
						input.setAttribute('value',element.id_match);
						input.setAttribute('name',nameInput);
						input.setAttribute('id',nameInput);
						
					label.appendChild(input);
					label.appendChild(document.createTextNode('Match du ' + element.day + ' Heure : ' + element.hDeb));
					
					formu.appendChild(label);
					
				}
				var label = document.createElement('label');
					label.setAttribute('for','bouton');
					
				var bouton = document.createElement('input');
					bouton.setAttribute('type','button');
					bouton.setAttribute('name','bouton');
					bouton.setAttribute('value', 'Suivant');
				console.log(bouton);
				
				formu.appendChild(bouton);
			}
		})
	}
	
}