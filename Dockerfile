# Folly uri Dockerfile

FROM ubuntu:latest
RUN apt-get update --fix-missing
RUN apt-get --yes install git tree apt-utils
RUN apt-get update
RUN apt-get --yes install wget vim git tree gnupg1 zlib1g-dev make

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key > key 
RUN apt-key add key
RUN apt-get update
RUN apt-get --yes install clang-7 lldb-7 lld-7 libfuzzer-7-dev

ENV CC clang-7
ENV CXX clang++-7

RUN apt-get install --yes g++     cmake     libboost-all-dev     libevent-dev     libdouble-conversion-dev     libgoogle-glog-dev     libgflags-dev     libiberty-dev     liblz4-dev     liblzma-dev     libsnappy-dev     make     zlib1g-dev     binutils-dev     libjemalloc-dev     libssl-dev     pkg-config     libsodium-dev

#download repos
RUN git clone https://github.com/facebook/proxygen /root/proxygen/
RUN git clone https://github.com/facebook/folly /root/proxygen/proxygen/folly

#download and replace files.
RUN git clone https://github.com/xxyyx/folly-uri /root/folly-uri
RUN chmod +777 /root/folly-uri/replacements/deps.sh

RUN mv /root/folly-uri/replacements/deps.sh /root/proxygen/proxygen/deps.sh
RUN mv /root/folly-uri/replacements/FollyConfigChecks.cmake /root/proxygen/proxygen/folly/CMake/FollyConfigChecks.cmake
RUN mv /root/folly-uri/replacements/Subprocess.cpp /root/proxygen/proxygen/folly/folly/Subprocess.cpp
RUN mv /root/folly-uri/replacements/match_results.hpp /usr/include/boost/regex/v4/match_results.hpp
RUN mv /root/folly-uri/replacements/Uri.cpp /root/proxygen/proxygen/folly/folly/Uri.cpp

#RUN ./deps.sh
# RUN ldconfig

