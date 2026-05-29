/* func_ov002_022958a8: C-39f — return table[1-bit0] <= pre()*0x1f4. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_022577dc(struct S *self);
int func_ov002_022958a8(struct S *self) {
    int p = func_ov002_022577dc(self);
    int v = *(int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868);
    return v <= p * 0x1f4;
}
