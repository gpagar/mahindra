<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery rowspanizer.js Plugin Demo</title>


	<script
	src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
<style>
body { background-color:#fafafa; font-family:'Open Sans';}
.container { margin:150px auto 30px auto;}
</style>
</head>

<body>

<div class="container">
<h1>jQuery rowspanizer.js Plugin Demo</h1>
<button class="btn btn-primary" id="action">Auto Rowspan</button>
<table id="example" class="table table-inverse table-bordered">
  <tr>
    <td>F1</td>
    <td>A1</td>
    <td>100</td>
  </tr>
  <tr>
    <td>F1</td>
    <td>A2</td>
    <td>200</td>
  </tr>
  <tr>
    <td>F1</td>
    <td>A2</td>
    <td>300</td>
  </tr>
  <tr>
    <td>F2</td>
    <td>B1</td>
    <td>100</td>
  </tr>
  <tr>
    <td>F2</td>
    <td>B2</td>
    <td>50</td>
  </tr>
  <tr>
    <td>F2</td>
    <td>B3</td>
    <td>50</td>
  </tr>
  <tr>
    <td>F2</td>
    <td>B4</td>
    <td>25</td>
  </tr>
  <tr>
    <td>F3</td>
    <td>C1</td>
    <td>500</td>
  </tr>
  <tr>
    <td>F3</td>
    <td>C2</td>
    <td>500</td>
  </tr>
  <tr>
    <td>F3</td>
    <td>C3</td>
    <td>500</td>
  </tr>
</table>
</div>
<script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>
<script>
$('#action').on('click', function() {
  $("#example").rowspanizer({vertical_align: 'middle'});
});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
