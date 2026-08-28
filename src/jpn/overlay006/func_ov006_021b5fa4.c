extern int func_ov006_021b69d8(char *p, int mode, int slot, int arg3);
extern void Copy32(void *dst, void *src, int n);
extern void func_02012470(int slot, char *p);
extern void func_ov006_021b7bfc(char *p);
extern void func_ov006_021b7d80(char *p);
extern void func_ov006_021b7b94(char *p, int sl, int arg2);
extern void func_ov006_021b7bc0(char *p, int sl, int col, int arg3);
extern void func_ov006_021b7ab0(char *p, int sl);
extern char data_0210596c[];

int func_ov006_021b5fa4(char *p, int mode, int slot) {
    int sl;

    if (!func_ov006_021b69d8(p, mode, slot, 0)) {
        return 0;
    }
    switch (mode) {
    case 0:
        Copy32(p + 0x248 + slot * 0x124, p, 0x124);
        break;
    case 1:
        Copy32(p + 0x3b50 + slot * 0x124, p, 0x124);
        break;
    case 2:
        Copy32(data_0210596c, p, 0x124);
        break;
    case 3:
        func_02012470(slot, p);
        break;
    }
    *(int *)(p + 0x6294) = 1;
    func_ov006_021b7bfc(p);
    func_ov006_021b7d80(p);
    *(int *)(p + 0x6294) = 0;
    for (sl = 0; sl < 5; sl++) {
        if (sl == 0) {
            continue;
        }
        func_ov006_021b7b94(p, sl, 1);
        func_ov006_021b7bc0(p, sl, 0, -1);
        func_ov006_021b7bc0(p, sl, 1, -1);
        func_ov006_021b7bc0(p, sl, 2, -1);
        func_ov006_021b7bc0(p, sl, 3, -1);
        func_ov006_021b7bc0(p, sl, 4, -1);
        func_ov006_021b7bc0(p, sl, 5, -1);
        func_ov006_021b7bc0(p, sl, 6, -1);
        func_ov006_021b7ab0(p, sl);
    }
    *(int *)(p + 0x623c) = mode;
    *(int *)(p + 0x6240) = slot;
    return 1;
}
