#!/usr/bin/perl
#use strict;
use warnings;
use v5.10;

use DBI;
use DBD::mysql;
use NetAddr::IP;

use Test::More;
use_ok('test');
use spamhaus;
use abusechzeus;
use malc0de;

my $database = "perltest";

my $host = "localhost";
my $userid = "root";
my $passwd = "rolfrolf";



my $alert = spamhaus->new;

print "Collection of Blacklisted IP start!\n";


###############################################################################
###############################SPAMHAUS########################################

my $nxtfile = '/home/rolf/Desktop/Jenkins Perl Test/spamhaus.txt';
open(my $fh, '<:encoding(UTF-8)', $nxtfile)
	or die "could not open file '$file' $!";


while (my $row = <$fh>) {
#GET THE IP
$alert->ip($row);

if ( length $alert->ip > 0 )
	{
	### TEST
		print "Source : Spamhaus\n";
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

chomp($database,$host,$userid,$passwd);


$connection = ConnectToMySql($database);

$query = "insert into info(IP,intform,nprefix,intnprefix,isRange,Classification,Severity,subnet,Source) values (?,?,?,?,?,?,?,?,?)";

$statement = $connection->prepare($query);
$statement->execute($modip,$modnum,$lastIP,$lastIPnum,$alert->flag,$alert->classification,$alert->severity,$split[1],$alert->Source);
}

close $fh;



###############################################################################
###########################ABUSECH ZUES########################################

my $alert = abusechzeus->new;

my $nxtfile = '/home/rolf/Desktop/Jenkins Perl Test/abusechzeus.txt';
open(my $fhh, '<:encoding(UTF-8)', $nxtfile)
	or die "could not open file '$nxtfile' $!";



while (my $row = <$fhh>) {
#GET THE IP
$alert->ip($row);

if ( length $alert->ip > 0 )
	{
	### TEST
	
		print "Source : Abuse.ch Zeus tracker";
		is(test::test(1),"OK","We Got A Legit IP");

		}


################ Classification
$alert->classification("Zeus Bot");
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

chomp($database,$host,$userid,$passwd);


$connection = ConnectToMySql($database);

$query = "insert into info(IP,intform,nprefix,intnprefix,isRange,Classification,Severity,subnet,Source) values (?,?,?,?,?,?,?,?,?)";

$statement = $connection->prepare($query);
$statement->execute($modip,$modnum,$lastIP,$lastIPnum,$alert->flag,$alert->classification,$alert->severity,$split[1],$alert->Source);
}

close $fhh;






###############################################################################
###########################MALC0DE.com#########################################

my $alert = malc0de->new;

my $nxtfile = '/home/rolf/Desktop/Jenkins Perl Test/malc0de.txt';
open(my $fhh, '<:encoding(UTF-8)', $nxtfile)
	or die "could not open file '$file' $!";



while (my $row = <$fhh>) {
#GET THE IP
$alert->ip($row);

if ( length $alert->ip > 0 )
	{
	### TEST
	
		print "Source : Malc0de.com";
		is(test::test(1),"OK","We Got A Legit IP");

		}


################ Classification
$alert->classification("Sample BOTNET");
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

chomp($database,$host,$userid,$passwd);


$connection = ConnectToMySql($database);

$query = "insert into info(IP,intform,nprefix,intnprefix,isRange,Classification,Severity,subnet,Source) values (?,?,?,?,?,?,?,?,?)";

$statement = $connection->prepare($query);
$statement->execute($modip,$modnum,$lastIP,$lastIPnum,$alert->flag,$alert->classification,$alert->severity,$split[1],$alert->Source);
}

close $fhh;



done_testing( $number_of_tests_run);


exit;
sub ConnectToMySql {

my ($db) = @_;

my $connectionInfo = "dbi:mysql:$db;$host";

my $l_connection = DBI->connect($connectionInfo,$userid,$passwd);

return $l_connection;


}
