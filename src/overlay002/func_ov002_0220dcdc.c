typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern char data_ov002_022cf288[];
int func_ov002_0220dcdc(struct Ov002Self *self) {
    unsigned int w;
    if (self->b6_11 == 0x23) return 0;
    if (self->b6_11 == 0x23) goto ret1;
    w = *(unsigned int *)(data_ov002_022cf288 + (self->b0 & 1) * 0x868);
    if ((w >> 26) & 1) return 0;
ret1:
    return 1;
}
