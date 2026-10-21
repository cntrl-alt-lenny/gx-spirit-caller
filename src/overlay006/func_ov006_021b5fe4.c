/* Copy32's assembly definition omits its three arguments. */
extern void Copy32(const void *src, void *dst, int size);
extern int func_ov006_021b7cfc(void *self);
extern int func_ov006_021b7e80(void *self);
extern int func_ov006_021b7bb0(char *self, int b);
extern short data_ov006_0224f3e8[];
extern short data_ov006_0224f400[][7];
int func_ov006_021b5fe4(char *base) {
    int i, j;
    char *src;
    short *dst;
    Copy32(base + 0x124, base, 0x124);
    *(int *)(base + 0x6294) = 1;
    func_ov006_021b7cfc(base);
    func_ov006_021b7e80(base);
    *(int *)(base + 0x6294) = 0;
    dst = data_ov006_0224f400[0];
    src = base;
    for (i = 0; i < 5; i++) {
        if (i != 0) {
            data_ov006_0224f3e8[i] = ((short *)(base + 0x6244))[i];
            for (j = 0; j < 7; j++) {
                dst[j] = ((short *)(src + 0x624e))[j];
            }
            func_ov006_021b7bb0(base, i);
        }
        src += 14;
        dst += 7;
    }
    return 1;
}


