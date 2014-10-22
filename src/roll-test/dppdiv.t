#!/usr/bin/perl -w
# dppdiv roll installation test.  Usage:
# dppdiv.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/dppdiv';
my $output;

my $TESTFILE = 'tmpdppdiv';

# dppdiv-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'dppdiv installed');
} else {
  ok(! $isInstalled, 'dppdiv not installed');
}
SKIP: {

  skip 'dppdiv not installed', 4 if ! $isInstalled;
  SKIP: {
    skip 'need dppdiv run test', 1;
  }

  `/bin/ls /opt/modulefiles/applications/dppdiv/[0-9]* 2>&1`;
  ok($? == 0, 'dppdiv module installed');
  `/bin/ls /opt/modulefiles/applications/dppdiv/.version.[0-9]* 2>&1`;
  ok($? == 0, 'dppdiv version module installed');
  ok(-l '/opt/modulefiles/applications/dppdiv/.version',
     'dppdiv version module link created');

}

`rm -f $TESTFILE*`;
