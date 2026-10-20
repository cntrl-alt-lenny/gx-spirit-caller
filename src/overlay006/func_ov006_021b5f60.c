extern int func_ov006_021b805c(char *base);
extern short data_ov006_0224f3e8[];
extern short data_ov006_0224f400[][7];
int func_ov006_021b5f60(char *base) {
    int i, j;
    short *src;
    char *dst;
    func_ov006_021b805c(base);
    src = data_ov006_0224f400[0];
    dst = base;
    for (i = 0; i < 5; i++) {
        if (i != 0) {
            ((short *)(base + 0x6244))[i] = data_ov006_0224f3e8[i];
            for (j = 0; j < 7; j++) {
                ((short *)(dst + 0x624e))[j] = src[j];
            }
        }
        src += 7;
        dst += 14;
    }
    return 1;
}
