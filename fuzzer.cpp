#include <folly/Uri.h>
#include <folly/String.h>

extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t size) {
        folly::fbstring bin1(data, size);

        folly::Uri u(bin1);
        u.scheme();
        u.path();
        u.username();
        u.host();
        u.authority();
        u.password();
        u.query();
        u.fragment();

  return 0;
}
