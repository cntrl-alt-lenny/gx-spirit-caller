/* func_ov002_02209db0: C-39f 2-D u16 table — if table[bit0][b1_5] != 0
 * return 0; else helper(self, arg). arg1 pass-through (gotcha 7). */
typedef unsigned short u16;
struct Sdb0 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern char data_ov002_022cf1a2[];
extern int func_ov002_021ff320(struct Sdb0 *self, int arg);
int func_ov002_02209db0(struct Sdb0 *self, int arg) {
    if (*(u16 *)(data_ov002_022cf1a2 + (self->bit0 & 1) * 0x868 + self->b1_5 * 0x14) != 0) return 0;
    return func_ov002_021ff320(self, arg);
}
