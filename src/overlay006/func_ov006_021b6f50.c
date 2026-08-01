extern int func_020059b0(void *key, void *base, int count, int width,
                         int (*cmp)(void *, void *));
extern int func_ov006_021b9000(unsigned short *a, unsigned short *b);

int func_ov006_021b6f50(char *base, int kind, unsigned short val) {
    int local = 0;
    char *r4;
    int cnt;
    int idx;

    *(unsigned short *)&local = val;

    switch (kind) {
    case 0: r4 = base + 0x62a0; break;
    case 1: r4 = base + 0x7a60; break;
    case 2: r4 = base + 0x7c60; break;
    case 3: r4 = base + 0x7e60; break;
    case 4: r4 = base + 0x8060; break;
    }

    cnt = *(unsigned short *)(base + kind * 2 + 0x8100 + 0x60);

    idx = 0;
    if (cnt > 0) {
        idx = func_020059b0(&local, r4, (unsigned short)cnt, 4, (int (*)(void *, void *))func_ov006_021b9000);
    }

    if (idx >= cnt) return 0;
    return *(unsigned char *)(r4 + idx * 4 + 2);
}
