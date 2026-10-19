typedef unsigned int u32;
extern unsigned char *data_021a088c;
extern void func_020945f4(void *dest, int value, u32 size);

void func_0207b408(u32 *p, int arg) {
    if (p == 0) {
        *(u32 *)(data_021a088c + 0x226c) = 3;
        *(u32 *)(data_021a088c + 0x2270) = 0;
        *(u32 *)(data_021a088c + 0x2274) = 0;
        *(u32 *)(data_021a088c + 0x2278) = 0;
    } else {
        *(u32 *)(data_021a088c + 0x226c) = p[0] & 3;
        if (((4 - (p[1] & 3)) & 3) + 12 > p[2]) {
            *(u32 *)(data_021a088c + 0x2270) = 0;
            *(u32 *)(data_021a088c + 0x2274) = 0;
        } else {
            *(u32 *)(data_021a088c + 0x2270) = (p[1] + 3) & ~3;
            *(u32 *)(data_021a088c + 0x2274) = p[2] - ((4 - (p[1] & 3)) & 3);
            func_020945f4(*(void **)(data_021a088c + 0x2270), 0, *(u32 *)(data_021a088c + 0x2274));
        }
        *(u32 *)(data_021a088c + 0x2278) = p[3];
    }
    *(u32 *)(data_021a088c + 0x227c) = arg;
}
