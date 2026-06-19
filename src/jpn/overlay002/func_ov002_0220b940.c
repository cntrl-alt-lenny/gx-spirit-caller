/* func_ov002_0220b940: C-39f — if pre() and 2-D table[bit0][b1_5] != 0,
 * return 1; else 0. Inverted polarity (body inside the if) so pre()==0
 * branches to the shared return 0. */
typedef unsigned short u16;
struct Sba30 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern char data_ov002_022cf0c8[];
extern int func_ov002_021ff230(struct Sba30 *self);
int func_ov002_0220b940(struct Sba30 *self) {
    if (func_ov002_021ff230(self) != 0) {
        return *(int *)(data_ov002_022cf0c8 + (self->bit0 & 1) * 0x868 + self->b1_5 * 0x14) != 0;
    }
    return 0;
}
