/* CAMPAIGN-PREP candidate for func_021cef38 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-insert via exact lsl/lsr chain; store-order kept (258,25c,254,2ac,26c,270).
 *   risk:       permuter-class: the field-insert reg dance (ip/lr juggling, lsr#0x13/lsl#0x13/lsr#0x17) is brittle — mwcc may fold the two :4 fields into one mask or reorder the two commits' register loads; store ordering itself is the easy part.
 *   confidence: low
 */
/* func_ov011_021cef38: write two adjacent 4-bit fields of a GPU control
 * word at +0x2a4 from the low nibble of arg (the value is placed into BOTH
 * the [12:9] and [8:5] field positions via the shift dance), run a commit
 * (021ce324), then publish x,y (<<12) scroll regs, set a 0x1000 size, clear
 * a 0x20000 enable bit, mirror x,y, and run a second commit (021ccf8c).
 *
 *   ip=arg<<0x1c; lr=[r3+0x2a4]; bic lr,#0x1e00; orr lr,lr,ip,lsr#0x13
 *   ip=lr<<0x13>>0x1c; bic lr,#0x1e0; orr ip,lr,(ip<<0x1c)>>0x17; str ip,[r3+0x2a4]
 *   021ce324(); r3=x<<0xc -> [+0x258]; r2=y<<0xc -> [+0x25c]; 0x1000->[+0x254];
 *   [+0x2ac]&=~0x20000; x<<0xc->[+0x26c]; y<<0xc->[+0x270]; 021ccf8c();
 */

typedef struct {
    char _pad254[0x254];
    unsigned int f_254;     /* +0x254 */
    unsigned int f_258;     /* +0x258 */
    unsigned int f_25c;     /* +0x25c */
    char _pad260[0xc];
    unsigned int f_26c;     /* +0x26c */
    unsigned int f_270;     /* +0x270 */
    char _pad274[0x30];
    unsigned int f_2a4;     /* +0x2a4 control word */
    char _pad2a8[0x4];
    unsigned int f_2ac;     /* +0x2ac enable word */
} S_ov011_d4000;

extern S_ov011_d4000 data_ov011_021d4000;
extern void func_ov011_021ccf8c(void);
extern void func_ov011_021ce324(void);

void func_ov011_021cef38(int n, int x, int y) {
    S_ov011_d4000 *g = &data_ov011_021d4000;
    unsigned int v;

    v = g->f_2a4;
    v &= ~0x1e00;
    v |= (unsigned int)(n << 0x1c) >> 0x13;
    v &= ~0x1e0;
    v |= ((v << 0x13) >> 0x1c << 0x1c) >> 0x17;
    g->f_2a4 = v;

    func_ov011_021ce324();

    g->f_258 = (unsigned int)x << 0xc;
    g->f_25c = (unsigned int)y << 0xc;
    g->f_254 = 0x1000;
    g->f_2ac &= ~0x20000;
    g->f_26c = (unsigned int)x << 0xc;
    g->f_270 = (unsigned int)y << 0xc;

    func_ov011_021ccf8c();
}
