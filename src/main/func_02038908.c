typedef struct {
    char                  _pad[0x5c];
    volatile unsigned int seed_lo;
    volatile unsigned int seed_hi;
} rng_02038908_t;

extern rng_02038908_t data_0219b2e0;

unsigned int func_02038908(void) {
    unsigned int t = (data_0219b2e0.seed_hi << 31) | (data_0219b2e0.seed_lo >> 1);

    data_0219b2e0.seed_hi = data_0219b2e0.seed_hi + (data_0219b2e0.seed_hi + (data_0219b2e0.seed_lo & 1));
    t ^= data_0219b2e0.seed_lo << 12;
    t ^= t >> 20;
    data_0219b2e0.seed_lo = t;
    return data_0219b2e0.seed_lo;
}
