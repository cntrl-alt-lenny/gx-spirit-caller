/* CAMPAIGN-PREP candidate for func_0202bf90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind tbl once; val=tbl[i], len=tbl[i+1]-val (4-byte stride, contiguous); decl val before len
 *   risk:       struct-guessed: tbl = data_0219a93c[0][0xb] models the +0x2c field deref (0x2c/4=0xb). asm reuses base via add r2,r1,r0,lsl#2 + ldr [r1,r0,lsl#2]; if mwcc forms one address it may CSE differently -- confirm +0x2c offset and 4-byte stride.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202bf90 (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Pointer-table lookup then stream copy.
 * p = data_0219a93c[0]->+0x2c (an int table). val = p[i]; off2 = p[i+1]; len = off2 - val.
 * init->open(data)->post-task(len)->write(val)->copy(handle,len)->close->clean(handle,len).
 * r4=val(then handle), r5=len.
 */
extern int  Task_PostLocked(int a, int b, int c);
extern int **data_0219a93c[];
extern char data_020c6ac8[];
extern int  func_0202b0b4(void);
extern void func_02038ad4(void *strm, void *buf, int len);
extern void func_020928e8(void *addr, int len);
extern int  func_02097ea4(void *strm, int off, int sel);
extern void func_02097ff0(void *strm);
extern void func_02098038(void *strm, void *data);
extern void func_02098388(void *strm);

int func_0202bf90(void) {
    unsigned char strm[0x48];
    int *tbl;
    int val;
    int len;
    int handle;
    int i;
    i = func_0202b0b4();
    tbl = data_0219a93c[0][0xb];
    val = tbl[i];
    len = tbl[i + 1] - val;
    func_02098388(strm);
    func_02098038(strm, data_020c6ac8);
    handle = Task_PostLocked(len, 4, 0);
    func_02097ea4(strm, val, 0);
    func_02038ad4(strm, (void *)handle, len);
    func_02097ff0(strm);
    func_020928e8((void *)handle, len);
    return handle;
}
