/* CAMPAIGN-PREP candidate for func_02006b4c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r7/r6/r5 = a0/a1/a2 decl-order; idx in r4 callee-saved; :3 low-bits via lsl#0x1d;lsr#0x1d
 *   risk:       struct-guessed + permuter-class: the data_020c3e68/3e6c/2104f4c layout (which pool word holds what; the +8 second-ptr indirection) is inferred from offsets only — confirm against real globals. Even if structs are right, the r6 dual-role (a1 then aliased to a2) and the merged `r==0 && idx!=-1` guard reorder are classic reg-alloc coin-flips.
 *   confidence: low
 */
/* func_02006b4c: guard chain + bitfield-indexed table byte-store + two
 * conditional byte stores; heavy callee-saved reg-alloc (r4..r7).
 *
 *   r7=a0; r6=a1; r5=a2
 *   idx = func_02007104(*data_020c3e68, a1)      ; r3=[d020c3e68]; r0=a1
 *   r4 = idx
 *   if (idx != -1) {
 *     func_020aadf8(a2, a1)
 *     k = (*(u32*)(data_020c3e6c+4) << 0x1d) >> 0x1d   ; low3 bits
 *     b = *(s8*)data_02104f4c[k]                        ; ptr table -> s8
 *     a2[idx] = b
 *     r6 = a2   ; (note: r6 reused = a2 here)
 *   }
 *   func_02098388(a0)
 *   r = func_02098038(a0, r6)
 *   if (r==0 && idx!=-1) {
 *     b2 = *(s8*)(*(void**)(data_020c3e68+8))
 *     a2[idx] = b2
 *     r = func_02098038(a0, r6)
 *   }
 *   if (r==0) r6 = 0
 *   return r6
 */

extern void   *data_020c3e68;       /* +0x0 ptr arg; +0x8 ptr-to-s8 */
extern int     data_020c3e6c;       /* +0x4 holds discriminant word */
extern signed char *data_02104f4c[];/* table of s8 pointers */
extern int  func_02007104(void *a, void *b);
extern void func_020aadf8(void *a, void *b);
extern void func_02098388(void *a);
extern int  func_02098038(void *a, void *b);

int func_02006b4c(void *a0, void *a1, char *a2) {
    int idx;
    int r;
    void *ret = a1;
    idx = func_02007104(*(void **)&data_020c3e68, a1);
    if (idx != -1) {
        unsigned int k;
        func_020aadf8(a2, a1);
        k = ((unsigned int)*(&data_020c3e6c + 1) << 0x1d) >> 0x1d;
        a2[idx] = *data_02104f4c[k];
        ret = a2;
    }
    func_02098388(a0);
    r = func_02098038(a0, ret);
    if (r == 0 && idx != -1) {
        a2[idx] = *(signed char *)(*(void **)((char *)&data_020c3e68 + 8));
        r = func_02098038(a0, ret);
    }
    if (r == 0) ret = 0;
    return (int)ret;
}
