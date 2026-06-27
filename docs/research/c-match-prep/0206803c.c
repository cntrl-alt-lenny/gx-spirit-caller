/* CAMPAIGN-PREP candidate for func_0206803c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: unconditional &=0xC3 RMW first, then separate |= per mode (re-read)
 *   risk:       the &=0xC3 and the |= must stay two separate load/modify/store (orig re-loads [lr]); if mwcc fuses them one strb diverges — reshape-able if so. f4/f10/flags offsets struct-guessed.
 *   confidence: med
 */
/* func_0206803c @ 0x0206803c  (cls D, main) — flag RMW (&=0xC3) then set-bit by mode,
   mode==2 early-returns, else dispatch on a compare. r2 = bool selector. */
typedef unsigned char u8;

extern void func_02068194(void *a, void *b);
extern void func_02068424(u8 *flags);
extern void func_0206844c(u8 *flags);

typedef struct A { int f4; u8 pad[0xC]; int f10; } A; /* +4, +0x10 */
typedef struct B { u8 pad[0x14]; u8 flags; } B;        /* +0x14 */

void func_0206803c(A *a, B *b, int sel, int mode)
{
    b->flags &= 0xC3;
    if (mode == 0) {
        b->flags |= 4;
    } else if (mode == 1) {
        b->flags |= 8;
    } else if (mode == 2) {
        return;
    }

    if (a->f10 < a->f4) {
        func_02068194(a, b);
        return;
    }
    if (sel != 0) {
        func_02068424(&b->flags);
        return;
    }
    func_0206844c(&b->flags);
}
