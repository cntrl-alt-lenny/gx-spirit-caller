/* CAMPAIGN-PREP candidate for func_02215bf4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868+Ov002Slot.id; if-chain dispatch; bind state once; (v+1)>>1 signed asr
 *   risk:       0202b8f0 result r7 must survive the 021c1e44 call into the (v+1)>>1 arg; if mwcc spills/reloads r7, scheduling diverges. permuter-class.
 *   confidence: med
 */
/* func_ov002_02215bf4: state-dispatch on ce288+0x5a8. State 0x80: gated send
 * (0226b034). State 0x7f: per-player(player&1) slot lookup -> 0202b8f0(id),
 * guard 021c1e44, then 021debe0 + 021df818. Per-player 0x868 stride + Ov002Slot.id. */
#include "ov002_core.h"
extern char data_ov002_022d0e6c[];
extern int  func_ov002_022577dc(void);
extern int  func_0202b8f0(int id);
extern void func_ov002_0226b034(int a, int b, int c);

int func_ov002_02215bf4(struct Ov002Self *arg0) {
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x7f) {
        unsigned int raw = *(unsigned short *)(data_ov002_022d0e6c + 0xb0);
        int player = raw & 0xff;
        int idx = (raw >> 8) & 0xff;
        struct Ov002Slot *s = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 0x30);
        int v = func_0202b8f0(s->id);
        if (func_ov002_021c1e44(arg0, player, idx) != 0) return 0;
        func_ov002_021debe0((int)arg0, player, idx);
        func_ov002_021df818((int)arg0, 1 - *(int *)(data_ov002_022d016c + 0xcec), (v + 1) >> 1);
        return 0;
    }
    if (st == 0x80) {
        if (func_ov002_022577dc() == 0) return 0;
        func_ov002_0226b034(*(int *)(data_ov002_022d016c + 0xcec), arg0->f0, arg0->b0);
        return 0x7f;
    }
    return 0;
}
