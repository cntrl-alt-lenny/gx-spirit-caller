/* func_ov002_02294b18: C-39f self-consumed — if (unsigned)table[bit0]>2
 * return 0; else helper(bit0, v) == 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf178[];
extern int func_ov002_021c3bdc(int bit0, int v);
int func_ov002_02294b18(struct S *self) {
    int v = *(int *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
    if ((unsigned int)v > 2) return 0;
    return func_ov002_021c3bdc(self->bit0, v) == 0;
}
