typedef unsigned long long u64;
typedef struct { u64 state, multiplier, increment; } RandomState;
extern RandomState data_0219ef3c;
extern int data_0219ef34[2];
extern int func_0206f054(int arg0, int arg1, int arg2);
extern int func_0206f0c0(char *str, unsigned int *out);

static inline unsigned int next_random(void) {
    data_0219ef3c.state = data_0219ef3c.multiplier * data_0219ef3c.state + data_0219ef3c.increment;
    return data_0219ef3c.state >> 32;
}

unsigned int func_0206ef0c(char *str) {
    unsigned int result;
    unsigned short random[2];
    unsigned char active[2];
    int i = 0, j;
    random[0] = ((u64)next_random() * 0x10000) >> 32;
    random[1] = ((u64)next_random() * 0x10000) >> 32;
    if (func_0206f0c0(str, &result)) return result;
    active[0] = 1;
    active[1] = 1;
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 2; j++) {
            if (active[j]) {
                result = func_0206f054((int)str, data_0219ef34[j], random[j]);
                if (result != 0 && result != -1) goto done;
                if (result == -1) active[j] = 0;
            }
        }
    }
done:
    if (result == -1) result = 0;
    return result;
}






