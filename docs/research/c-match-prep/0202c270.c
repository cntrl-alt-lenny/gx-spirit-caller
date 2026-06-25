/* CAMPAIGN-PREP candidate for func_0202c270 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind key once; reload data_0219a93c[1] per block (don't CSE the store base); temps sp+0x40/0x20/0x0
 *   risk:       reshape-able (decl-order of stack temps) / struct-guessed: temps occupy sp+0x40,+0x20,+0x0 -- declared high-addr-first so mwcc assigns those slots; if it reorders, slot offsets diverge. data_0219a93c[1] (=+4 field as int*) reloaded each block matches asm; confirm offset.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202c270 (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Guard then 3 identical build-then-store blocks.
 * func_0202c3c8(); if (arg < 0) return; key = data_020be77c[arg];
 * For k=0,1,2: func_02091554(&tmpk, fmt_k, key); dst = data_0219a93c[1]; dst[k] = func_02006c0c(&tmpk,4,0);
 * data_0219a93c reloaded each block (separate reads). Distinct stack temps tmp0/1/2.
 */
extern char  data_020be77c[];
extern char  data_020c6b1c[];
extern char  data_020c6b30[];
extern char  data_020c6b44[];
extern int  *data_0219a93c[];
extern int   func_02006c0c(void *a, int b, int c);
extern void  func_0202c3c8(void);
extern void  func_02091554(void *dst, char *fmt, int key);

void func_0202c270(int arg) {
    unsigned char tmp2[0x20];
    unsigned char tmp1[0x20];
    unsigned char tmp0[0x20];
    int key;
    func_0202c3c8();
    if (arg < 0)
        return;
    key = ((int *)data_020be77c)[arg];
    func_02091554(tmp2, data_020c6b1c, key);
    data_0219a93c[1][0] = func_02006c0c(tmp2, 4, 0);
    func_02091554(tmp1, data_020c6b30, key);
    data_0219a93c[1][1] = func_02006c0c(tmp1, 4, 0);
    func_02091554(tmp0, data_020c6b44, key);
    data_0219a93c[1][2] = func_02006c0c(tmp0, 4, 0);
}
