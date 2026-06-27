/* CAMPAIGN-PREP candidate for func_0202befc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign (not ternary) for base/size; keep two separate cmp #0 like asm; mul before 2nd cmp
 *   risk:       reshape-able (if-assign vs ternary + decl-order): asm does cmp;movgt/movle for base, then mul, then a SECOND cmp for size's movle. A ternary or merged compare collapses the two cmp r0,#0. Keep both ifs split and size init=0x124 with only the <=0 override.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202befc (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Conditional-select pair on sign of i=func_0202b0b4():
 *   base = i>0 ? 0x20c : 0 ;  size = i>0 ? 0x124 : 0x330 ;  off = i*0x124.
 * Then init->open(data)->post-task(size)->write(off+base)->copy(handle,size)->close->clean(handle,size).
 * r7=size (init 0x124), r6=base, r5=i*0x124, r4=task handle.
 */
extern int  Task_PostLocked(int a, int b, int c);
extern char data_020c6ab4[];
extern int  func_0202b0b4(void);
extern void func_02038ad4(void *strm, void *buf, int len);
extern void func_020928e8(void *addr, int len);
extern int  func_02097ea4(void *strm, int off, int sel);
extern void func_02097ff0(void *strm);
extern void func_02098038(void *strm, void *data);
extern void func_02098388(void *strm);

int func_0202befc(void) {
    unsigned char strm[0x48];
    int size;
    int base;
    int prod;
    int handle;
    int i;
    i = func_0202b0b4();
    size = 0x124;
    if (i > 0)
        base = 0x20c;
    else
        base = 0;
    prod = i * 0x124;
    if (i <= 0)
        size = 0x330;
    func_02098388(strm);
    func_02098038(strm, data_020c6ab4);
    handle = Task_PostLocked(size, 4, 0);
    func_02097ea4(strm, prod + base, 0);
    func_02038ad4(strm, (void *)handle, size);
    func_02097ff0(strm);
    func_020928e8((void *)handle, size);
    return handle;
}
