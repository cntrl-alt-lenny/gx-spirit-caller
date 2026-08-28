/* func_ov006_021b79a0: sibling of func_ov006_021b60a4 — same guard +
 * switch(mode) Copy32/func_02012470 dispatch, but tail-calls
 * func_ov006_021b7a78 instead of the longer per-slot refresh loop. */
extern int func_ov006_021b69d8(char *p, int mode, int slot, int arg3);
extern void Copy32(void *dst, void *src, int n);
extern void func_02012470(int slot, char *p);
extern int func_ov006_021b7a78(void *p);
extern char data_0210596c[];

int func_ov006_021b79a0(char *p, int mode, int slot)
{
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
    func_ov006_021b7a78(p);
    return 1;
}
