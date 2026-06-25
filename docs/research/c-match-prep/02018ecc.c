/* CAMPAIGN-PREP candidate for func_02018ecc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     key==0 branch; mul base off; indexed 1st load, ptr+4 2nd load
 *   risk:       permuter-class: orig keeps `mul` byte-offset in a reg and does `ldr [r4,r2]` indexed for field0 then `add r1,r4,r2; ldr [r1,#4]` for field1 — reg-alloc/addressing-mode coin-flip; C array indexing may instead form one base pointer.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02018ecc (main, class C) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: branch on key==0; mul (idx-1)*0x18 base; first field via indexed load, second via materialized ptr
 */
/* func_02018ecc: key=r0(->r7), pa=r1(->r6), pb=r2(->r5). w=GetSystemWork()(->r4).
 * If key==0: *pa = w[0x908]; *pb = w[0x90c]; return. Else: idx = func_02019210(key);
 * off = (idx-1)*0x18 (mul r2,r1,0x18). *pa = *(int*)(w+off)  (ldr [r4,r2] indexed);
 * *pb = *(int*)(w+off+4) (add r1,r4,r2; ldr [r1,#4]). The first load reuses the byte offset
 * indexed; the second materializes the pointer for the +4. Array form may bind the base early. */
extern char *GetSystemWork(void);
extern int func_02019210(int key);

void func_02018ecc(int key, int *pa, int *pb) {
    char *w = GetSystemWork();
    if (key == 0) {
        *pa = *(int *)(w + 0x908);
        *pb = *(int *)(w + 0x90c);
    } else {
        int idx = func_02019210(key);
        int off = (idx - 1) * 0x18;
        *pa = *(int *)(w + off);
        *pb = *(int *)(w + off + 4);
    }
}
