var chargeImage = function(){
	if(req != null)req.cancel();
	else{
		var req = new Request(
		{
			url: image.php,
			method: 'get',
			handleas: json,
			asynchronous: true,
			parameters: {id_hebergment : idHebergement, id_hebergeur : idHebergeur},
			onSuccess: function(res){
				for(var heb in res){
					
				}
			}
		}
			)
	}
}