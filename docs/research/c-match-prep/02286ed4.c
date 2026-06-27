/* CAMPAIGN-PREP candidate for func_02286ed4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order orr;strh then bic;strh; bit0 via word2&1; rsb=1-bit0; table[1-bit0]
 *   risk:       struct-guessed + permuter-class: bit0 read here is `word2 & 1` (orig keeps the raw u16 in a reg to bic), NOT the :1 bitfield form - a :1 read would re-ldrh. The orr/bic store-order and the fn-ptr+pass-through coloring (as in e54) both risk divergence.
 *   confidence: low
 */
/* func_ov002_02286ed4 (cls D, store-order): set bit15 flag, guard call, clear bit15, then nested guard.
 * orr #0x8000 then strh [+2] (set high flag); ...; bic #0x8000 then strh [+2] (clear) AFTER reading r0;
 * STORE-ORDER matters: emit the orr-store, then the call, then the bic-store. rsb #1 => 1-bit0 here. */
typedef unsigned short u16;
struct S86ed4 { u16 f0; u16 word2; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c848c(unsigned int bit);
extern int func_ov002_022576d8(void);
extern int func_ov002_0228c864(unsigned int bit, int a, int (*fn)(void));
extern int func_ov002_0228db8c(void);
int func_ov002_02286ed4(struct S86ed4 *self) {
    int a, r, v;
    self->word2 |= 0x8000;
    a = func_ov002_022576d8();
    r = func_ov002_0228c864(1 - (self->word2 & 1), a, func_ov002_0228db8c);
    self->word2 &= ~0x8000;
    if (r < 0) return 0;
    v = func_ov002_021c848c(1 - (self->word2 & 1));
    if (*(int *)(data_ov002_022cf16c + ((1 - (self->word2 & 1)) & 1) * 0x868) <= v) return 1;
    return 0;
}
