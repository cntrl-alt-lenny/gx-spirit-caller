extern int *func_02018bc0(int id);

int func_ov011_021cdbd8(int a) {
    int i;
    int *p;
    int t;

    t = a + 0x10;
    for (i = 1; i < 0x60; i++) {
        p = func_02018bc0(i);
        if (((unsigned int)(*(int *)((char *)p + 8) << 0x18) >> 0x18) == t) {
            if (((((unsigned int)(*(int *)((char *)func_02018bc0(i) + 8)) << 0x17) >> 0x1f)) == 0) {
                if (i == ((unsigned int)(*(int *)((char *)p + 8) << 0xf) >> 0x18)) {
                    return i;
                }
            }
        }
    }
    return 0;
}
