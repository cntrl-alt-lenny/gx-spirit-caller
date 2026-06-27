/* CAMPAIGN-PREP candidate for func_022bddf0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Fill32 zero-init record at sp+4; (u16) key; mla *0x18 entry; unsigned range cc
 *   risk:       struct-guessed: stack record size (int rec[7]->frame 0x1c, &rec[1] is the 24B zeroed slot, rec[0]=comparator at sp) and func_020059b0 arg order inferred from .s; confirm both.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022bddf0 (ov002, class D, MED tier).
 * Clone of the brief-496 sibling func_022bdd54 — same binary-search wrapper, but
 * stride 0x18 (24-byte record/entry) instead of 8. UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D. Fill32(0,&rec[1],0x18) zero-inits the 24-byte stack record at sp+4;
 *           rec[0] (at sp) = comparator func ptr; (u16) key from _0202bcb0 zero-extends.
 *           search count arg = (u16)*count; range check re-reads full *count (cc=unsigned
 *           idx<count). Hit -> table + idx*0x18 (genuine mla, 0x18 not pow2). Else 0.
 *   risk:   struct-guessed: stack layout (sp+4 record, sp = comparator ptr) and the
 *           func_020059b0 arg roster (key,table,count16,stride) are inferred from .s;
 *           int rec[7] must give sizeof 0x1c frame with &rec[1] the 24-byte zeroed region.
 */
extern void Fill32(int value, void *dst, int count);
extern char data_020c9690[];   /* count */
extern char data_020c9694[];   /* table base */
extern int func_020059b0(int key, void *base, int count, int stride);
extern int func_0202bcb0(int arg);
extern char func_ov002_022bde80[];   /* comparator */

int func_ov002_022bddf0(int arg) {
    int rec[7];
    int idx;
    Fill32(0, &rec[1], 0x18);
    *(unsigned short *)&rec[1] = (unsigned short)func_0202bcb0(arg);
    rec[0] = (int)func_ov002_022bde80;
    idx = func_020059b0((int)&rec[1], data_020c9694,
                        (unsigned short)*(int *)data_020c9690, 0x18);
    if (idx < 0)
        return 0;
    if ((unsigned int)idx < (unsigned int)*(int *)data_020c9690)
        return (int)(data_020c9694 + idx * 0x18);
    return 0;
}
