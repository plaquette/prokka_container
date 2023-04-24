# Use the official CentOS 7 image as the base
FROM centos:7

# Update the system and install required packages
RUN yum -y update && \
    yum -y install git perl-Time-Piece perl-XML-Simple perl-Digest-MD5 \
    perl-App-cpanminus java perl-CPAN perl-Module-Build perl-AutoLoader \
    procps gcc make && \
    yum clean all

# Install missing dependencies for Bio::Perl
RUN cpanm -v autodie \
    && cpanm -v --force List::Util \
    && cpanm -v FFI::CheckLib \
    && cpanm -v Alien::Base::Wrapper \
    && cpanm -v Alien::Libxml2 \
    && cpanm -v XML::LibXML \
    && cpanm -v Test::Memory::Cycle \
    && cpanm -v DB_File \
    && cpanm -v Graph::Directed \
    && cpanm -v XML::LibXML::Reader \
    && cpanm -v Test::Weaken \
    && cpanm -v Bio::Root::IO \
    && cpanm -v Bio::SeqIO \
    && cpanm -v Bio::SearchIO \
    && cpanm -v --force LWP::Protocol::https \
    && cpanm -v --force Bio::DB::GenBank \
    && cpanm -v --force Bio::DB::GenPept \
    && cpanm -v --force Bio::SearchIO::hmmer \
    && cpanm -v --force Bio::Perl

# Copy the local prokka folder into the Docker image
COPY prokka /root/prokka

# Copy the new binary into the Docker image and make it executable
COPY tbl2asn.linux64 /root/prokka/binaries/linux/tbl2asn
RUN chmod +x /root/prokka/binaries/linux/tbl2asn

# Set up the Prokka database
RUN /root/prokka/bin/prokka --setupdb

# Add prokka to the PATH
ENV PATH="$PATH:/root/prokka/bin"

# Add tbl2asn to the PATH
ENV PATH="$PATH:/root/prokka/binaries/linux"

WORKDIR /root/prokka/bin/

