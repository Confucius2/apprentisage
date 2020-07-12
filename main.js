$(document).ready(function(){

// 	Obtenir un entier aléatoire dans un intervalle fermé
	function getRandomIntInclusive(min, max) {
		  min = Math.ceil(min);
		  max = Math.floor(max);
		  return Math.floor(Math.random() * (max - min +1)) + min;
		}

		var tab = Array(10);
		var finish = false; 
		var valeurAleatoire;
		var emplacement;
		var tabEmplacement = Array(10);
// inclusion dans le tableau 10 valeur allant de 0 à 9
		var i=0;
		while (i<10) {valeurAleatoire=getRandomIntInclusive(0,9);
		if (tab.includes(valeurAleatoire)) {i--;} else {tab[i]=valeurAleatoire;}
		i++;
		}
		
// chargement du tableau a clicquer pour mot de passe
		var j=0;
		while (j<10) {emplacement=getRandomIntInclusive(0,15);
		if (tabEmplacement.includes(emplacement)) {j--;} else 
		{tabEmplacement[j]=emplacement;}
		j++;
		}
		
// 		for (var i=0;i<10;i++) {$("#a"+tabEmplacement[i]).text(tab[i]);}
		for (var i=0;i<10;i++) {$("#a"+tabEmplacement[i]).append(tab[i]);}
	
// acces au formulaire
		var pass = Array(10);
		var motPasse;
		var clics = 0;
		var mots;
		
		$( "#tableau tr td div" ).on( "click", function() {
			if (clics<10)  
		{
		$('#masquesaisie').css('border', 'solid');	
		$('#masquesaisie').append('*');
		pass[clics]=$(this).text();mots=pass.join('');
		$('input[name=passeMot]').val(mots);
		clics++;

		}
			 else {mots=pass.join('');$('input[name=passeMot]').val(mots);
// 			 clics=0;
			 }
// 			 alert($('input[name=passeMot]').val(mots));}
			});
		
		 
		$("#coffre").submit(function( event ) {
			  event.preventDefault();clics=0;
			  $.ajax({
					url : 'Reponse',
					data : {
						mail: $('#mail').val(),
		                motPasse: $('#motPasse').val()
					},
					success : function(responseText) {


						$('#resultat').text(responseText);
						alert($('#resultat').text());
						if ($('#resultat').text()=="success") 
						{location.href = 'bienvenue.jsp';}
					}
				});
			});

// 		function reponseConnection() {
//             alert("sousmision deuxieme fois mot de passe =>"+$('#motPasse').val()+" mail =>"+mail);
// 	        }
		
		$("#reinitialiser").click(function() {
			$("#masquesaisie").empty();
			$("#resultat").html("");
			$("#coffre").get(0).reset();
// 			$("#motPasse").empty();
			$("#motPasse").value="";
			clics=0;
// 			alert('pass '+pass+' motPasse '+motPasse+' mots '+mots);
		var elementsupprimer = pass.splice(0,pass.length);
		var elementsupprimer2 = motPasse.splice(0,motPasse.length);
		var elementsupprimer3 = mots.splice(0,mots.length);
		$("#masquesaisie").empty();
// 		alert('pass '+pass+' motPasse '+motPasse+' mots '+mots);
		});
})
