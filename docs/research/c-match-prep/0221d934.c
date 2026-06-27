/* CAMPAIGN-PREP candidate for func_0221d934 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     packed decode; smulbb+mla per-player base; :13 bitfield; state switch; goto shared tail
 *   risk:       permuter-class: already shipped as walled .s. a/slot/poff(r7=mul)/soff(r6=smulbb)/id(r1) all live in callee-saved regs across the switch+calls; this whole-function reg-alloc is what walled it. C reshape won't recover.
 *   confidence: low
 */
/* func_ov002_0221d934 (ov002, class D) — resolve node via 0223de94 (packed
 * lo8=a, slot=(u16)v>>8), compute per-player base into cf16c, read :13 entry
 * (lsl19;lsr19) at +0x30 into r1, THEN switch on state ce288[0x5a8]
 * (0x7e/0x7f/0x80). 0x80: 0223df38 guard + cf1a4==0 + cf1a2!=0 then
 * 021d6714(a,slot,1)=>0x7f. 0x7f: 021df708(a)+021e2b1c(0x1e)=>0x7e. 0x7e:
 * 0202e270(entry13); if set & 0220e518(self)!=0 ret0; else 021d6714(a,slot,0).
 * r0=self. NOTE: already shipped as whole-function .s (reg-alloc-walled). */
#include "ov002_core.h"

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int  func_0202e270(int a);
extern int  func_ov002_021d6714(int a, int slot, int c);
extern int  func_ov002_021df708(int a);
extern int  func_ov002_021e2b1c(int a);
extern int  func_ov002_0220e518(void *self);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0223df38(void *self, int a, int b);

struct Slot13_934 { unsigned int : 19; unsigned int id : 13; };

int func_ov002_0221d934(void *self) {
    int v = func_ov002_0223de94(self, 0);
    int a = v & 0xff;
    int slot = ((((unsigned int)v << 16) >> 16) >> 8) & 0xff;
    int poff = (a & 1) * 0x868;
    int soff = slot * 0x14;
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    unsigned int id = ((struct Slot13_934 *)(data_ov002_022cf16c + poff + soff + 0x30))->id;
    if (st == 0x7e) {
        if (func_0202e270(id) == 0) goto def;
        if (func_ov002_0220e518(self) != 0) return 0;
        goto def;
    }
    if (st == 0x7f) {
        func_ov002_021df708(a);
        func_ov002_021e2b1c(0x1e);
        return 0x7e;
    }
    if (st != 0x80) return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + poff + soff) != 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a2 + poff + soff) == 0) return 0;
    func_ov002_021d6714(a, slot, 1);
    return 0x7f;
def:
    func_ov002_021d6714(a, slot, 0);
    return 0;
}
