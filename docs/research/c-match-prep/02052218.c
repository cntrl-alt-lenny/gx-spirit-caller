/* CAMPAIGN-PREP candidate for func_02052218 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense 0..5 branch-table to tail calls; case5 mul-index store-order; default error call
 *   risk:       case 5 re-derives base via mul id*0x30 and RELOADS (*g) three times (one per field store); if mwcc binds the base or merges reloads, case 5 diverges. struct-guessed + reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02052218 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense 0..5 branch-table dispatch to tail calls; case5 mul-index store-order; default error call
 *   risk:       switch(func_02052334()) spans 0..5 (cmp #4 + 6 slots — actually addls past pc gives 6 entries) dispatching mostly tail calls; case 5 re-derives base via mul ip=id*0x30 and reloads (*g) THREE times (one per field store) rather than binding. If mwcc binds the base or merges the three (*g) reloads, case 5 diverges. struct-guessed (x10/x18/x1d) + reshape-able (keep 3 separate (*g) reloads).
 *   confidence: med
 */
/* func_02052218 — main, cls D. id=func_02046870()(r4); r6=a1, r5=a2. Branch-table
   on func_02052334() (0..5): 0(.L_3ac) -> func_0204525c(6, 0xfffe82b6); 1(.L_308) ->
   func_0205272c(a1) guard (<2 or >4 return) then func_02052098(id,a1,a2); 2 ->
   func_02052098; 3 -> func_02051f98; 4 -> func_02051f48; 5(.L_370) -> mul-index
   store sequence into (*g)[id]. Case 5 RELOADS (*g) per field (3 ldr). */
typedef struct Ring {
    unsigned char _p0[0x10];
    int           x10;    /* +0x10 */
    unsigned char _p14[4];
    int           x18;    /* +0x18 */
    unsigned char _p1c;
    unsigned char flag;   /* +0x1d */
} Ring;                   /* sizeof == 0x30 */

extern Ring *data_0219e3ec;                 /* *g */
extern int  func_02046870(void);
extern int  func_02052334(void);
extern int  func_0205272c(int a1);
extern void func_0204525c(int a, int b);
extern void func_02052098(int id, int a1, int a2);
extern void func_02051f98(int id, int a1, int a2);
extern void func_02051f48(int id, int a1, int a2);

void func_02052218(int unused, int a1, int a2)
{
    int id = func_02046870();

    (void)unused;
    switch (func_02052334()) {
    case 1:                                 /* .L_308 */
        {
            int s = func_0205272c(a1);
            if (s < 2 || s > 4)
                return;
        }
        func_02052098(id, a1, a2);
        return;
    case 2:                                 /* .L_334 */
        func_02052098(id, a1, a2);
        return;
    case 3:                                 /* .L_348 */
        func_02051f98(id, a1, a2);
        return;
    case 4:                                 /* .L_35c */
        func_02051f48(id, a1, a2);
        return;
    case 5:                                 /* .L_370 — mul-index, (*g) reloaded x3 */
        data_0219e3ec[id].flag = 1;
        data_0219e3ec[id].x10  = 0;
        data_0219e3ec[id].x18  = 0;
        return;
    default:                                /* 0 -> .L_3ac */
        func_0204525c(6, (int)0xfffe82b6);
        return;
    }
}
