#!/usr/bin/perl

use File::Fetch;


# Spamhaus.org

my $ff = File::Fetch->new(uri => 'http://www.spamhaus.org/drop/drop.txt');

my $where = $ff->fetch() or die $ff->error;

my $where = $ff->fetch( to => '/home/rolf/Desktop/Jenkins Perl Test');
print "Got Spamhaus.org list\n"; 

#Abuse.ch Zeus tracker

my $ff = File::Fetch->new(uri => 'https://zeustracker.abuse.ch/blocklist.php?download=ipblocklist');

my $where = $ff->fetch() or die $ff->error;

my $where = $ff->fetch( to => '/home/rolf/Desktop/Jenkins Perl Test');
print "Got Abuse.ch Zeus tracker list\n"; 

#malc0de blacklist


my $ff = File::Fetch->new(uri => 'http://malc0de.com/bl/IP_Blacklist.txt');

my $where = $ff->fetch() or die $ff->error;

my $where = $ff->fetch( to => '/home/rolf/Desktop/Jenkins Perl Test');
print "Got malc0de IP_Blacklist list\n"; 

$filename = "/home/rolf/Desktop/Jenkins Perl Test/drop.txt";
$filename2 = "/home/rolf/Desktop/Jenkins Perl Test/blocklist.php";
$filename3 = "/home/rolf/Desktop/Jenkins Perl Test/IP_Blacklist.txt";

chmod 0777, $filename or die "Couldn't change the permission to $filename: $!";
chmod 0777, $filename2 or die "Couldn't change the permission to $filename: $!";
chmod 0777, $filename3 or die "Couldn't change the permission to $filename: $!";


exit;
