#include <iostream>
#include <cmath>

int main() {
    double TOL = 1.0e-10;
    long long MAX_ITER = 30000000001LL;
    long long N = 1;
    double TERM = 1.0;

    while (TERM > TOL && N < MAX_ITER)
        TERM = 4.0 / (2 * N++ - 1);

    std::cout << "Final N: " << N - 1 << std::endl;
    return 0;
}