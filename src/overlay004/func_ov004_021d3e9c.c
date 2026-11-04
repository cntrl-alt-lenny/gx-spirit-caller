typedef unsigned int u32;
typedef unsigned long long u64;
extern u64 data_ov004_02200e00[];

void func_ov004_021d3e9c(u32 *out, u64 value) {
    u32 j, i, k;
    u32 count;

    if (value >= 1000000000000ULL)
        value = 999999999999ULL;
    k = 0;
    for (i = 0; i < 3; i++) {
        out[i] = 0;
        for (j = 0; j < 4; j++) {
            count = 0;
            while (value >= ((u64 *)((char *)data_ov004_02200e00 + 0x40))[k]) {
                count += ((u64 *)((char *)data_ov004_02200e00 + 0x40))[j + 8];
                value -= ((u64 *)((char *)data_ov004_02200e00 + 0x40))[k];
            }
            out[i] += count;
            k++;
        }
    }
}


