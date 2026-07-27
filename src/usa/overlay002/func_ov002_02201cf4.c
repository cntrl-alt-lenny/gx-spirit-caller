/* func_ov002_02201cf4: kind(6-bit)==0x19, then (+0x14 bit9) == self bit0 ->0,
 * else global word(cf8) !=0 -> 1. bit9 extracted from the raw +0x14 word via
 * the literal lsl22/lsr31 shift-pair (kept un-abstracted -- a bitfield member
 * further right-shifted risks a double-shift near-miss). */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; };
struct Gcf8 { char _p[0xcf8]; int fcf8; };
extern struct Gcf8 data_ov002_022d008c;

int func_ov002_02201cf4(struct Self *self) {
    unsigned int f14word;
    if (self->kind != 0x19) goto notfound;
    f14word = *(unsigned int *)((char *)self + 0x14);
    if (((f14word << 22) >> 31) == self->b0) return 0;
    return data_ov002_022d008c.fcf8 != 0;
notfound:
    return 0;
}
