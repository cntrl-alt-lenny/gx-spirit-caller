/* CAMPAIGN-PREP candidate for func_020602c4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     four asserts in order, signed-char delim, precompute len-1/base, copy loop test-at-top
 *   risk:       asm enters the loop via 'b .L_380' (test-first) and breaks on ch==delim AFTER the !=delim store-branch; if mwcc emits do/while or reorders the two exit tests it diverges. reshape-able by loop shape.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020602c4 (main, class C).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  four NN_ASSERT-style guards (msg,file,0,line) in order; first byte of key via signed char; precompute len-1 and base; copy loop with test-at-top (for)
 *   risk:    the ldrsb (signed char) reads and the loop's combined exit (i>=n-1 || ch==0 || ch==delim) order; assert line literals 0x10d..0x110
 *   confidence: med
 */
/* func_020602c4: NN_ASSERT(src), (key), (dst), (len>0); delim=(signed char)key[0];
 * base = func_020ab0c4(src,key); if 0 return 0; base += func_020aaddc(key);
 * copy base[i] into dst[i] for i<len-1 until a NUL or delim byte; NUL-terminate;
 * return 1. */

extern char *func_020ab0c4(void *src, void *key);
extern int   func_020aaddc(void *key);
extern void  func_020a6d54(void *msg, void *file, int z, int line);
extern unsigned char data_021012fc[];
extern unsigned char data_02101244[];
extern unsigned char data_02101254[];
extern unsigned char data_02101260[];
extern unsigned char data_0210130c[];

int func_020602c4(void *src, signed char *key, char *dst, int len) {
    char *base;
    signed char delim;
    int i;
    signed char ch;

    if (src == 0)  func_020a6d54(data_021012fc, data_02101244, 0, 0x10d);
    if (key == 0)  func_020a6d54(data_02101254, data_02101244, 0, 0x10e);
    if (dst == 0)  func_020a6d54(data_02101260, data_02101244, 0, 0x10f);
    if (len <= 0)  func_020a6d54(data_0210130c, data_02101244, 0, 0x110);

    delim = key[0];
    base = func_020ab0c4(src, key);
    if (base == 0) return 0;
    base += func_020aaddc(key);

    for (i = 0; i < len - 1; i++) {
        ch = base[i];
        if (ch == 0) break;
        if (ch == delim) break;
        dst[i] = ch;
    }
    dst[i] = 0;
    return 1;
}
