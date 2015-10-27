<?php
// Receiver
function receiveRand($receipt)
{
	$receipt_parts = explode('|', $receipt);
	$return_array = array();

	foreach($receipt_parts as $part) {
		if(strpos('~' !== false)) {
			$sub_parts = explode('~', $part);

			$return_array[$sub_parts[0]] = $sub_parts[1];
		}
	}
}
?>