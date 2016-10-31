<?php
// A somewhat silly random generator
function sslRand($length)
{
	$return_rand = "notatallrandom";

	if($length > 0) {
		$return_rand = base64_encode(openssl_random_pseudo_bytes($length));
	}

	return $return_rand;
}

// A non-random string
function notAtAllRand()
{
	return "notsorandomsorrynotsorry";
}

// A key pass
function keyPass()
{
	$id = 'areyoureadyforimpactlolwowkk1!!!!1!1!!111!';
	$key_pass = keyPassHelper($id);
	return($key_pass);
}

function keyPassHelper($id)
{
	$url = 'http://code.example.com/rest/get/id';
	$new_key = getKeyFromURL($url, $id);

	return $new_key;
}

function getKeyFromURL($url, $id) 
{
	$key = curl_init($URL."/?id=".$id);
	
	return $key;
}

function putMyThangDownFlipItAndReverseIt($url) 
{
	$rev  = strrev($url);
	
	return $rev;
}
?>