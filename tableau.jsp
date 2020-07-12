<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style> .valeur
            {
                background-color: lightblue;
                width:35px;
                height:20px;
                text-align: center;
            }
          
          #masquesaisie 
            { 	text-align: center;
  				border: 1px black solid;
               	width:100px; 
             	height:15px;
             	
            } 
          
</style>
<title>Insert title here</title>


</head>

<body>


<script type="text/javascript">
document.cookie = 'user=Pierre'; //Crée ou met à jour un cookie 'user'
alert(document.cookie); //Affiche la liste des cookies
</script>





	<form id="coffre" action="#" method="post">
	<input type="email"  id="mail" class="form-control" placeholder="Entrer votre email" required autofocus>
	<input type="password" id="motPasse" name="passeMot" hidden readonly>
	<table id="tableau" width="168px" height="100px" border="1" >
            <tr>
            <td><div class="valeur" id="a0"></div></td>
            <td><div class="valeur" id="a1"></div></td>
            <td><div class="valeur" id="a2"></div></td>
            <td><div class="valeur" id="a3"></div></td>
            </tr>
            <tr>
            <td><div class="valeur" id="a4"></div></td>
            <td><div class="valeur" id="a5"></div></td>
            <td><div class="valeur" id="a6"></div></td>
            <td><div class="valeur" id="a7"></div></td>
            </tr>
            <tr>
            <td><div class="valeur" id="a8"></div></td>
            <td><div class="valeur" id="a9"></div></td>
            <td><div class="valeur" id="a10"></div></td>
            <td><div class="valeur" id="a11"></div></td>
            </tr>
            <tr>
            <td><div class="valeur" id="a12"></div></td>
            <td><div class="valeur" id="a13"></div></td>
            <td><div class="valeur" id="a14"></div></td>
            <td><div class="valeur" id="a15"></div></td>
            </tr>
            </table>
            <div id="masquesaisie"></div>
			<div id="resultat"></div>
<!--   	<input type="password" id="motPasse" name="passeMot" hidden readonly><br/> -->
    <button type="submit" id="envoyer" title="Envoyer">Valider</button>
    <button type="reset" id="reinitialiser" title="Reinitialiser">Effacer</button>
    </form>
    <script type="text/javascript" 
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery3.4.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--     <script type="text/javascript" src="js/main.js" ></script> -->
<script type="text/javascript">
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
// 						alert($('#resultat').text());
						if ($('#resultat').text()=="success") 
						{location.href = 'bienvenue.jsp';}
					}
				});
			});

// 		$(window).load(function() {
// 			// La page est intégralement chargée
// 			// votre code ici…
// 			// code déjà présent dans le plug-in jQuery
// 		}) ;
			
//             alert("sousmision mot de passe =>"+motPasse+" mail =>"+mail);


//          $.post('TableauReponse.java', {
//                 mail: $('#mail').val(),
//                 motPasse: $('#motPasse').val()
//             },  
//             function(data){
            	 
//                 if(data == 'Success'){
//                      // Le membre est connecté. Ajoutons lui un message dans la page HTML.
 
// //                      $("#resultat").html("Vous avez été connecté avec succès !");
                     
//                      $(location).attr("href","bienvenue.jsp");
						
// //                 	window.open('bienvenue.php');
//                 }
//                 else{
//                      // Le membre n'a pas été connecté. (data vaut ici "failed")
 
//                      $("#resultat").html("Erreur lors de la connexion...");
//                      clics=10;
//                 }
         
//             },
//             'text'
//          );
//     });
		  
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
</script>
</body>

</html>