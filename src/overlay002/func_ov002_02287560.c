/* func_ov002_02287560: C-39f self-consumed — n=1-bit0; if
 * helper(n)*0x1f4 >= table[n] return 1; else helper(n) > 1. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021bbf50(int n);
int func_ov002_02287560(struct S *self) {
    int n = 1 - self->bit0;
    int h1 = func_ov002_021bbf50(n);
    int v = *(int *)(data_ov002_022cf16c + (n & 1) * 0x868);
    if (h1 * 0x1f4 >= v) return 1;
    return func_ov002_021bbf50(n) > 1;
}
