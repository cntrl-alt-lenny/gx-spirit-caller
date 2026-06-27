/* CAMPAIGN-PREP candidate for func_021f9190 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch-on-state via ce288+0x5b4; bit0 + 5-bit field from self+2; bind prod (r5) across 2 calls
 *   risk:       in state 1 orig binds prod=h*1000 in r5 and reuses it for BOTH 021df780 and as 021d90c0's r2 arg; the d90c0 args (player from a re-loaded self+2, a 5-bit field, prod) need r5 held while self+2 is re-read - a reg-alloc/decl-order coin-flip on which of player/field/prod owns which scratch reg. permuter-class on the state-1 arg shuffle; struct-guessed on f5 width
 *   confidence: low
 */
/* func_ov002_021f9190: 2-state step machine keyed on the int at ce288+0x5b4.
 * self=arg0 (r4). State 0: read self+2 bit0 (player), self+0 (u16), call
 * 0226b298(player, full16, 0), bump the state counter, return 0. State 1:
 * post (d0e6c+0xb0)*1000 via 021df780(player,prod), then 021d90c0 with
 * player + a 5-bit field (self+2 lsl#26;lsr#27 = bits5..9), return 1.
 * else return 0. */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_0226b298(int player, int a, int b);
extern void func_ov002_021df780(int a, int b);
extern void func_ov002_021d90c0(int a, int b, int c, int d);

struct Ov002Step { u16 f0; u16 b0 : 1; u16 : 4; u16 f5 : 5; };

int func_ov002_021f9190(void *self) {
    int *st = (int *)(data_ov002_022ce288 + 0x5b4);
    struct Ov002Step *s = (struct Ov002Step *)self;
    if (*st == 0) {
        func_ov002_0226b298(s->b0, s->f0, 0);
        *st = *st + 1;
        return 0;
    }
    if (*st == 1) {
        int prod = *(u16 *)(data_ov002_022d0e6c + 0xb0) * 1000;
        func_ov002_021df780(s->b0, prod);
        func_ov002_021d90c0(s->b0, s->f5, prod, 0);
        return 1;
    }
    return 0;
}
