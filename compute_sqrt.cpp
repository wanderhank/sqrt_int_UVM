#include <cmath>

extern "C" int compute_sqrt(double input) {
    return (std::floor(std::sqrt(input)));
}