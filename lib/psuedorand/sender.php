<?php
// Sender
function sendRand($send)
{
	$return_send = urlencode($send);
	$return_send = str_replace(":", "~", $return_send);

	// Append identifier
	$return_send = "st:".$return_send;

	return $return_send;
}
?>