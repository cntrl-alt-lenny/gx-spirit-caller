/* CAMPAIGN-PREP candidate for func_02223e2c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state if-chain; eor x=word^cnt early; (a>b)?1:0 movhi/movls; v==6?const:v*0x1f4 cond-mov
 *   risk:       permuter-class: the cmp-derived hi uses movhi/movls (set both 1/0) then rsb — if mwcc emits a branch instead the select diverges; the e+(x<<1) base index store-order is also reg-alloc sensitive. permuter-class.
 *   confidence: low
 */
// func_ov002_02223e2c — ov002, class D (eor/cmp + index store + cond-mov select)
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent { u16 f0; u16 f2; /*...*/ u16 f8; u16 fa; };

extern u8 data_ov002_022ce288[];   // _LIT0 (+0x5a8 state, +0x5ac counter)
extern u8 data_ov002_022d016c[];   // _LIT1 (+0xcec word)
extern u8 data_ov002_022d0e6c[];   // _LIT2 (+0xb0 halfword)
extern void func_ov002_021df818(int,int,int);
extern void func_ov002_0226b258(int,int,int);

int func_ov002_02223e2c(struct Ent *e)
{
    int *st = (int *)data_ov002_022ce288;
    int state = st[0x5a8/4];
    int cnt   = st[0x5ac/4];
    int x = *(int *)(data_ov002_022d016c + 0xcec) ^ cnt;
    if (state == 0x7e) {                       // .L_6c
        u8 *p = (u8 *)e + (x << 1);
        *(u16 *)(p + 8) = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        int n = st[0x5ac/4] + 1;
        st[0x5ac/4] = n;
        if (n < 2) return 0x7f;
        u16 a = *(u16 *)((u8 *)e + 8);
        u16 b = *(u16 *)((u8 *)e + 0xa);
        if (a == b) return 0x80;
        int hi = (a > b) ? 1 : 0;
        int sel = 1 - hi;
        u16 v = *(u16 *)((u8 *)e + (sel << 1) + 8);
        int r2;
        if (v == 6) r2 = 0x1770;
        else        r2 = v * 0x1f4;
        func_ov002_021df818((int)e, sel, r2);
        return 0;
    }
    if (state == 0x7f) {                       // .L_44
        u16 f2 = e->f2;
        int r1;
        if (x == ((f2 << 0x1f) >> 0x1f)) r1 = (f2 << 0x1a) >> 0x1b;
        else                             r1 = -1;
        func_ov002_0226b258(x, r1, 0);
        return 0x7e;
    }
    if (state == 0x80) {                       // fallthrough mov r0,#0 then str
        st[0x5ac/4] = 0;
        return 0x7f;
    }
    return 0;                                   // .L_d8
}
