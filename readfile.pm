#!/usr/bin/perl


use warnings;

# Spamhaus

my $file = '/home/rolf/Desktop/Jenkins Perl Test/drop.txt';
my $nxtfile = '/home/rolf/Desktop/Jenkins Perl Test/spamhaus.txt';

print "file open Spamhaus\n";
open(my $fh, '<:encoding(UTF-8)', $file)
	or die "could not open file '$file' $!";

open(my $fhh, '>', $nxtfile)
	or die "could not open file '$file' $!";

my $ctr = 0;
while (my $row = <$fh>) {
if ($ctr > 3){
	chomp $row;
	my @fields = split / /,$row;
	print $fhh "$fields[0]\n";
}
$ctr = $ctr + 1 ;
}
close $fhh;


print "Spamhaus Done\n";



#zeus tracker Abuse.ch

my $file2 = '/home/rolf/Desktop/Jenkins Perl Test/blocklist.php';
my $nxtfile2 = '/home/rolf/Desktop/Jenkins Perl Test/abusechzeus.txt';

print "file open Abuse.ch Zeus tracker\n";
open(my $fh2, '<:encoding(UTF-8)', $file2)
	or die "could not open file '$file2' $!";

open(my $fhh2, '>', $nxtfile2)
	or die "could not open file '$file2' $!";

my $ctr2 = 0;
while (my $row = <$fh2>) {
if ($ctr2 > 5){
	chomp $row;
	#my @fields = split / /,$row;
	#print $fhh2 "$fields[0]\n";
	print $fhh2 "$row/32\n";
}
$ctr2 = $ctr2 + 1 ;
}
close $fhh2;

print " Abuse.ch Zeus tracker done\n";

#malc0de

my $file3 = '/home/rolf/Desktop/Jenkins Perl Test/IP_Blacklist.txt';
my $nxtfile3 = '/home/rolf/Desktop/Jenkins Perl Test/malc0de.txt';

print "file open malc0de\n";

open(my $fh3, '<:encoding(UTF-8)', $file3)
	or die "could not open file '$file3' $!";

open(my $fhh3, '>', $nxtfile3)
	or die "could not open file '$file3' $!";

my $ctr3 = 0;
while (my $row = <$fh3>) {
if ($ctr3 > 3){
	chomp $row;
	#my @fields = split / /,$row;
	#print $fhh2 "$fields[0]\n";
	print $fhh3 "$row/32\n";
}
$ctr3 = $ctr3 + 1 ;
}
close $fhh3;

print "malc0de done\n";


$filename = "/home/rolf/Desktop/Jenkins Perl Test/spamhaus.txt";
$filename2 = "/home/rolf/Desktop/Jenkins Perl Test/abusechzeus.txt";
$filename3 = "/home/rolf/Desktop/Jenkins Perl Test/malc0de.txt";

chmod 0777, $filename or die "Couldn't change the permission to $filename: $!";
chmod 0777, $filename2 or die "Couldn't change the permission to $filename: $!";
chmod 0777, $filename3 or die "Couldn't change the permission to $filename: $!";


exit;
