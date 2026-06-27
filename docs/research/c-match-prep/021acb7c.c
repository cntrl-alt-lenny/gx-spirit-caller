/* CAMPAIGN-PREP candidate for func_021acb7c (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: stacked-arg marshalling, tst+movne/moveq as ?: , >>4&1 sel bit
 *   risk:       struct-guessed AND truncated: supplied asm is cut at 392B mid-function (no tail/pool); arg order to 021ab484 (sp slots vs r0-r3) and data_021040ac/021b2780 +0x634 owner are inferred. Cannot be byte-exact as given.
 *   confidence: low
 */
/* func_ov008_021acb7c — OAM/sprite param marshalling: repeated calls to
 * func_ov008_021ab484 with 5 stacked args (sp..sp+0xc). NOTE: the supplied
 * asm is TRUNCATED at size 392 (array stops mid-third-call, before the
 * [sp,#0xc] store, the bl, the tail, and the literal pool). This C covers
 * only the visible portion; the tail is reconstructed by pattern. */
extern unsigned char data_021040ac[];      /* int@+0x38; int@+0x634 flags */
extern unsigned char data_ov008_021b2780[];/* int@+0x634 flags word */
extern unsigned char data_ov008_021b2c80[];/* u16@+0x5a */
extern unsigned char data_ov008_021b2dc0[];/* u16@+4 */
extern void func_ov008_021ab484(int, int, int, int, int, int, int, int, int);
extern void func_ov008_021ac7f0(void);

void func_ov008_021acb7c(void) {
    int sel = (*(int *)(data_021040ac + 0x38) >> 4) & 1;
    unsigned char b;
    unsigned hw;
    func_ov008_021ac7f0();
    b = (unsigned char)*(unsigned short *)(data_ov008_021b2dc0 + 4);
    if (b != 0)
        func_ov008_021ab484(1 - sel, 0x3e, 0, 0, 0x1f, 2, 0x400, 0, 0);
    hw = *(unsigned short *)(data_ov008_021b2c80 + 0x5a);
    if (hw > 6 && (int)(hw - 6) > (unsigned char)*(unsigned short *)(data_ov008_021b2dc0 + 4))
        func_ov008_021ab484(sel + 0xef, 0x3e, 0, 0, 0x20, 2, 0x400, 0, 0);
    {
        int flags = *(int *)(data_ov008_021b2780 + 0x634);
        func_ov008_021ab484(0x2e, 0xa4, 0, 0, (flags & 4) ? 3 : 2, 2, 0x400, 0, 0);
    }
    {
        int flags = *(int *)(data_ov008_021b2780 + 0x634);
        func_ov008_021ab484(0, 0, 0, 0, (flags & 8) ? 5 : 4, 2, 0x400, 0, 0);
    }
}
