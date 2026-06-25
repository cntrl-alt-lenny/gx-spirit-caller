/* CAMPAIGN-PREP candidate for func_020aabac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-else chain returns consts; struct{char*pos,int st}; r1=passthrough dflt
 *   risk:       sel dispatch is an explicit cmp #0/#1/#2 chain (not a jump table) and the case-1 `pos--` reloads [r0]. If mwcc builds a switch jump-table or keeps pos cached from a prior load, the ldr/str sequence at .L_1298 diverges. reshape-able: if/else-if chain + re-read m->pos (no temp) forces reload.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020aabac (main, class C) - brief p_0053.
 * UNVERIFIED build-free draft.
 *   recipe:     if-else chain (NOT switch) returning constants; struct {char*pos; int st}
 *   confidence: med
 */
/* mbtowc-ish 3-state machine on *r2.
 * r0 = struct { char *pos@0; int state@4; }.  r1 carries default-return wchar.
 * state 0: read *pos; if 0 set state=1,return -1; else pos++, return (unsigned char).
 * state 1: if state!=0 clear it; else pos--; return r1.
 * state 2: return state. default: return 0. */

typedef struct { signed char *pos; int state; } MbState;

int func_020aabac(MbState *m, int dflt, int sel)
{
    signed char *p;
    int v;

    if (sel == 0) {
        p = m->pos;
        v = *p;
        if (v == 0) { m->state = 1; return -1; }
        m->pos = p + 1;
        return v & 0xff;
    }
    if (sel == 1) {
        if (m->state != 0) { m->state = 0; }
        else { m->pos = m->pos - 1; }   /* ldr r2,[r0]; sub; str r2,[r0] */
        return dflt;
    }
    if (sel == 2)
        return m->state;
    return 0;
}
