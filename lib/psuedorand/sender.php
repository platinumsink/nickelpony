<?php
// Sender
function sendRand($send)
{
	// Safely encode for web transfer
	$return_send = urlencode($send);
	$return_send = str_replace(":", "~", $return_send);

	// Append identifier
	$return_send = "st:".$return_send;

	return $return_send;
}

function verifySend($response)
{
	if($response == "ok") {
		return true;
	} else {
		return false;
	}
}

function closeSend()
{
	if($timeout > 6000) {
		die('Waited too long for a response to send');
	}
}

function retrySend()
{
	$post = array();
	$post['format'] = "rst:";
	$post['time'] = time();

	return $post;
}
?>