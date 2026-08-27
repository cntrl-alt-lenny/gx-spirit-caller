extern char *GetSystemWork(void);
extern int func_02013990(void);
extern unsigned short func_02019000(void);
extern int func_020190b8(void);

struct Bit0 { unsigned int b : 1; };

void func_02017a64(int *dst) {
    char *sw = GetSystemWork();
    unsigned int v;

    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    if (*(int *)(sw + 0x920) != 1) return;
    if (func_020190b8() == 0) return;
    if (func_02013990() != 5) return;

    v = func_02019000();
    if (v >= (unsigned int)(*(int *)(sw + 0x8dc)) + 1) {
        dst[2] = 0x00240100;
    }
}
