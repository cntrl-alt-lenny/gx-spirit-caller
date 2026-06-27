/* CAMPAIGN-PREP candidate for func_022bdd54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Fill32 zero-init; (u16) key+count zero-extends; lsl#3 idx scale = +idx*8; unsigned range cmp (cc).
 *   risk:       struct-guessed: stack layout (sp+4 record, sp = comparator ptr) and the func_020059b0 arg roster are inferred from the .s; Fill32(0,&rec[1],8) must place the record at sp+4 with the pool word at sp. The unsigned `cmp r0,r1; cc` range check maps to (unsigned)idx < count.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022bdd54 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Zero-init an 8-byte stack record via Fill32, fill
 * [sp+4] with (u16)_0202bcb0(arg), set [sp]=&_022bdde0, then binary-search
 * func_020059b0(key=&rec, table=data_020c7b44, count=*data_020c7b40, stride=8). On hit
 * in range returns &table[idx*8] (lsl#3 index scale); else 0. */
extern void Fill32(int value, void *dst, int count);
extern char data_020c7b40[];
extern char data_020c7b44[];
extern int func_020059b0(int value, void *base, int key, int count);
extern int func_0202bcb0(int arg);
extern char func_ov002_022bdde0[];

int func_ov002_022bdd54(int arg) {
    int rec[2];
    int n;
    int idx;
    Fill32(0, &rec[1], 8);
    *(unsigned short *)&rec[1] = (unsigned short)func_0202bcb0(arg);
    rec[0] = (int)func_ov002_022bdde0;
    n = *(int *)data_020c7b40;
    idx = func_020059b0((int)&rec[1], data_020c7b44, (unsigned short)n, 8);
    if (idx < 0)
        return 0;
    if ((unsigned int)idx < (unsigned int)*(int *)data_020c7b40)
        return (int)(data_020c7b44 + idx * 8);
    return 0;
}
