/* CAMPAIGN-PREP candidate for func_0202b294 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order off-then-len; bind tbl once; inline i*2 index, no shared-base CSE
 *   risk:       struct-guessed: data_0219a93c[0]->+8 entry table and 8-byte stride / +4 off field are inferred from the asm strides; confirm against real struct. Index math i*2+1 / i*2+3 must fold to add r0,r1,r0,lsl#3.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202b294 (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Stream save: init -> open(name) -> write -> flush DC -> copy -> close.
 * data_0219a93c[0] is a struct ptr; [0][2] (=+8) is the base of an 8-byte-stride entry table
 * holding cumulative offsets at +4. r4=entry[i].off, r1=entry[i+1].off, len=r1-r4.
 */
extern int **data_0219a93c[];
extern unsigned char data_0219a948[];
extern char data_020c6a4c[];
extern int  func_0202b0b4(void);
extern void func_0202b12c(void *strm, char *name);
extern void func_02038ad4(void *strm, void *buf, int len);
extern void func_02092904(void *addr, int len);
extern int  func_02097ea4(void *strm, int off, int sel);
extern void func_02097ff0(void *strm);
extern void func_02098388(void *strm);

unsigned char *func_0202b294(void) {
    unsigned char strm[0x48];
    int *tbl;
    int off;
    int len;
    int i;
    i = func_0202b0b4();
    tbl = data_0219a93c[0][2];
    off = tbl[i * 2 + 1];
    len = tbl[i * 2 + 3] - off;
    func_02098388(strm);
    func_0202b12c(strm, data_020c6a4c);
    func_02097ea4(strm, off, 0);
    func_02092904(data_0219a948, 0x400);
    func_02038ad4(strm, data_0219a948, len);
    func_02097ff0(strm);
    return data_0219a948;
}
