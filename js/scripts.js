$.noConflict();

jQuery( document ).ready(function( $ ) {
	sendVal();
});

function prikaz (which) {
	if (jQuery("#" + which).is(':visible')) {
		jQuery("#" + which).stop(false, false).fadeOut();
		jQuery("#" + which + "_btn").attr('class', 'btn btn-info');
	}
	else if (jQuery("#prva_polovica").is(":visible") && which != "prva_polovica") {
		jQuery("#prva_polovica").stop(false, false).fadeOut();
		jQuery("#prva_polovica_btn").attr('class', 'btn btn-info');
		jQuery("#druga_polovica_btn").attr('class', 'btn btn-warning');
		setTimeout(function(){
			jQuery("#" + which).stop(false, false).fadeIn();
		}, 300);
	}
	else if (jQuery("#druga_polovica").is(":visible") && which != "druga_polovica") {
		jQuery("#druga_polovica").stop(false, false).fadeOut();
		jQuery("#druga_polovica_btn").attr('class', 'btn btn-info');
		jQuery("#prva_polovica_btn").attr('class', 'btn btn-warning');
		setTimeout(function(){
			jQuery("#" + which).stop(false, false).fadeIn();
		}, 300);
	}
	else {
		jQuery("#" + which + "_btn").attr('class', 'btn btn-warning');
		jQuery("#" + which).stop(false, false).fadeIn();
	}
}

//razmerje;izvedba(,);vsebina(,)
function sendVal() {
	var data = jQuery("#razmerje").val() + ";";
	var i = 0;
	while (jQuery("#zastavica_izvedba"+i).length != 0) {
		if (i == 0)
			data = data + jQuery("#zastavica_izvedba"+i).val();
		else
			data = data + "," + jQuery("#zastavica_izvedba"+i).val();
		i++;
	}

	data += ";";
	
	var j = 0;
	while (jQuery("#zastavica_vsebina"+j).length != 0) {
		if (j == 0)
			data = data + jQuery("#zastavica_vsebina" + j).val();
		else
			data = data + "," + jQuery("#zastavica_vsebina" + j).val();
		j++;
	}

	jQuery.get( "run.php", { data: data } )
	  .done(function( back_data ) {
	    //console.log( "Data Loaded: " + back_data );
	  	var data_splited = back_data.split(",");
	  	for (var i = 0; i < data_splited.length; i++) {
	  		var splited_alltheway = data_splited[i].split(":");
	  		jQuery("#predmet"+splited_alltheway[0]+" .sum").text(splited_alltheway[1]);
	  	}
	  	razvrsti(back_data);
	  });

	  
}
function distribute(parts) {
	var x = new Array();
	for (i = 0; i < parts.length; i++) {
		var idx = parts[i].indexOf("<div class=\"sum\">") + "<div class=\"sum\">".length;
		var idx2 = parts[i].indexOf("</div>");
		var part_number = parts[i].substring(idx, idx2);
		//console.log(part_number);
		x[i] = [parts[i],part_number];
	}
	//console.log(x);
	return x;
}

function compare(a, b) {
	return a[1] - b[1];
}

function razvrsti() {
	var str = document.getElementById("inside");
	var str_splited = split_html(str);
	//console.log(str_splited);
	var str_distr = distribute(str_splited);
	//console.log(str_distr);
	str_distr = str_distr.sort(compare);
	//console.log(str_distr);
	var str_join = "<div class=\"inside\" id=\"inside\">";
	for (var i = 0; i < str_distr.length; i++) {
		str_join += str_distr[i][0];
	}
	str_join += "</div>";
	jQuery("#half2").html(jQuery(str_join));
}

function split_html(str) {
	str = str.outerHTML;
	str = str.substring("<div class=\"inside\" id=\"inside\">".length, str.length-6).trim();
	//console.log(str);
	//console.log(str);
	var out = new Array();
	var x = str.split("<div class=\"one\"");
	for (var i = 0; i < x.length; i++) {
		if (x[i].length > 0) {
			out.push('<div class="one"' + x[i]);
		}
		//x[i] = '<div class="one"' + x[i];
		//console.log(x[i]);
	};

	return out;
}