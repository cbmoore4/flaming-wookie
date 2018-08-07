#!c:\perl\bin\perl.exe
# check all DNS servers for proper resolution of input record
# must use FQDN of target

unless (@ARGV > 1) {
	die <<EO_USAGE;
	Usage: perl -w dns-lookup3.pl hostname.domain.com serverlist.txt
EO_USAGE
}

open (SERVERS,$ARGV[1]);
my $target = $ARGV[0];
while (<SERVERS>) {
  $server = $_;
  chomp ($server);
  $output = `c:\\data\\tools\\dig \@$server +nocmd $target +noall +answer`;
  if ($output eq "") { $output = "FAILED"; }
  print ("$server:\t",$output,"\n");
  }
close (SERVERS);