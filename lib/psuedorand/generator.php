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
<<<<<<< HEAD
function notAtAllRand()
{
=======
function notAtAllRand() {
>>>>>>> 788de98c0be38e759cab6c8d19bfe796abe8f62f
	return "notsorandomsorrynotsorry";
}

// A key pass
function keyPass()
{
	return "thisisthekey";
}
?>