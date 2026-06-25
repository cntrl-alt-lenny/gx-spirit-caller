/* CAMPAIGN-PREP candidate for func_02018be8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Fill32 clear; low16=0xffff RMW loop; 14 ordered field stores
 *   risk:       reshape-able: 14 RMW stores must keep asm order (store-order); the constant folds (0x50000-0x60000 mask, 0x178-1 reuse of r2) and second GetSystemWork base must not be CSE'd with the first — split as written.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02018be8 (main, class C/D) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: Fill32 clear; loop sets low-16 of [i].f0c to 0xffff (and high<<orr lsr#16); 14 RMW field stores in order
 */
/* func_02018be8: w = GetSystemWork(); Fill32(0, w, 0x92c). For 0x56 entries (stride 0x18)
 * w[i].field0c = (field0c & 0xffff0000) | 0xffff  (and r0=-0x10000; orr r0,lsr#16). Then a long
 * block of fixed RMW stores to w+0x908.. in EXACT order (store-order sensitive). Reads
 * GetSystemWork() AGAIN near the end (separate base) to clear bit0x1000 of [0x8f8]. Then
 * three func_0201aabc(0x75/0x76/0x77) tail calls. */
extern char *GetSystemWork(void);
extern void Fill32(int val, void *dst, int size);
extern void func_0201aabc(int id);

void func_02018be8(void) {
    char *w = GetSystemWork();
    char *p;
    int i;
    Fill32(0, w, 0x92c);
    p = w;
    for (i = 0; i < 0x56; i++) {
        *(unsigned int *)(p + 0xc) = (*(unsigned int *)(p + 0xc) & 0xffff0000) | 0xffff;
        p += 0x18;
    }
    *(int *)(w + 0x908) = 0x50000;
    *(int *)(w + 0x90c) = 0x50000 + 0xee000;
    *(int *)(w + 0x8d4) = (*(int *)(w + 0x8d4) & (0x50000 - 0x60000)) | 1;
    *(int *)(w + 0x8d0) = (*(int *)(w + 0x8d0) & ~0xf) | 2;
    *(int *)(w + 0x91c) = 1;
    *(int *)(w + 0x920) = 1;
    *(int *)(w + 0x924) = 1;
    *(int *)(w + 0x928) = 0;
    *(int *)(w + 0x8d8) = (*(int *)(w + 0x8d8) & ~1) | 1;
    *(int *)(w + 0x900) = (((*(int *)(w + 0x900) | 0x800) & ~0x600) | 0x600);
    *(int *)(w + 0x8f4) = 0x178 - 1;
    {
        char *w2 = GetSystemWork();
        *(int *)(w2 + 0x8f8) = *(int *)(w2 + 0x8f8) & ~0x1000;
    }
    func_0201aabc(0x75);
    func_0201aabc(0x76);
    func_0201aabc(0x77);
}
