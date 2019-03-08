#include <folly/Uri.h>

extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t size) {

       folly::Uri u(data);

       return 0;
}
