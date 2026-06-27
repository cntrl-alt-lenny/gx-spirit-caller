/* CAMPAIGN-PREP candidate for func_02206b00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :2@12 guard; w14 read as UNSIGNED int then (u16)(>>16)/(u16) halves >>3; helper ret (u16)>>8&0xff; high half checked first.
 *   risk:       reshape-able: the redundant (u16) casts (lsl16;lsr16) on the high-half >>16 and on the helper return may be ELIDED by mwcc (top bits already 0), dropping 2-4 instrs. If elided, force the cast via a short temp or union.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02206b00 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Duplicated extract+call+compare on word@+0x14.
 * Guard: f2.:2@bit12 == 2 else 0. word@+0x14 read as int; HIGH half first:
 *   a = 021b947c((u16)(w14>>16) >> 3); if (((u16)a >> 8) & 0xff)==0xf return 1.
 *   LOW half: b = 021b947c((u16)w14 >> 3); return (((u16)b >> 8)&0xff)==0xf.
 * (u16)x>>3 -> lsl16;lsr16;asr3 (signed int shift). (u16)ret>>8 -> lsl16;lsr16;asr8. */
typedef unsigned short u16;

extern int func_ov002_021b947c(int a);

/* w14 lives at +0x14: _0(+0) + bitfields(+2) = 4 bytes, pad _4[16] to reach +0x14.
 * w14 UNSIGNED so high-half extract is lsr#16 (logical) matching asm, not asr#16. */
struct Ent6b00 { u16 _0; u16 _2 : 12; u16 f12 : 2; u16 _14 : 2; char _4[16]; unsigned w14; };

int func_ov002_02206b00(struct Ent6b00 *p) {
    unsigned w14;
    if (p->f12 != 2)
        return 0;
    w14 = p->w14;
    if (((u16)func_ov002_021b947c((u16)(w14 >> 16) >> 3) >> 8 & 0xff) == 0xf)
        return 1;
    return ((u16)func_ov002_021b947c((u16)w14 >> 3) >> 8 & 0xff) == 0xf;
}
