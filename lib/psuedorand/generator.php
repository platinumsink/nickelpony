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

// Stub
?>