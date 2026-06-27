/* CAMPAIGN-PREP candidate for func_022203e4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain on state global; (1-bit0) via :1 read + rsb; store-order N/A
 *   risk:       permuter-class: .L_fc arm truncated in the .s, so the 0x7e tail body and its return are reconstructed/incomplete — campaign must fill from full disasm.
 *   confidence: low
 */
/* func_ov002_022203e4 (ov002, D) — discriminant dispatch on global state @+0x5a8.
 * Guard: bit2 of card->f4 set -> return 0 (the lsl#0x1d;lsr#0x1f = :1 at bit2).
 * Then switch on state (0x7e/0x7f/0x80) running short helper chains. card has
 * u16 fields at +0(f0),+2(f2),+4(f4). f2 bit0 = (f2<<0x1f>>0x1f), inverted via
 * rsb #1 -> (1 - bit0). Tail .L_fc body is truncated in the .s; modelled from
 * the visible head + the 0x7e/0x7f arms. */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; };
extern char data_ov002_022ce288[];        /* state block; state id at +0x5a8 */
extern char data_ov002_022cf16c[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021b99b4(int a, int b);
extern int  func_ov002_021bc618(int a);
extern int  func_ov002_021ca2b8(int a);
extern int  func_ov002_0225368c(int a, int b, int c);
extern int  func_ov002_0226b094(int a, int b);
extern int  func_ov002_0226b174(int a, int b, int c);
extern int  func_ov002_0227adb8(void);
extern char data_ov002_022cf1a4[];

int func_ov002_022203e4(struct Card *c) {
    int state;
    int inv;
    if (((c->f4 << 0x1d) >> 0x1f) & 1)   /* bit2 set */
        return 0;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x80) {
        inv = 1 - (c->f2 & 1);
        if (!func_ov002_0225368c(inv, c->f0, 0)) return 0;
        if (!func_ov002_021bc618(1 - (c->f2 & 1))) return 0;
        if (!func_ov002_021ca2b8(1 - (c->f2 & 1))) return 0;
        func_ov002_0226b094(1 - (c->f2 & 1), c->f0);
        return 0x7f;
    }
    if (state == 0x7f) {
        if (*(u16 *)(data_ov002_022cf16c + 0xb0) == 0) return 0;
        func_ov002_0226b174(1 - (c->f2 & 1), c->f0, 0);
        return 0x7e;
    }
    if (state == 0x7e) {
        int k = 1 - (c->f2 & 1);
        func_ov002_021b99b4(k, *(u16 *)(data_ov002_022cf16c + 0xb0));
        /* .L_fc tail truncated in source .s — campaign to complete */
    }
    return 0;
}
