
<p>
	Example timer in PHP
</p>
<?php

require('vendor/autoload.php');
\PHP_Timer::start();
sleep(rand(1, 3));
$time = \PHP_Timer::stop();
print \PHP_Timer::secondsToTimeString($time);


echo "Hello, World from Docker! <br>";
echo "Hello EKS! <br>";
echo '<img src="https://www.docker.com/sites/default/files/horizontal.png">';

?>