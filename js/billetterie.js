window.onload = function(){
	var formu = document.forms['billets'];
	chargeMatchs("matchs.request.php");
	console.log(formu.elements);
	

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
				
				//<fieldset>
					// <legend>Matchs</legend>
					
					// var fieldset = document.createElement('fieldset');
					
					// var legend = document.createElement('legend');
						// legend.appendChild(document.createTextNode('Matchs'));
					
					// fieldset.appendChild(legend);
						
				for (var i in json) {
				
					// <div>
						// <label for='nameInput'>
						// <input type='checkbox' value='id_match' name='nameInput' id='nameInput'></input>
						// Match du 'jour' Heure : 'heure du match'</label>
					// </div>
					
					var element = json[i] ;
					
					var div = document.createElement('div');
					
					var nameInput = 'match'+element.id_match;
					
					var label = document.createElement('label');
						label.for=nameInput;
						
					var input = document.createElement('input');
						input.type='checkbox';
						input.value=element.id_match;
						input.name=nameInput;
						input.id=nameInput;
						
					label.appendChild(input);
					label.appendChild(document.createTextNode('Match du ' + element.day + ' Heure : ' + element.hDeb));
					div.appendChild(label);
					formu.appendChild(div);
				}
				
				// </fieldset>
				// <input type='button' name='bouton' value='Suivant'></input>
				
				// formu.appendChild(fieldset);
					
				var bouton = document.createElement('input');
					bouton.type='button';
					bouton.id='bouton';
					bouton.value='Suivant';
				console.log(bouton);
				
				formu.appendChild(bouton);
			}
		})
	}
	
}