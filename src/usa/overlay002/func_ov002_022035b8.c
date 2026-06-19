/* func_ov002_022035b8: C-39f 2-D (bit0*0x868 + b1_5*20) table -> v == 0. */
typedef unsigned short u16;
struct S022036a8 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern char data_ov002_022cf0c2[];
int func_ov002_022035b8(struct S022036a8 *self) {
    unsigned short v = *(unsigned short *)(data_ov002_022cf0c2 + (self->bit0 & 1) * 0x868 + self->b1_5 * 20);
    return v == 0;
}
