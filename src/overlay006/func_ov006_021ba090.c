/* func_ov006_021ba090: build a 5-bit mask from self+0xa0[i].f20 & 1
 * (stride 0x24, i=0..4), then store it to data_02104f54[0/1/2] keyed by
 * self->f40 (else/5/6). */
extern char data_02104f54[];

int func_ov006_021ba090(void *selfv) {
    char *dst = data_02104f54;
    unsigned int mask = 0;
    int i;
    char *p = (char *)selfv + 0xa0;
    for (i = 0; i < 5; i++) {
        int v = *(int *)(p + 0x20);
        p += 0x24;
        if ((int)((unsigned)(v << 31) >> 31)) mask |= (1 << i);
    }
    {
        int mode = *(int *)((char *)selfv + 0x40);
        if (mode == 5) {
            dst[1] = mask;
        } else if (mode == 6) {
            dst[2] = mask;
        } else {
            dst[0] = mask;
        }
    }
    return 1;
}
