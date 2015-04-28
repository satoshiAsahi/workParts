<?php
$functions = get_defined_functions();
sort( $functions['internal'] );
echo implode( "\n", $functions['internal'] );
