/* CAMPAIGN-PREP candidate for func_021ba230 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: mul-index base, subs-bpl descending do/while, induction dst + call-result src
 *   risk:       orig holds list(r4) & dst=&list[i] (r6, -4 induction) callee-saved across both bl calls and reloads the src index from r0; signature assumes arg1 unused. If 021b91d0 is really an int-swap the &list[] arg types must stay int* (struct-guessed / reshape-able).
 *   confidence: med
 */
/* func_ov002_021ba230: in-place shuffle of player (arg0&1)'s 0x260-list
 * (base cf16c + idx + 0x260, count at cf17c[idx]). For i = count-1 down to 0,
 * swap list[i] with list[func_ov002_021b00d0(i+1)] via func_ov002_021b91d0.
 * arg1 is unused by the orig. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf17c[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021b91d0(int *a, int *b);

void func_ov002_021ba230(int player) {
    int idx = (player & 1) * 0x868;
    int i = *(int *)((char *)data_ov002_022cf17c + idx) - 1;
    int *list;
    if (i < 0)
        return;
    list = (int *)((char *)data_ov002_022cf16c + idx + 0x260);
    do {
        func_ov002_021b91d0(&list[i], &list[func_ov002_021b00d0(i + 1)]);
        i--;
    } while (i >= 0);
}
