/* CAMPAIGN-PREP candidate for func_021acd04 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D divmod: /150 smull magic via plain '/'; bitfield-insert low byte; abs via if-assign; branch tail
 *   risk:       permuter-class: the predicated `movlt ip,#0` clamp interleaves with the cmp 0x34/0xca range test; mwcc orders the two range branches and the clamp differently. Also old loaded once but reloaded post-store; bind/reload likely diverge.
 *   confidence: low
 */
/* func_ov008_021acd04 — map arg into [0x34,0xca] -> scaled value via /150
 * (smull magic 0x1b4e81b5, asr#4), insert as low byte of 021b2dc0.u16@+4,
 * then branch on |new-old| vs 8 to one of three sinks. */
extern unsigned char data_ov008_021b2c80[];/* u16@+0x5a */
extern unsigned char data_ov008_021b2dc0[];/* u16@+4 */
extern void func_ov008_021ac430(void);
extern void func_ov008_021ac4d0(int, int);

void func_ov008_021acd04(int a0) {
    unsigned old = (unsigned char)*(unsigned short *)(data_ov008_021b2dc0 + 4);
    int span = (int)*(unsigned short *)(data_ov008_021b2c80 + 0x5a) - 6;
    int val;
    unsigned nw;
    int d;
    if (a0 < 0x34 || a0 > 0xca) {
        val = (a0 < 0x34) ? 0 : span;
    } else {
        val = (a0 - 0x34) * span / 150;
    }
    *(unsigned short *)(data_ov008_021b2dc0 + 4) =
        (*(unsigned short *)(data_ov008_021b2dc0 + 4) & ~0xffu) | (val & 0xff);
    nw = (unsigned char)*(unsigned short *)(data_ov008_021b2dc0 + 4);
    if (nw == old) return;
    d = (int)nw - (int)old;
    if (d < 0) d = -d;
    if (d >= 8) { func_ov008_021ac430(); return; }
    if ((int)old < (int)nw) { func_ov008_021ac4d0(0, 1); return; }
    func_ov008_021ac4d0(nw - old, 0);
}
