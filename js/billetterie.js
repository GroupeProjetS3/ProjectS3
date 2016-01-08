$(function(){
	
	$.get('matchs.request.php', 
			'false', 
			function(matchs){chargeMatchs(matchs)}, 
			'json');
	
	function chargeMatchs(matchs){
		console.log('bonjour');
		$('<fieldset>')
			.appendTo('#billets');
		
		$('<legend>')
			.html('Billets')
			.appendTo('fieldset');
		
		for(var i in matchs){
			
			var match = matchs[i];
			var id_match=parseInt(i)+parseInt(1);
		
			$('<div>', {id:'match'+id_match,})
				.appendTo('fieldset');
			
				$('<input>',{type:'checkbox', value:id_match, id:'match_'+id_match, name:'match_'+id_match})
					.appendTo('fieldset #match'+id_match);

				$('<label>', {for:'match_'+id_match})
					.html('Match du ' + match.day + ' Début du match : ' + match.hDeb)
					.appendTo('fieldset #match'+id_match);

				$('<div>', {id: 'typesMatch'+id_match})
					.appendTo('fieldset #match'+id_match);
						
					$.post('types.request.php', 
					{
						id_match:id_match
					}, 
					function(types){chargeTypes(types)}, 
					'json');
				
			$('#typesMatch'+id_match).hide();

			if(i<$(matchs).length-1)
				$('fieldset').append('<hr>');
		}
		
		
		
		$('input[id^="match_"]').each(function(){			
			var id_match = $(this).attr('value');
			$(this).click(function(){
				if($(this).is(':checked')){
					$(this).parent().children('#typesMatch'+id_match).show();
				}
				else{
					$(this).parent().children('#typesMatch'+id_match).hide();
					$('#typesMatch'+id_match+' input').each(function(){
						if($(this).is(':checked')){
							$(this).prop('checked',false);
							$(this).parent().children('div[id^="prix"]').hide();
						}
					});
					$('#typesMatch'+id_match+' select').each(function(){
						$(this).val("").attr('selected', true);
					});
				}
			})
		})

		$('<input>', {type:'button', value:'Valider'})
			.appendTo('#billets')
			.click(function(){
				$('select').each(function(){
					console.log($(this).val()!="")
					if($(this).val()!=""){
						console.log('top');
						$('#billets').submit();
					}
				})
			});
		
	}
	
	function chargeTypes(types){
			for(var i in types){
			
			var type = types[i];
			var id_typeBillet=type.id_typeBillet;
			var id_match=type.id_match;
			var libTypeBillet=type.libTypeBillet;
			var prix = parseFloat(type.prixBillet).toFixed(2);
			
			$('<div>', {id:'type'+id_typeBillet})
				.appendTo('#match'+id_match+' #typesMatch'+id_match);
			
				$('<input>', {type:'checkbox', value:id_typeBillet, id:'type_'+id_typeBillet, name:id_match+'_type_'+id_typeBillet})
					.appendTo('#typesMatch'+id_match+' #type'+id_typeBillet);
			
				$('<label>', {for:id_match+'_type_'+id_typeBillet})
					.html(libTypeBillet)
					.appendTo('#typesMatch'+id_match+' #type'+id_typeBillet);
			
				$('<div>', {id:'prix'+id_typeBillet})
					.appendTo('#typesMatch'+id_match+' #type'+id_typeBillet);
					
					$('<div>', {id:'prix_'+id_typeBillet})
						.html('Prix Unitaire : '+prix+' €')
						.appendTo('#typesMatch'+id_match+' #prix'+id_typeBillet);
			
					$('<div>', {id:'quantite'+id_typeBillet})
						.html('Quantité : ')
						.appendTo('#typesMatch'+id_match+' #prix'+id_typeBillet);
				
						$('<select>', {id:'quantite_'+id_typeBillet, name:id_match+'_quantite_'+id_typeBillet})
							.appendTo('#typesMatch'+id_match+' #quantite'+id_typeBillet);
							
							$('#typesMatch'+id_match+' #quantite_'+id_typeBillet).append(new Option('', ''));
							
							for(var j=1; j<=type.nbBilletsDispo; j++){
								$('#typesMatch'+id_match+' #quantite_'+id_typeBillet).append(new Option(j, j));
							}
			
			$('#typesMatch'+id_match+' #prix'+id_typeBillet).hide();
		}
		
		$('input[id^="type_"]').each(function(){
			var id_typeBillet=$(this).attr('value');
			$(this).click(function(){
				if($(this).is(':checked')){
					$(this).parent().children('#prix'+id_typeBillet).show();
				}
				else{
					$(this).parent().children('#prix'+id_typeBillet).hide();
					$(this).parent().children('#prix'+id_typeBillet).children('#quantite'+id_typeBillet).children('#quantite_'+id_typeBillet).val("").attr('selected', true);
				}
			})
		})
		
	}
	
})