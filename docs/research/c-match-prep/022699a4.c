/* CAMPAIGN-PREP candidate for func_022699a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: high-byte bitfield insert via :N struct; prev live in state2 (movne/moveq select); store-order
 *   risk:       struct-guessed/permuter-class: halfword bitfield-RMW insert (`bic;orr lsl#8`) + the +0x5a8/5ac/5b0 store ordering and the prev?:cur / 0x30:0x18 select are codegen-sensitive; first build unlikely to match exactly.
 *   confidence: low
 */
/* func_ov002_022699a4: sibling using HIGH byte of u16 cdc68+0xe; here prev IS
 * used (in state2). cur = idx*0x18 + ce588; prev = idx>0?cur-0x18:0.
 * State0: ce288 +0x5a8=0x80, +0x5ac=0, +0x5b0=0, insert (state+1) into HIGH
 * byte of cdc68+0xe; fall into state1. State1: ce288[+0x48c]=cur;
 * r=func_02257cfc(cur,prev); ce288 +0x5a8=r; if r==0 bump HIGH byte of cdc76;
 * return 0. State2: 021b1570(0x19,-1, prev?prev:cur, prev?0x30:0x18) ret 1. */
#include "ov002_core.h"

extern char data_ov002_022ce588[];
extern char data_ov002_022cdc68[];
extern char data_ov002_022cdc76[];
extern int  func_ov002_02257cfc(char *cur, char *prev);

struct hwc_byte { u16 lo8 : 8; u16 hi8 : 8; };

int func_ov002_022699a4(void) {
    int idx;
    char *cur;
    char *prev;
    int state;
    int ret;
    struct hwc_byte *h;

    idx = *(int *)(data_ov002_022ce288 + 0x484);
    cur = data_ov002_022ce588 + idx * 0x18;
    prev = (idx > 0) ? cur - 0x18 : 0;

    h = (struct hwc_byte *)(data_ov002_022cdc68 + 0xe);
    state = h->hi8;
    switch (state) {
    case 0:
        *(int *)(data_ov002_022ce288 + 0x5a8) = 0x80;
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
        *(int *)(data_ov002_022ce288 + 0x5b0) = 0;
        h->hi8 = state + 1;
        /* fallthrough */
    case 1:
        *(char **)(data_ov002_022ce288 + 0x48c) = cur;
        ret = func_ov002_02257cfc(cur, prev);
        *(int *)(data_ov002_022ce288 + 0x5a8) = ret;
        if (ret == 0) {
            ((struct hwc_byte *)data_ov002_022cdc76)->hi8 =
                ((struct hwc_byte *)data_ov002_022cdc76)->hi8 + 1;
        }
        return 0;
    case 2:
        func_ov002_021b1570(0x19, -1,
            (u16 *)(prev ? prev : cur),
            prev ? 0x30 : 0x18);
        return 1;
    default:
        return 1;
    }
}
