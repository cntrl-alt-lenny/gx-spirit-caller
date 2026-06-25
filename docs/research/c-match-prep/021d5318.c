/* CAMPAIGN-PREP candidate for func_021d5318 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     changed-bool gate + 0202c0c0(0x66e) call + b500 bind mvneq(-1) store + nested count<0x78/flag guard + 2 tail calls + store-order
 *   risk:       changed-bool `c` reg flip; mvneq #0 (=-1) from `==0` guard may differ; nested-guard branch order may invert; ~1+ reg off
 *   confidence: low
 */
/* func_ov004_021d5318: state handler. On unk38-changed, play SE
 * 0202c0c0(0x66e) -> 021d8798(lock,ret,0); then if b500+0x4C==0 set
 * b500+0x88=-1. Then: while unk3C<0x78, if (touch&1)==0 return; finally
 * flush 021d8cd0(lock), 021ce1bc(0), seed unk30=0x18, raise unk38, reset
 * unk3C. */
#include "ov004_core.h"
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_ov004_021d8cd0(void *rec);
extern void func_ov004_021ce1bc(int idx);
extern char data_02104bac[];

void func_ov004_021d5318(void *rec) {
    char *p = rec;
    char *b = data_ov004_0220b500;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x66e), 0);
        if (*(int *)(b + 0x4C) == 0) *(int *)(b + 0x88) = ~0;
    }
    if ((unsigned int)*(int *)(p + 0x3C) < 0x78) {
        if ((*(unsigned short *)(data_02104bac + 0x54) & 1) == 0) return;
    }
    func_ov004_021d8cd0(data_ov004_022915e8);
    func_ov004_021ce1bc(0);
    *(int *)(p + 0x30) = 0x18;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
