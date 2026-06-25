/* CAMPAIGN-PREP candidate for func_021b3488 (ov019, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: mul-mask `(c-0x10)*0xd & 0x1ff` literal; reload o->counter (orig re-ldr each use); store-order g_lit2[0] then [1].
 *   risk:       struct-guessed + TRUNCATED: state-2 body cut off in source asm so that branch is incomplete; _LIT0/_LIT1/_LIT2/_LIT3 pool identities and obj layout inferred — confirm against real symbols.
 *   confidence: low
 */
// func_ov019_021b3488 : 3-state machine (state in obj[0], counter in obj[1])
// NOTE: source asm TRUNCATED mid state-2; states 0/1 complete, state 2 partial.
extern int   func_0208c884(int a, int b);
extern int   func_ov019_021b35dc(void);
extern int   func_ov019_021b56f8(void *p);
extern int   func_ov019_021b573c(void *p);
extern void *data_ov019_021b6920;     // _LIT3 base (has +8 flag)

struct Obj19_3488 { int state; int counter; };

extern int g_lit2[2];                 // _LIT2: two written words
extern int g_lit0;                    // _LIT0 magic (1st func_0208c884 arg)
extern int g_lit1;                    // _LIT1 magic (2nd func_0208c884 arg)

void func_ov019_021b3488(struct Obj19_3488 *o)
{
    int s = o->state;
    if (s == 0) {
        int c = o->counter + 1;
        o->counter = c;
        func_0208c884(g_lit0, c - 0x10);
        func_0208c884(g_lit1, o->counter - 0x10);
        {
            int v = o->counter - 0x10;
            g_lit2[0] = (v * 0xd) & (0x20c - 0xd);
            v = o->counter - 0x10;
            g_lit2[1] = (v * 0xd) & (0x20c - 0xd);
        }
        if (o->counter >= 0x10) { o->state = 1; o->counter = 0; }
    } else if (s == 1) {
        int *lit3 = (int *)&data_ov019_021b6920;
        if (lit3[2] != 0) {
            if (func_ov019_021b573c(lit3) != 0) {
                func_ov019_021b56f8(lit3);
                o->state = 2; o->counter = 0;
            }
        } else {
            if (func_ov019_021b35dc() != 0) { o->state = 2; o->counter = 0; }
        }
    } else if (s == 2) {
        int c = o->counter + 1;
        o->counter = c;
        func_0208c884(g_lit0, -c);
        func_0208c884(g_lit1, -o->counter);
        /* TRUNCATED: remainder of state 2 not in source asm */
    }
}
