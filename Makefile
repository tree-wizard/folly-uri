CC=clang-7
CXX=clang++-7


FOLLY=/root/proxygen/proxygen/folly

all: Fuzzer

clean:
	rm -rf Fuzzer

Fuzzer: fuzzer.cpp

	$(CXX) -o fuzzer fuzzer.cpp -I$(FOLLY)/include $(FOLLY)/_build/libfolly.so -g -lcrypto -fsanitize=fuzzer,undefined,address -lfolly -lboost_system -lglog
