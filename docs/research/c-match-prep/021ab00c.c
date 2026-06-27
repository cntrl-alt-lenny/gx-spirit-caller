/* CAMPAIGN-PREP candidate for func_021ab00c (ov005, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     size CSE; ascending field stores; do-while count loop; magic-byte 0x54 reuse
 *   risk:       orig `add r0,r1,#1` increments the 2nd-arg reg (count) not the call result, and fuses p[1]/p[2] as `stmib`; mwcc emits add-on-r0 + two str. permuter-class.
 *   confidence: low
 */
/* func_ov005_021ab00c: allocate a (count+1)*0x1c+0xc task record, Fill32 it,
 * tag magic "ITTM", store count/size, bind via 021aafac, zero the header
 * fields (with f0x1c=-1), then build `count` 0x1c-entries each {idx,0,
 * scale(idx,count)+1,0,0,0,0}. Returns the record. */
extern int  Task_PostLocked(int, int, int);
extern void Fill32(int, void *, int);
extern void func_ov005_021aafac(void *, void *);
extern int  func_020b3870(int, int);

int *func_ov005_021ab00c(void *ctx, int count) {
    int size = (count + 1) * 0x1c + 0xc;
    int *p = (int *)Task_PostLocked(size, 4, 0);
    if (p == 0) return p;
    Fill32(0, p, size);
    *(char *)p = 0x49;
    *((char *)p + 1) = 0x54;
    *((char *)p + 2) = 0x54;
    *((char *)p + 3) = 0x4d;
    p[1] = count;
    p[2] = size;
    func_ov005_021aafac(ctx, p);
    p[3] = 0;
    p[4] = 0;
    p[5] = 0;
    p[6] = count;
    p[7] = -1;
    p[8] = 0;
    p[9] = 0;
    if (count >= 1) {
        int *e = p + 10;
        int i = 1;
        do {
            e[0] = i;
            e[1] = 0;
            e[2] = func_020b3870(i, count) + 1;
            e[3] = 0;
            e[4] = 0;
            e[5] = 0;
            e[6] = 0;
            i++;
            e = (int *)((char *)e + 0x1c);
        } while (i <= count);
    }
    return p;
}
