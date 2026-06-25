/* CAMPAIGN-PREP candidate for func_0223ba60 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off=(id&1)*0x868 via mul; bind base for loop1 [+0xc] bound; mla return ptr
 *   risk:       orig MUL (not lsl) for off and keeps base=cf16c+off in r8 across loop1 while RELOADING cf16c for the return-addr (_LIT2 reloaded); if mwcc binds one pointer for both, the loop1 ldr/return addressing diverges. permuter-class (bind-vs-reload split).
 *   confidence: low
 */
/* func_ov002_0223ba60: per-player base = cf16c + (id&1)*0x868. If the event
 * count (cf178 at that player offset) is nonzero, scan kind-11 entries up to
 * base[0xc]; first hit returns &(base+0x120)[i]. Otherwise scan a 5-entry
 * kind-0 list; first hit returns base+0x30 + i*0x14. Else 0. Returns a ptr.
 * Class C: two counted loops, packed per-player index, base held in reg. */
#include "ov002_core.h"
extern int func_ov002_0223b864(int self, int a, int b);

void *func_ov002_0223ba60(int arg0) {
    int off = (arg0 & 1) * 0x868;
    int i = 0;
    char *base;
    if (*(unsigned int *)(data_ov002_022cf178 + off) > 0) {
        base = data_ov002_022cf16c + off;
        do {
            if (func_ov002_0223b864(arg0, 0xb, i) != 0) {
                return data_ov002_022cf16c + off + 0x120 + i * 4;
            }
            i++;
        } while ((unsigned int)i < *(unsigned int *)(base + 0xc));
    }
    for (i = 0; i <= 4; i++) {
        if (func_ov002_0223b864(arg0, i, 0) != 0) {
            return data_ov002_022cf16c + off + 0x30 + i * 0x14;
        }
    }
    return 0;
}
