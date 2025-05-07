#include <cmath>

extern "C" int rem_sqrt(double input) {
    return input - (std::floor(std::sqrt(input))) * (std::floor(std::sqrt(input)));
}
