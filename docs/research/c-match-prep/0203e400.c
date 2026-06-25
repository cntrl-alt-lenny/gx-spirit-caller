/* CAMPAIGN-PREP candidate for func_0203e400 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: high-nibble :4 at 0xd0b (lsl#18;lsr#1c); && short-circuit matches the two beq .L_3c; tail-call func_0203e870
 *   risk:       struct-guessed (d16 sits at base+0xd00+0x16; here flattened to +0xd16). The high-nibble field generates lsl#24;lsr#28 only if it is the SECOND :4 in the byte -- if the real struct makes 0xd0b a single :4-at-bit-4 the prefix differs; reshape-able by adjusting the bitfield split.
 *   confidence: med
 */
/* func_0203e400 - main - class D (nibble bitfield) + class C
 * guard on a u16 at base+0xd16 and func_0203e254(2); else a high-nibble
 * :4 field at base+0xd0b (>=1 -> 6) gating a tail-call to func_0203e870.
 * r4 holds the param/base pointer across all uses.
 */
typedef struct {
    unsigned char _pad0[0xd0b];
    unsigned char d0b_lo:4;  /* +0xd0b bit0 */
    unsigned char d0b_hi:4;  /* +0xd0b bit4 : lsl#18;lsr#1c */
    unsigned char d11;       /* +0xd11 */
    unsigned char _d12[5];
    unsigned short d16;      /* +0xd16 */
} Base;

extern int  func_0203e254(int sel);
extern int  func_0203eaa8(int);
extern int  func_0203e870(Base *b);

int func_0203e400(Base *b)
{
    if (b->d16 != 0 && func_0203e254(2) != 0) {
        b->d11 = func_0203eaa8(0);
        return 5;
    }
    if (b->d0b_hi >= 1)
        return 6;
    return func_0203e870(b);
}
