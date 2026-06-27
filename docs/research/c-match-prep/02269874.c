/* CAMPAIGN-PREP candidate for func_02269874 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: low-byte/bit0 bitfield insert via :N struct; prev null-guard; case0->case1 fallthrough; store-order
 *   risk:       struct-guessed/permuter-class: prev computed+null-checked then UNUSED (dead) here — mwcc will DCE unless it's really live (sibling 9a4 uses it in state2); plus the bitfield-RMW store scheduling.
 *   confidence: low
 */
/* func_ov002_02269874: sibling of 02269758 but LOW-byte state of u16 cdc68+0xe,
 * bit0 of *(u16*)(cur+4), and low byte of cdc76. cur = idx*0x18 + ce588.
 * Orig computes prev=(idx>0?cur-0x18:0) and nulls it if *(u16*)prev==0, then
 * does NOT use prev (dead) -> see risk. State0: ce288 +0x5b8/+0x5bc=0, low
 * byte of cdc68+0xe = state+1, fall into state1. State1: ce288[+0x48c]=cur;
 * r=func_02257ca8(cur); if r!=0 set bit0 of cur+4=(r>0), bump low byte of
 * cdc76; return 0. State2: 021b1570(0x1b,-1,cur,0x18) return 1. */
#include "ov002_core.h"

extern char data_ov002_022ce588[];
extern char data_ov002_022cdc68[];
extern char data_ov002_022cdc76[];
extern int  func_ov002_02257ca8(char *cur);

struct hwb_byte { u16 lo8 : 8; u16 hi8 : 8; };
struct hwb_bit0 { u16 b0 : 1; };

int func_ov002_02269874(void) {
    int idx;
    char *cur;
    char *prev;
    int state;
    int ret;
    struct hwb_byte *h;

    idx = *(int *)(data_ov002_022ce288 + 0x484);
    cur = data_ov002_022ce588 + idx * 0x18;
    prev = (idx > 0) ? cur - 0x18 : 0;
    if (prev != 0 && *(u16 *)prev == 0)
        prev = 0;

    h = (struct hwb_byte *)(data_ov002_022cdc68 + 0xe);
    state = h->lo8;
    switch (state) {
    case 0:
        *(int *)(data_ov002_022ce288 + 0x5b8) = 0;
        *(int *)(data_ov002_022ce288 + 0x5bc) = 0;
        h->lo8 = state + 1;
        /* fallthrough */
    case 1:
        *(char **)(data_ov002_022ce288 + 0x48c) = cur;
        ret = func_ov002_02257ca8(cur);
        if (ret != 0) {
            ((struct hwb_bit0 *)(cur + 4))->b0 = (ret > 0);
            ((struct hwb_byte *)data_ov002_022cdc76)->lo8 =
                ((struct hwb_byte *)data_ov002_022cdc76)->lo8 + 1;
        }
        return 0;
    case 2:
        func_ov002_021b1570(0x1b, -1, (u16 *)cur, 0x18);
        return 1;
    default:
        return 1;
    }
}
