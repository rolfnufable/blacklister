#!/usr/bin/perl
#use strict;
use warnings;
use v5.10;

use DBI;
use DBD::mysql;
use NetAddr::IP;

use Test::More;
use_ok('test');
use blacklistcaller;

my $alert = blacklistcaller->new;

print "Hard coded input\n";

############### GET THE IP
$alert->ip("14.102.172.0/22");

if ( length $alert->ip > 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got A Legit IP");

		}

################ Classification
$alert->classification("botnet");
if ( length $alert->classification > 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Classification");

		}

if ( length $alert->severity> 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Severity");

		}



#$alert->severity("So Severe");

my $modifier = NetAddr::IP->new($alert->ip);
my $modip = NetAddr::IP->new($alert->ip)->addr();
my $modnum = NetAddr::IP->new($alert->ip)->numeric();
@split = split /\// , $modifier;


################## Number of Hosts
my $numofHost =  2**(32 - $split[1]);
print "Number of Available Hosts $numofHost \n";
if ( length $numofHost> 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Number of Hosts");

		}

my $lastIPnum = $modnum + $numofHost;


################## Last IP 
my $lastIP = NetAddr::IP->new($modnum + $numofHost)->addr();
my $range = "$modip - $lastIP";

if ( length $lastIP> 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Last IP");

		}


if ($split[1] == 32){
	$alert->flag(0);
}


print "$range \n";

if ( length $range> 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Range");

		}

if ( length $alert->flag > 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Flag");

		}

if ( length $alert->Source > 0 )
	{
	### TEST
		is(test::test(1),"OK","We Got The Source");

		}

my $database = "perltest";

my $host = "localhost";
my $userid = "root";
my $passwd = "rolfrolf";

chomp($database,$host,$userid,$passwd);


$connection = ConnectToMySql($database);

$query = "insert into info(IP,intform,nprefix,intnprefix,isRange,Classification,Severity,Source) values (?,?,?,?,?,?,?,?)";

$statement = $connection->prepare($query);
$statement->execute($modip,$modnum,$lastIP,$lastIPnum,$alert->flag,$alert->classification,$alert->severity,$alert->Source);

done_testing( $number_of_tests_run);

exit;
sub ConnectToMySql {

my ($db) = @_;

my $connectionInfo = "dbi:mysql:$db;$host";

my $l_connection = DBI->connect($connectionInfo,$userid,$passwd);

return $l_connection;


}
