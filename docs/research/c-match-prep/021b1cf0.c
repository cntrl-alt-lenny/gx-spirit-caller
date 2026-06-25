/* CAMPAIGN-PREP candidate for func_021b1cf0 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-AND value (1/0); asymmetric signed shift-extract; dual-cmov ternary
 *   risk:       remove the stray cd744_unused extern; e built via branches not cmov may shift order; the asr-fold into add must hold
 *   confidence: med
 */
/* func_ov002_021b1cf0: e = (d016c.f3340!=0 && cd744[d016c.f3308]==2) ? 1 : 0;
 * then r = e + signed-extract<bits18:15>(cd968.f768<<13>>28); return r>0 ? 1:0.
 * The 13/28 shifts are ASYMMETRIC (mwcc won't fold) and asr => signed. */

extern char data_ov002_022cd744_unused[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022cd968[];
extern char data_ov002_022d016c[];

int func_ov002_021b1cf0(void) {
    int e;
    int t;
    int r;

    if (*(int *)(data_ov002_022d016c + 0xd0c) != 0 &&
        data_ov002_022cd744[*(int *)(data_ov002_022d016c + 0xcec)] == 2) {
        e = 1;
    } else {
        e = 0;
    }

    t = *(int *)(data_ov002_022cd968 + 0x300);
    r = e + ((t << 13) >> 28);
    return r > 0 ? 1 : 0;
}
