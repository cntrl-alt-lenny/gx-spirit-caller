extern int func_ov006_021b6ad8(char *p, int mode, int slot, int arg3);
extern void Copy32(void *dst, void *src, int n);
extern void func_020124a4(int slot, char *p);
extern void func_ov006_021b7cfc(char *p);
extern void func_ov006_021b7e80(char *p);
extern void func_ov006_021b7c94(char *p, int sl, int arg2);
extern void func_ov006_021b7cc0(char *p, int sl, int col, int arg3);
extern void func_ov006_021b7bb0(char *p, int sl);
extern char data_02105a4c[];

int func_ov006_021b60a4(char *p, int mode, int slot) {
    int sl;

    if (!func_ov006_021b6ad8(p, mode, slot, 0)) {
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
        Copy32(data_02105a4c, p, 0x124);
        break;
    case 3:
        func_020124a4(slot, p);
        break;
    }
    *(int *)(p + 0x6294) = 1;
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    *(int *)(p + 0x6294) = 0;
    for (sl = 0; sl < 5; sl++) {
        if (sl == 0) {
            continue;
        }
        func_ov006_021b7c94(p, sl, 1);
        func_ov006_021b7cc0(p, sl, 0, -1);
        func_ov006_021b7cc0(p, sl, 1, -1);
        func_ov006_021b7cc0(p, sl, 2, -1);
        func_ov006_021b7cc0(p, sl, 3, -1);
        func_ov006_021b7cc0(p, sl, 4, -1);
        func_ov006_021b7cc0(p, sl, 5, -1);
        func_ov006_021b7cc0(p, sl, 6, -1);
        func_ov006_021b7bb0(p, sl);
    }
    *(int *)(p + 0x623c) = mode;
    *(int *)(p + 0x6240) = slot;
    return 1;
}
