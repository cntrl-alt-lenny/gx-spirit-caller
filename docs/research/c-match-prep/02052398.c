/* CAMPAIGN-PREP candidate for func_02052398 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload *g per store (index extern global pointer each statement, no base local)
 *   risk:       Match hinges on mwcc reloading data_0219e3ec (the ldr [r2];add r0,r0,r1 per field). If it CSEs the base pointer into one reg, all the reloads collapse and it diverges. reshape-able (force reload — keep global-indexed, avoid a base local).
 *   confidence: med
 */
/* func_02052398 — main, cls C. Repeated reload-base + zero stores. COMPLETE.
   r2 holds &g (data_0219e3ec) ONCE; *g is RELOADED before every field store
   (no base bind). Modeled as indexing the extern global pointer per statement so
   mwcc reloads it each time (intervening stores defeat CSE). */
typedef struct Ring {
    unsigned char _p0[0x0c];
    int           x0c;    /* +0x0c */
    int           count;  /* +0x10 */
    int           x14;    /* +0x14 */
    int           max;    /* +0x18 */
    unsigned char x1c;    /* +0x1c */
    unsigned char x1d;    /* +0x1d */
    unsigned char _p1e[4];
    unsigned short x22;   /* +0x22 */
} Ring;                   /* sizeof == 0x30 */

extern Ring *data_0219e3ec;

void func_02052398(int id)
{
    if (data_0219e3ec == 0)
        return;

    data_0219e3ec[id].x0c = 0;
    data_0219e3ec[id].count = 0;
    data_0219e3ec[id].x14 = 0;
    data_0219e3ec[id].max = 0;
    data_0219e3ec[id].x1c = 0;
    if (data_0219e3ec[id].x1d != 0)
        data_0219e3ec[id].x1d = 1;
    data_0219e3ec[id].x22 = 0;
}
