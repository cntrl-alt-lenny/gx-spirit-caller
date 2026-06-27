/* CAMPAIGN-PREP candidate for func_021ba11c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: mul-index base, descending shift-up loop, count RMW, re-read after loop
 *   risk:       orig binds list base in r8 and runs dst=&list[i] as a -4 induction pointer while src=&list[i-1] is recomputed; if mwcc strength-reduces the wrong operand or holds both the two add/ldr forms diverge (permuter-class).
 *   confidence: med
 */
/* func_ov002_021ba11c: front-insert into player (arg0&1)'s 0x260-list
 * (base cf16c + idx + 0x260, count at cf17c[idx]). Shift list[count..1] up
 * by one, bump the count, then copy *src into list[0] via func_ov002_021b91c4.
 * Sibling of the back-append func_ov002_021ba1a0.c / compaction 021ba38c.s. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf17c[];
extern void func_ov002_021b91c4(int *dst, const int *src);

void func_ov002_021ba11c(int player, int *src) {
    int idx = (player & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf17c + idx);
    int *list;
    int i;
    if (count > 0) {
        list = (int *)((char *)data_ov002_022cf16c + idx + 0x260);
        for (i = count; i > 0; i--)
            func_ov002_021b91c4(&list[i], &list[i - 1]);
    }
    *(int *)((char *)data_ov002_022cf17c + idx) =
        *(int *)((char *)data_ov002_022cf17c + idx) + 1;
    func_ov002_021b91c4((int *)((char *)data_ov002_022cf16c + idx + 0x260), src);
}
