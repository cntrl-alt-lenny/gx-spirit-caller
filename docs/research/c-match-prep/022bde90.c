/* CAMPAIGN-PREP candidate for func_022bde90 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Fill32 zero-init 36B record at sp+4; (u16) key; mla *0x24 entry; unsigned range cc
 *   risk:       struct-guessed: record size (int rec[10]->frame 0x28, &rec[1] the 36B zeroed slot) and func_020059b0 arg order inferred from .s; r3 savelist is mwcc alignment padding. Confirm layout.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022bde90 (ov002, class D, MED tier).
 * Clone of func_022bdd54 / func_022bddf0 — same binary-search wrapper, stride 0x24
 * (36-byte record/entry), frame 0x28. UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D. Fill32(0,&rec[1],0x24) zero-inits the 36-byte stack record at sp+4;
 *           rec[0] (at sp) = comparator func ptr; (u16) key from _0202bcb0 zero-extends.
 *           search count arg = (u16)*count; range check re-reads full *count (cc=unsigned
 *           idx<count). Hit -> table + idx*0x24 (genuine mla, 0x24 not pow2). Else 0.
 *   risk:   struct-guessed: stack layout (sp+4 record, sp = comparator ptr) and the
 *           func_020059b0 arg roster are inferred from .s; int rec[10] must give the
 *           0x28 frame with &rec[1] the 36-byte zeroed region. r3-in-savelist is a
 *           frame-alignment artifact mwcc derives, not a source feature.
 */
extern void Fill32(int value, void *dst, int count);
extern char data_020c8e80[];   /* count */
extern char data_020c8e84[];   /* table base */
extern int func_020059b0(int key, void *base, int count, int stride);
extern int func_0202bcb0(int arg);
extern char func_ov002_022bdf20[];   /* comparator */

int func_ov002_022bde90(int arg) {
    int rec[10];
    int idx;
    Fill32(0, &rec[1], 0x24);
    *(unsigned short *)&rec[1] = (unsigned short)func_0202bcb0(arg);
    rec[0] = (int)func_ov002_022bdf20;
    idx = func_020059b0((int)&rec[1], data_020c8e84,
                        (unsigned short)*(int *)data_020c8e80, 0x24);
    if (idx < 0)
        return 0;
    if ((unsigned int)idx < (unsigned int)*(int *)data_020c8e80)
        return (int)(data_020c8e84 + idx * 0x24);
    return 0;
}
