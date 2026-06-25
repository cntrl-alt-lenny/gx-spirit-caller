/* CAMPAIGN-PREP candidate for func_0206bef4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs r5,r1 (arg1 first); ||-guard sets flag; r?0:-42 = movne/mvneq
 *   risk:       The `b==0 || (b->fd&1)` short-circuit must compile to `movs r5,r1; beq` then `ldrsb; ands; beq` into one shared `mov r2,#1`. If mwcc duplicates the flag=1 store per arm or reorders, the b/.L_1c merge diverges. reshape-able (explicit if/else flag, keep OR).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206bef4 (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: short-circuit OR guard selects flag
 * (arg1 saved first in r5); call; conditional fallback call; ternary tail
 * matching movne 0 / mvneq ~0x29.
 */
/* flag = (b==0 || (b->fd & 1)) ? 1 : 0;
 * r = func_0209256c(a, b, flag); if(r==0) func_0206bf60(b);
 * return r ? 0 : -42. */

typedef struct { char _pad[0xd]; signed char fd; } Node;

extern int  func_0209256c(void *a, Node *b, int flag);
extern void func_0206bf60(Node *b);

int func_0206bef4(void *a, Node *b)
{
    int flag;
    int r;
    if (b == 0 || (b->fd & 1))
        flag = 1;
    else
        flag = 0;
    r = func_0209256c(a, b, flag);
    if (r == 0)
        func_0206bf60(b);
    return r ? 0 : -42;
}
