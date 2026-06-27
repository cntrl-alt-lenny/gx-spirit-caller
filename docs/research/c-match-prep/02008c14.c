/* CAMPAIGN-PREP candidate for func_02008c14 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: signed int %/>> => asr/lsr/ror bit-index; decl base+i before buf; bitset OR
 *   risk:       reshape-able: the signed `i>>5`/`i&31` MUST stay signed int (an unsigned i collapses the ror trick to a plain lsr and diverges). Secondary: store-order base[1] then base[0]; struct word[] size guessed but only [0..1] touched here.
 *   confidence: med
 */
/* func_02008c14: zero two global words, then for signed int i in [0,50):
 *   if (func_02008d60(i, &buf)) bitset[i>>5] |= 1u << (i & 31);
 * The asr/lsr/ror dance in asm is exactly mwcc's signed i/32 (word idx)
 * and signed i%32 (bit pos) for an `int` loop var. Use signed int i and
 * a u32* base; declare base(r6) and i(r7) BEFORE buf so r6/r7 alloc first.
 * buf is a 0x124-byte (>=292B) scratch passed to the callee. */
typedef struct {
    unsigned int word[2 + 0x10]; /* +0x0,+0x4 zeroed; bitset words follow */
} Glob_02105bb0;

extern Glob_02105bb0 data_02105bb0;
extern int func_02008d60(int i, void *buf);

void func_02008c14(void) {
    unsigned int *base = data_02105bb0.word;
    int i;
    char buf[0x124];
    base[1] = 0;
    base[0] = 0;
    for (i = 0; i < 50; i++) {
        if (func_02008d60(i, buf)) {
            base[i >> 5] |= 1u << (i & 31);
        }
    }
}
