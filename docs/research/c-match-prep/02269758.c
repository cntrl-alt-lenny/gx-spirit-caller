/* CAMPAIGN-PREP candidate for func_02269758 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: halfword bitfield insert (hi8/b15) via :N struct; switch w/ case0->case1 fallthrough; store-order
 *   risk:       struct-guessed/permuter-class: bitfield RMW (`bic;orr lsl#8`) + interleaved store scheduling rarely match first build; orig's DEAD prev=(idx>0?cur-0x18:0) computation is unmodeled (likely DCE'd).
 *   confidence: low
 */
/* func_ov002_02269758: 3-state (high-byte of u16 cdc68+0xc) halfword RMW.
 * cur = idx*0x18 + ce588 (idx = ce288[+0x484]). State0: zero ce288 +0x5b4 /
 * +0x5bc, insert (state+1) into the HIGH byte of cdc68+0xc; fall into state1.
 * State1: ce288[+0x48c]=cur; r=func_02257c54(cur); if r!=0 set bit15 of
 * *(u16*)(cur+2)=(r>0) and bump high byte of cdc74; return 0. State2: post
 * 021b1570(0x1d,-1,cur,0x18) return 1. The orig also computes prev=(idx>0?
 * cur-0x18:0) but DOES NOT USE it here (dead) -> may need forcing/DCE check. */
#include "ov002_core.h"

extern char data_ov002_022ce588[];
extern char data_ov002_022cdc68[];
extern char data_ov002_022cdc74[];
extern int  func_ov002_02257c54(char *cur);

struct hw_byte  { u16 lo8 : 8; u16 hi8 : 8; };
struct hw_bit15 { u16 lo15 : 15; u16 b15 : 1; };

int func_ov002_02269758(void) {
    int idx;
    char *cur;
    int state;
    int ret;
    struct hw_byte *h;

    idx = *(int *)(data_ov002_022ce288 + 0x484);
    cur = data_ov002_022ce588 + idx * 0x18;

    h = (struct hw_byte *)(data_ov002_022cdc68 + 0xc);
    state = h->hi8;
    switch (state) {
    case 0:
        *(int *)(data_ov002_022ce288 + 0x5b4) = 0;
        *(int *)(data_ov002_022ce288 + 0x5bc) = 0;
        h->hi8 = state + 1;
        /* fallthrough */
    case 1:
        *(char **)(data_ov002_022ce288 + 0x48c) = cur;
        ret = func_ov002_02257c54(cur);
        if (ret != 0) {
            ((struct hw_bit15 *)(cur + 2))->b15 = (ret > 0);
            ((struct hw_byte *)data_ov002_022cdc74)->hi8 =
                ((struct hw_byte *)data_ov002_022cdc74)->hi8 + 1;
        }
        return 0;
    case 2:
        func_ov002_021b1570(0x1d, -1, (u16 *)cur, 0x18);
        return 1;
    default:
        return 1;
    }
}
