# Perl Phase 3
sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.40/core_perl     \
             -Darchlib=/usr/lib/perl5/5.40/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.40/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.40/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.40/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.40/vendor_perl

make
make install

