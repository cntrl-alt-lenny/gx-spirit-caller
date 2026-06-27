/* CAMPAIGN-PREP candidate for func_0221cef4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual-flag bit0/bit1 guards; packed decode; nested mla; :13 bitfield; arg-pack tail
 *   risk:       struct-guessed + permuter-class: the nested-mla base uses two globals (cf16c[0] flag, cf16c[+0x1c] index) bound to r6/r1 then MLA'd; mwcc reg-alloc for r4/r5/r6 (a,b,self) almost certainly diverges.
 *   confidence: low
 */
/* func_ov002_0221cef4 (ov002, class D) — state==0x80 branch does: read a
 * dual-flag word ce288[0xd0] (bit0 -> ret0, bit1 -> ret0), then resolve a
 * node/slot via 0223df38 + 0223de94 (packed: lo8=a, hi8=b), validate via
 * 0225764c, then nested-mla into cf16c per-player table to read a :13 entry
 * (lsl19;lsr19) and if nonzero post via 021d479c arg-pack. state==0x7f ->
 * 0226b204(1). r0 = self (r6). */
#include "ov002_core.h"

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_0223df38(void *self, int a, int b);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0225764c(void *self, int a, int b);
extern int  func_ov002_0226b204(int a);

struct Slot13cef4 { unsigned int : 19; unsigned int id : 13; };

int func_ov002_0221cef4(void *self) {
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x7f) {
        func_ov002_0226b204(1);
        return 0;
    }
    if (st != 0x80) return 0;
    {
        unsigned int fl = *(unsigned int *)(data_ov002_022ce288 + 0xd0);
        int a, b, ev;
        if (fl & 1) return 0;
        if ((fl & 2) == 0) return 0;
        if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
        ev = func_ov002_0223de94(self, 0);
        a = ev & 0xff;
        b = (((unsigned int)ev << 16) >> 16) >> 8;
        if (func_ov002_0225764c(self, a, b) == 0) return 0;
        {
            int *t0 = (int *)data_ov002_022cf16c;
            int p = *t0 & 1;
            char *base = data_ov002_022cf16c + p * 0x868 + t0[7] * 0x14;
            unsigned int id = ((struct Slot13cef4 *)(base + 0x30))->id;
            if (id == 0) return 0;
            func_ov002_021d479c((u16)((p ? 0x8000 : 0) | 0x19), (u16)t0[7], (u16)b, (u16)a);
            return 0x7f;
        }
    }
}
