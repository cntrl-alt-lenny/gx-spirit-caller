typedef unsigned long long u64;
typedef struct { u64 state; u64 multiplier; u64 increment; } RandomState;
extern RandomState data_02102c64;
extern int func_02019940(int arg, int kind);

int func_02019a58(int arg) {
    int value;
    int kind = 2;
    data_02102c64.state = data_02102c64.multiplier * data_02102c64.state + data_02102c64.increment;
    value = (int)(((u64)(unsigned int)(data_02102c64.state >> 32) * 101) >> 32);
    if (value < 5) {
        kind = 0;
    } else if (value < 30) {
        kind = 1;
    }
    return func_02019940(arg, kind);
}

