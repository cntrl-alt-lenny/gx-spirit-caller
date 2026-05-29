/* func_ov002_02293738: C-39f self-preserved — if table[bit0] > 0xfa0
 * return 0; else helper(bit0, f0, 0) > 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_022536e8(int bit0, u16 f0, int k);
int func_ov002_02293738(struct S *self) {
    int v = *(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868);
    if (v > 0xfa0) return 0;
    return func_ov002_022536e8(self->bit0, self->f0, 0) > 0;
}
