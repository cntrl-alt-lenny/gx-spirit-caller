/* func_ov002_0220369c: C-39f — index by (1-bit0); if table[1-bit0] and
 * helper(self, bit0) > 0, return 1; else 0. The 2nd helper arg is bit0
 * itself (left in r1 by the extract), while the index uses 1-bit0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf098[];
extern int func_ov002_021ff1d8(struct S *self, int bit0);
int func_ov002_0220369c(struct S *self) {
    int v = *(int *)(data_ov002_022cf098 + ((1 - self->bit0) & 1) * 0x868);
    if (v != 0) {
        if (func_ov002_021ff1d8(self, self->bit0) > 0) return 1;
    }
    return 0;
}
