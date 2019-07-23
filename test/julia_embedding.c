#include "julia_embedding.h"

// only define this once, in an executable (not in a shared library) if you want fast code.
JULIA_DEFINE_FAST_TLS()

// Add definitions that need to be in the test runner's main file.
GREATEST_MAIN_DEFS();

int test_jleval(void) {
    init_jl();

    /* run Julia commands */
    jl_value_t *ret = checked_eval_string("1 + 1");

    finalize_jl();

    return jl_unbox_int32(ret);
}

// most examples are in Julia test code
// https://github.com/JuliaLang/julia/blob/633ad822ed68822255d61bdf575fb82329863ae1/test/embedding/embedding.c
TEST julia_1plus1(void) {
    int one_plus_one = test_jleval();
    ASSERT_EQ( 2, one_plus_one );

    PASS();
}

/* Suites can group multiple tests with common setup. */
SUITE(julia_basic_embedding) {
    RUN_TEST(julia_1plus1);
}

int main(int argc, char **argv) {
    GREATEST_MAIN_BEGIN();      /* command-line options, initialization. */

    /* Individual tests can be run directly in main, outside of suites. */
    /* RUN_TEST(x_should_equal_1); */

    /* Tests can also be gathered into test suites. */
    RUN_SUITE(julia_basic_embedding);

    GREATEST_MAIN_END();        /* display results */
}

