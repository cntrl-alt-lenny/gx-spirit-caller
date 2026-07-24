/* func_ov002_02202ae4: identical body shape to 022016bc -- kind==0x12,
 * +0x14 !=0, then global word != self bit0. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; char _p[0x14 - 4]; int f14; };

extern int data_ov002_022cd3f4;

int func_ov002_02202ae4(struct Self *self) {
    if (self->kind != 0x12) return 0;
    if (self->f14 == 0) return 0;
    return data_ov002_022cd3f4 != self->b0;
}
