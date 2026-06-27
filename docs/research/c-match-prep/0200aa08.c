/* CAMPAIGN-PREP candidate for func_0200aa08 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :3 unsigned bitfield RMW; (field+1)%6 uses /6 umull magic; bind base once
 *   risk:       %6 lowers to umull 0xaaaaaaab + mul/sub; if mwcc picks a different reciprocal sequence or reloads data_02104f4c base the divmod/ldr diverge. reshape-able / struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0200aa08 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     :3 unsigned bitfield RMW; (field+1)%6 via /6 umull magic; single base bind
 *   risk:       see risk note
 */
/* func_0200aa08: increment a 3-bit field (mod 6) packed in low bits of the
   dword at data_02104f4c+0x4; return 1. */

typedef struct {
    unsigned int field : 3;   /* low 3 bits -> lsl#0x1d;lsr#0x1d read, bic#7;orr write */
    unsigned int rest  : 29;
} S_aa08;

extern unsigned char data_02104f4c[];

int func_0200aa08(void)
{
    S_aa08 *s = (S_aa08 *)(data_02104f4c + 0x4);
    s->field = (s->field + 1) % 6;
    return 1;
}
