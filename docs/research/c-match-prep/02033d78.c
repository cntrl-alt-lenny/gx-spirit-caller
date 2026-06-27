/* CAMPAIGN-PREP candidate for func_02033d78 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     for-loop ptr-walk +=0x28; load b4 (arg) before branch on b5; reload b4 after store
 *   risk:       asm loads b5(flags) then b4(arg) before branch (ldrb;cmp;ldrb;bne) — mwcc must hoist the b4 arg-load above the branch; likely matches but scheduling of the dual ldrb could rotate — permuter-class if it flips.
 *   confidence: med
 */
/* func_02033d78 (main, class C) — counted struct-stride(0x28) loop, two-branch dispatch.
 * r0=base(r6), r1=count(r5), r4=i. per entry: if(!f0)skip; arg=b4; branch on b5; result->b4; if(!b4)return. */
typedef struct {
    int           f0;           /* +0x00 active */
    unsigned char b4;           /* +0x04 state (call arg & result) */
    unsigned char b5;           /* +0x05 mode (branch selector) */
    unsigned char buf6[0x18 - 6];
    unsigned char buf18[0x28 - 0x18];
} Ent_02033d78;

extern int func_02051b10(unsigned char st, unsigned char *b6, unsigned char *b18);
extern int func_02051c4c(unsigned char st, unsigned char *b6, unsigned char *b18);

void func_02033d78(Ent_02033d78 *base, int count)
{
    int i;
    for (i = 0; i < count; i++) {
        if (base->f0 != 0) {
            if (base->b5 != 0)
                base->b4 = (unsigned char)func_02051b10(base->b4, base->buf6, base->buf18);
            else
                base->b4 = (unsigned char)func_02051c4c(base->b4, base->buf6, base->buf18);
            if (base->b4 == 0)
                return;
        }
        base = (Ent_02033d78 *)((char *)base + 0x28);
    }
}
