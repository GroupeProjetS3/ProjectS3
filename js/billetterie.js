window.onload=function(){
	$.get('matchs.request.php', 
			'false', 
			function(matchs){chargeMatchs(matchs)}, 
			'json')
	
	function chargeMatchs(matchs){
		$('<fieldset>')
			.appendTo('#billets')
		
		$('<legend>')
			.html('Billets')
			.appendTo('fieldset')
		
		for(var i in matchs){
			
			var match = matchs[i]
			var id_match=parseInt(i)+parseInt(1)
		
			$('<div>', {id:'match'+id_match})
				.appendTo('fieldset')
			
			$('<input>',{type:'checkbox', value:id_match, id:'match_'+id_match, name:'match_'+id_match})
				.appendTo('fieldset #match'+id_match)
			$('<label>', {for:'match_'+id_match})
				.html('Match du ' + match.day + ' Heure : ' + match.hDeb)
				.appendTo('fieldset #match'+id_match)

			$('<div>', {id: 'typesMatch'+id_match})
				.appendTo('fieldset #match'+id_match)
			
			$.post('types.request.php', 
					{id_match:$('#match_'+id_match).attr('value')}, 
					function(types){chargeTypes(types)}, 
					'json')
			
			if(i<$(matchs).length-1)
				$('fieldset').append('<hr>')
		}
	}
	
	function chargeTypes(types){
			
			for(var i in types){
				var type = types[i]
				var id_typeBillet=type.id_typeBillet
				var id_match=type.id_match
				var libTypeBillet=type.libTypeBillet
				
				$('<div>', {id:'type'+id_typeBillet})
					.appendTo('#match'+id_match+' #typesMatch'+id_match)
				$('<input>', {type:'checkbox', value:id_typeBillet, id:'type_'+id_typeBillet, name:'type_'+id_typeBillet})
					.appendTo('#typesMatch'+id_match+' #type'+id_typeBillet)
				$('<label>', {for:'type_'+id_typeBillet})
					.html(libTypeBillet)
					.appendTo('#typesMatch'+id_match+' #type'+id_typeBillet)
				$('<div>', {id:'quantite'+id_typeBillet})
					.appendTo('#typesMatch'+id_match+' #type'+id_typeBillet)
				$('<select>', {id:'quantite_'+id_typeBillet})
					.appendTo('#typesMatch'+id_match+' #quantite'+id_typeBillet)
			}
	}
}