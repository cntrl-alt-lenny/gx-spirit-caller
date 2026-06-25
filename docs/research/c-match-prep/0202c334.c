/* CAMPAIGN-PREP candidate for func_0202c334 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind key once; two temps sp+0x20/+0x0 (declare high-first); reload store base each block
 *   risk:       reshape-able (decl-order) / struct-guessed: tmp1@sp+0x20, tmp0@sp+0x0 -- declaration order sets which local gets +0x20; swap if slots invert. data_0219a93c[1] store base reloaded per block (asm ldr _LIT2 twice); confirm +4 field offset.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202c334 (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Simpler sibling of func_0202c270: 2 build-then-store blocks.
 * func_0202c3c8(); if (arg < 0) return; key = data_020be77c[arg];
 * blockA: func_02091554(&tmp1, data_020c6b1c, key); data_0219a93c[1][0] = func_02006c0c(&tmp1,4,0);
 * blockB: func_02091554(&tmp0, data_020c6b30, key); data_0219a93c[1][1] = func_02006c0c(&tmp0,4,0);
 * Two stack temps at sp+0x20 and sp+0x0; data_0219a93c reloaded each block.
 */
extern char  data_020be77c[];
extern char  data_020c6b1c[];
extern char  data_020c6b30[];
extern int  *data_0219a93c[];
extern int   func_02006c0c(void *a, int b, int c);
extern void  func_0202c3c8(void);
extern void  func_02091554(void *dst, char *fmt, int key);

void func_0202c334(int arg) {
    unsigned char tmp1[0x20];
    unsigned char tmp0[0x20];
    int key;
    func_0202c3c8();
    if (arg < 0)
        return;
    key = ((int *)data_020be77c)[arg];
    func_02091554(tmp1, data_020c6b1c, key);
    data_0219a93c[1][0] = func_02006c0c(tmp1, 4, 0);
    func_02091554(tmp0, data_020c6b30, key);
    data_0219a93c[1][1] = func_02006c0c(tmp0, 4, 0);
}
