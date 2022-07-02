<?php


function delete_accents($word) {
		
	$word = str_replace(
	array('Á', 'À', 'Â', 'Ä', 'á', 'à', 'ä', 'â', 'ª'),
	array('A', 'A', 'A', 'A', 'a', 'a', 'a', 'a', 'a'),
	$word
	);

	$word = str_replace(
	array('É', 'È', 'Ê', 'Ë', 'é', 'è', 'ë', 'ê'),
	array('E', 'E', 'E', 'E', 'e', 'e', 'e', 'e'),
	$word );

	$word = str_replace(
	array('Í', 'Ì', 'Ï', 'Î', 'í', 'ì', 'ï', 'î'),
	array('I', 'I', 'I', 'I', 'i', 'i', 'i', 'i'),
	$word );

	$word = str_replace(
	array('Ó', 'Ò', 'Ö', 'Ô', 'ó', 'ò', 'ö', 'ô'),
	array('O', 'O', 'O', 'O', 'o', 'o', 'o', 'o'),
	$word );

	$word = str_replace(
	array('Ú', 'Ù', 'Û', 'Ü', 'ú', 'ù', 'ü', 'û'),
	array('U', 'U', 'U', 'U', 'u', 'u', 'u', 'u'),
	$word );

	$word = str_replace(
	array('Ñ', 'ñ', 'Ç', 'ç'),
	array('N', 'n', 'C', 'c'),
	$word);
	
	$word = str_replace(
	array(',', '.', ';', ':', '""'),
	array('', '', '', '', '', ''),
	$word
	);
		
	return $word;
}

function is_palindrome($input) {
    $lowercase = explode(" ", strtolower($input));
    $newInput = "";
    
    foreach($lowercase as $lc)
    {
        trim($lc);
        $newInput .= $lc; 
    }

    if($newInput == strrev($newInput))
    {
        return true;
    }
    else {
        return false;
    }
}

$input = delete_accents("Allí por la tropa portado, traído a ese paraje de maniobras, una tipa como capitán usar boina me dejara, pese a odiar toda tropa por tal ropilla");

var_dump(is_palindrome($input));