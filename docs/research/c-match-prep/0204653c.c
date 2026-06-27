/* CAMPAIGN-PREP candidate for func_0204653c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: nested branch-table; outer sel/off, inner picks addend+dispatcher; tail func_0204931c, return r6
 *   risk:       struct-guessed + permuter-class: g->f24/f9c offsets and the per-case r5 (off) accumulation order inferred; my goto/control-flow rebuild likely mis-sequences the shared `add r5` and tail call — needs faithful restructure or .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0204653c (main, class D, MED tier).
 * Nested branch-table. Outer switch(r6) 0..4 picks (r4=sel, r5=off=~N). Then
 * inner switch on g->f24 (g=*data_0219daec) 0..5 chooses a dispatcher and an
 * offset addend (_LIT1=0xffff11b8, _LIT2=0xfffec398, _LIT3=0xfffeeaa8, default
 * _LIT4 same as _LIT3) added to r5 before the final func_0204931c(sel,off).
 *   recipe: D nested branch-table; outer sel/off pair; inner picks addend+dispatcher; tail returns r6
 */
typedef int s32;

extern unsigned char ADD_11b8[];   /* _LIT1 0xffff11b8 */
extern unsigned char ADD_c398[];   /* _LIT2 0xfffec398 */
extern unsigned char ADD_eaa8[];   /* _LIT3 0xfffeeaa8 */
extern void func_020480b4(s32 sel, void *off);
extern void func_02050054(s32 sel, void *off);
extern void func_0204931c(s32 sel, void *off);

typedef struct {
    unsigned char _pad[0x24];
    s32 f24;   /* +0x24 inner selector */
    unsigned char _pad2[0x74];
    s32 f9c;   /* +0x9c guard for inner case 3 */
} Obj0204653c;

extern Obj0204653c *data_0219daec;

s32 func_0204653c(s32 r6)
{
    s32 sel;
    s32 off;
    Obj0204653c *g;

    if (r6 == 0)
        return 0;

    switch (r6) {
    case 2:  sel = 9; off = ~0;    break;
    case 3:  sel = 9; off = ~1;    break;
    case 4:  sel = 6; off = ~9;    break;
    default: sel = 6; off = ~0x13; break;  /* case 0,1 and tail */
    }

    g = data_0219daec;
    switch (g->f24) {
    case 2:
        func_020480b4(sel, ADD_11b8 + off);
        break;
    case 3:
        if (g->f9c < 1)
            func_020480b4(sel, ADD_11b8 + off);
        off = (s32)(ADD_11b8 + off);
        goto tail_skip;   /* add r5 already applied; falls to func_0204931c */
    case 6:
        func_02050054(sel, ADD_c398 + off);
        break;
    case 5:
        off = (s32)(ADD_eaa8 + off);
        goto tail_skip;
    default:  /* 0,1,4 */
        off = (s32)(ADD_eaa8 + off);
        goto tail_skip;
    }
    func_0204931c(sel, ADD_11b8 + off);
    return r6;
tail_skip:
    func_0204931c(sel, (void *)off);
    return r6;
}
