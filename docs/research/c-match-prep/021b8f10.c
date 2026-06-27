/* CAMPAIGN-PREP candidate for func_021b8f10 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: lo=v&0xff held in r0 across, hi=(u16)v>>8&0xff (asr), :8 guard at +6, range branch, dispatch call
 *   risk:       permuter-class: orig computes lo/hi/k BEFORE the guard and keeps lo in r0 across the guard (movne r0,#0 on fail). mwcc may re-order the extracts or predicate `return 1` (movle) where orig branches; the inline-vs-branch of the const returns is the unsteerable class.
 *   confidence: low
 */
/* func_ov002_021b8f10: read func_ov002_0223de94(node,0); split into lo=v&0xff
 * (kept live as the 021b8fcc arg) and hi=((u16)v>>8)&0xff. Guard on the :8
 * byte at +6 of node (==1, else return 0). If hi in [5,10] return 1; if hi<5
 * dispatch func_ov002_021b8fcc(lo,hi)!=0; else return 0. Class D: two bitfield
 * extracts, range compares, two calls. */
typedef unsigned short u16;

struct Node8f10 { char _pad[6]; u16 k8 : 8; };

extern u16 func_ov002_0223de94(void *node, int idx);
extern int func_ov002_021b8fcc(int a, int b);

int func_ov002_021b8f10(void *node) {
    int v;
    int lo;
    int hi;
    v = (int)func_ov002_0223de94(node, 0);
    lo = v & 0xff;
    hi = (((u16)v) >> 8) & 0xff;
    if (((struct Node8f10 *)node)->k8 != 1)
        return 0;
    if (hi >= 5) {
        if (hi <= 10)
            return 1;
        return 0;
    }
    return func_ov002_021b8fcc(lo, hi) != 0;
}
