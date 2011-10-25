#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;
use diagnostics;

use Data::Dumper;
use IO::Prompt;

use Net::Google::Spreadsheets;

prompt('Username: ');
my $user = $_;

prompt('Password: ', -e => '*');
my $pass = $_;


my $service = Net::Google::Spreadsheets->new(
    username => $user,
    password => $pass,
);

my $sheet = $service->spreadsheet({
    title => 'testing spreadsheet',
});


my $ws = ($sheet->worksheets)[0];


my $cell = $ws->cell({col => 1, row => 1});


my $content = ($cell->content() || 0);

print "Found '$content' at 1,1$/";

$content++;

$cell->input_value($content);

