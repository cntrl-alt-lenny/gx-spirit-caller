/* CAMPAIGN-PREP candidate for func_0220888c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base=flag0*0x868+ptr fused; k5*0x14 record stride; two tst's as if/if short-circuit OR
 *   risk:       struct-guessed Rec20 stride 0x14 + base fusion: orig emits `mla r0,flag0,#0x868,base`; mwcc may split mul+add (2 insns) instead of mla. struct-guessed (confirm 0x14 stride) / reshape-able.
 *   confidence: med
 */
/* func_ov002_0220888c (ov002, D) — leaf: mla base + two bit-tests OR.
 *   attr@+2: flag0 :1 @bit0, k5 :5 @bit1.
 *   base = data_022cf1ac + flag0*0x868   (mla ip,#0x868,base ; ip=flag0)
 *   v = *(int*)((char*)base + k5*0x14)   (k5*20 stride record)
 *   return ((v>>16)&1) || ((v>>17)&1).
 * Orig: mul k5*0x14 in r1, mla flag0*0x868+base in r0, ldr [r1,r0]. The two
 * tst's are tst (v>>16)&1 then (v>>17)&1; short-circuit OR. */
struct Obj { unsigned short u0; unsigned short flag0 : 1, k5 : 5, : 10; };
struct Rec20 { unsigned w0; char pad[0x10]; };   /* stride 0x14, word w0 holds bits16/17 */

extern char data_ov002_022cf1ac[];

int func_ov002_0220888c(struct Obj *card) {
    int flag0 = card->flag0;
    struct Rec20 *base = (struct Rec20 *)(data_ov002_022cf1ac + flag0 * 0x868);
    unsigned v = base[card->k5].w0;
    if ((v >> 16) & 1) return 1;
    if ((v >> 17) & 1) return 1;
    return 0;
}
