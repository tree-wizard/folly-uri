#include <folly/Uri.h>

#include <boost/algorithm/string.hpp>
#include <glog/logging.h>
#include <map>

using namespace folly;

extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t size) {
       // fbstring s("http://localhost?&key1=foo&key2=&key3&=bar&=bar=&");
      //  Uri u(s);

       Uri u(data);
  return 0;
}