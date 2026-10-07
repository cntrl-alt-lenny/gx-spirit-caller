/* func_0207103c: advance the 64-bit LCG state (state = mul * state + add)
 * and return the new high word. */
typedef struct { unsigned long long state, mul, add; } Lcg;
extern Lcg data_0219ef3c;
unsigned int func_0207103c(void) {
    Lcg *g = &data_0219ef3c;
    g->state = g->mul * g->state + g->add;
    return g->state >> 32;
}
