/* func_ov009_021ab32c: per-frame poll for one entry. When armed (o[0x10]) it
 * feeds o[0xc] to func_0202cca4, and if func_0202cdf8 reports an edge AND the
 * 0x800 status bit in data_02104bac[0x54] is live, fires func_0202ce24; either
 * way it ticks func_0202d9a0. Returns 1. (ov009_core.h) */
extern void func_0202cca4(int);
extern int func_0202cdf8(void);
extern void func_0202ce24(void);
extern void func_0202d9a0(void);
extern char data_02104bac[];
int func_ov009_021ab32c(int *o) {
    if (o[4] != 0) {
        func_0202cca4(o[3]);
        if (func_0202cdf8() != 0) {
            if (*(unsigned short *)(data_02104bac + 0x54) & 0x800)
                func_0202ce24();
        }
        func_0202d9a0();
    }
    return 1;
}
