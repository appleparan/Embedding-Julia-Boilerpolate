#include <stdio.h>
#include <julia.h>

int init_jl();
int finalize_jl();

jl_value_t* checked_eval_string(const char* code);

