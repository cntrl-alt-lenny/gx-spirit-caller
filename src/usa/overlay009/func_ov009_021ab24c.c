/* func_ov009_021ab24c: per-frame poll for one entry. When armed (o[0x10]) it
 * feeds o[0xc] to func_0202cc50, and if func_0202cda4 reports an edge AND the
 * 0x800 status bit in data_02104acc[0x54] is live, fires func_0202cdd0; either
 * way it ticks func_0202d94c. Returns 1. (ov009_core.h) */
extern void func_0202cc50(int);
extern int func_0202cda4(void);
extern void func_0202cdd0(void);
extern void func_0202d94c(void);
extern char data_02104acc[];
int func_ov009_021ab24c(int *o) {
    if (o[4] != 0) {
        func_0202cc50(o[3]);
        if (func_0202cda4() != 0) {
            if (*(unsigned short *)(data_02104acc + 0x54) & 0x800)
                func_0202cdd0();
        }
        func_0202d94c();
    }
    return 1;
}
