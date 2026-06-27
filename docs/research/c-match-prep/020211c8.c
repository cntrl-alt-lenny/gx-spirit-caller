/* CAMPAIGN-PREP candidate for func_020211c8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: scan-loop + mla base+0x34+i*0x618; store a0 before reusing a0 as scan ptr; guarded calls
 *   risk:       loop reg-alloc: orig holds base(r4)/slot(r6)/a0(r5) live across many bl; a0 is reused as the scan cursor after the +0x4 store. mwcc spill/reuse choices and mla fusion likely rotate. permuter-class
 *   confidence: low
 */
/* func_020211c8: scan for free slot (stride 0x618, max 8), Fill32 it,
 * run guarded init calls, then byte-scan a0 for high-byte==0xf1. */

extern void Fill32(int value, void *dest, int size);
extern int  func_020211a4(int n);
extern void func_02021b38(int x);
extern void func_02023274(int x);
extern void func_02023f7c(int x);
extern void func_02024430(int x);
extern void func_02026fd8(int x);
extern void func_020285bc(int x);
extern int  func_0202a1cc(int x);
extern int  func_02021a3c(void *slot, unsigned int *p);
extern char data_02194340[];

typedef struct {
    char pad00[0x08];
    int  f08;
    char pad0c[0x0c];
    int  f18;
    int  f1c;
    int  f20;
    int  f24;
    int  f28;
    int  f2c;
    int  f30;
    char pad34[0x04];
    int  f38;
} Slot;

void *func_020211c8(unsigned int *a0) {
    char *base = data_02194340;
    char *cur = base;
    int i = 0;
    while (((Slot *)cur)->f38 != 0) {
        cur = cur + 0x218 + 0x400;
        if (++i >= 8) break;
    }
    {
        char *slot = base + 0x34 + i * 0x618;
        Fill32(0, slot, 0x618);
        *(unsigned int **)(slot + 0x4) = a0;
        if (((Slot *)base)->f08 == 0) {
            func_02021b38(((Slot *)base)->f18);
            if (func_020211a4(1) == 0) {
                func_02023274(((Slot *)base)->f1c);
                func_02023f7c(((Slot *)base)->f20);
                func_02024430(((Slot *)base)->f24);
            }
            if (func_020211a4(2) == 0) {
                func_02026fd8(((Slot *)base)->f28);
                func_020285bc(((Slot *)base)->f2c);
            }
            func_0202a1cc(((Slot *)base)->f30);
        }
        for (;;) {
            if ((*a0 >> 24) == 0) return 0;
            if ((*a0 >> 24) == 0xf1) {
                *(int *)(slot + 0x14) = func_02021a3c(slot, a0);
                break;
            }
            a0++;
        }
        *(int *)(base + 0x8) += 1;
        return slot;
    }
}
