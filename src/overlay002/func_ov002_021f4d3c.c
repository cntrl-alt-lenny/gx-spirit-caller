/* func_ov002_021f4d3c: byte-pack (gotcha 16 carry-over from brief 257).
 * u8 casts force `and #0xff` on bit0 and b1_5 before the pack. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern void func_ov002_0226aff0(int bit0, int packed, int one);
int func_ov002_021f4d3c(struct S *self) {
    unsigned char lo = self->bit0;
    unsigned char hi = self->b1_5;
    func_ov002_0226aff0(self->bit0, (u16)(lo | (hi << 8)), 1);
    return 1;
}
