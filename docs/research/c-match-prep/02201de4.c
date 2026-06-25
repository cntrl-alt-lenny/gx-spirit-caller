/* CAMPAIGN-PREP candidate for func_02201de4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit + bit9 + bit0 bitfields; equality guard; global flag
 *   risk:       bit9 extract via :10 field+>>9 may not emit lsl#22;lsr#31; inline-branch wall family; shipped as .s
 *   confidence: low
 */
/* func_ov002_02201de4: kind(6-bit)==0x19, then (+0x14 bit9) == self bit0 ->0,
 * else global word(cf8) !=0 -> 1. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; char _p[0x14 - 4]; unsigned int f14 : 10; };

struct Gcf8 { char _p[0xcf8]; int fcf8; };
extern struct Gcf8 data_ov002_022d016c;

int func_ov002_02201de4(struct Self *self) {
    if (self->kind != 0x19) return 0;
    if (((self->f14 >> 9) & 1) == self->b0) return 0;
    return data_ov002_022d016c.fcf8 != 0;
}
