<%@page import="Controlador.LeerXML"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mostrar Empresas</title>
<style type="text/css">
#mapa {
	height: 715px;
}
</style>

<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyDl2-y63Ve7ihCx_ZqobB9jj4VBX0Ug8yg&sensor=TRUE_OR_FALSE">
	
</script>

<%
	LeerXML aux = new LeerXML();

	String s = aux.convertirString();
	
%>

<script type="text/javascript">

	function initialize() {

		var marcadores = [];
		
		var strg = '<%=s%>';
		var array = strg.split("*");
		
		for (var i = 0; i<array.length; i++) {
			var aux = array[i];
			aux = aux.split("_");
			aux [1] = parseFloat(aux[1]);
			aux [2] = parseFloat(aux[2]);
			var aux2 = [aux[0], aux[1], aux[2]];
			marcadores[i] = aux2;
		}

		var map = new google.maps.Map(document.getElementById('mapa'), {
			zoom : 8,
			center : new google.maps.LatLng(4.7109886,-74.072092),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});
		
		var infowindow = new google.maps.InfoWindow();
		var marker, i;

		for (i = 0; i < marcadores.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(marcadores[i][1],
						marcadores[i][2]),
				map : map
			});
			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(marcadores[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
		}

	}

	google.maps.event.addDomListener(window, 'load', initialize);
	
</script>

</head>

<body>

	<div id="mapa"></div>
	
</body>

</html>