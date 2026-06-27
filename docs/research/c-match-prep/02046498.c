/* CAMPAIGN-PREP candidate for func_02046498 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: branch-table sel/off per case; ~N as mvn; runtime MSG_BASE add; return r4
 *   risk:       struct-guessed (MSG_BASE): _LIT0 0xfffefa48 is a relocated base added to ~N; if modeled as a foldable constant the mvn+add becomes one ldr. Case 1 (sel=0,off=0,r4=0) must zero r4 — emits 3 movs sharing a reg; reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02046498 (main, class D, MED tier).
 * Branch-table dispatch: movs r4,r0 guard ==0 -> return 0; switch(r4) 0..7
 * selects (sel, off) where off = ~N (mvn). Then if sel!=0 call
 * func_020480b4(sel, MSG_BASE + off). Returns r4. MSG_BASE = 0xfffefa48 is an
 * extern address-base added at runtime (ldr base; add r1,off,base) — must NOT
 * fold with off or the mvn collapses to a single ldr.
 *   recipe: D branch-table; sel/off pair per case; ~N as mvn; runtime base add; tail returns r4
 */
typedef int s32;

extern unsigned char MSG_BASE_02046498[];   /* _LIT0 = 0xfffefa48 base */
extern void func_020480b4(s32 sel, void *msg);

s32 func_02046498(s32 r4)
{
    s32 sel;
    s32 off;

    if (r4 == 0)
        return 0;

    switch (r4) {
    case 2:
        sel = 9;  off = ~0;     break;
    case 1:
    case 6:
        sel = 0;  off = 0;  r4 = 0;  break;
    case 3:
        sel = 6;  off = ~9;     break;
    case 4:
        sel = 6;  off = ~0x1d;  break;
    case 5:
        sel = 6;  off = ~0x45;  break;
    case 7:
        sel = 6;  off = ~0x4f;  break;
    default:
        sel = 0;  off = 0;      break;
    }

    if (sel != 0)
        func_020480b4(sel, MSG_BASE_02046498 + off);
    return r4;
}
