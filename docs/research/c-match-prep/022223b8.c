/* CAMPAIGN-PREP candidate for func_022223b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state-7c switch jump-table; eor cnt early; 1-(f2&1) side select; return-constants
 *   risk:       permuter-class: the early eor of ip^cnt is hoisted before the switch in orig (held in r0 across cases); mwcc may sink it into only case 2, dropping the dead eor in other arms. permuter-class.
 *   confidence: low
 */
// func_ov002_022223b8 — ov002, class D (jump-table dispatch + eor)
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent { u16 f0; u16 f2; };

extern u8 data_ov002_022ce288[];   // _LIT0 : state block (+0x5a8 state, +0x5ac counter)
extern u8 data_ov002_022cf16c[];   // _LIT1 : +0xcec word
extern u8 data_ov002_022d016c[];   // _LIT2
extern u8 data_ov002_022d0e6c[];   // _LIT3 : +0xb0 halfword
extern void func_ov002_021d7970(int,int,int);
extern void func_ov002_021e104c(int,int);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_0226af94(int,int);

int func_ov002_022223b8(struct Ent *e)
{
    int *st = (int *)data_ov002_022ce288;
    int state = st[0x5a8/4];
    int cnt   = st[0x5ac/4];
    int x = *(int *)(data_ov002_022cf16c + 0xcec) ^ cnt;
    switch (state - 0x7c) {
    default: return 0;                 // .L_110
    case 0:                            // .L_d4
        func_ov002_021e2b3c();
        func_ov002_021e104c((e->f2 & 1), 1);
        func_ov002_021e104c(1 - (e->f2 & 1), 1);
        func_ov002_021e2c5c();
        return 0;
    case 1: {                          // .L_b4
        int n = cnt + 1;
        st[0x5ac/4] = n;
        if (n < 2) return 0x7f;
        func_ov002_021e2c5c();
        return 0x7c;
    }
    case 2: {                          // .L_88
        int eq = ((1 - x) == ((e->f2 << 0x1f) >> 0x1f));
        u16 h = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        func_ov002_021d7970(eq ? 0 : 1, h, 0);
        return 0x7d;
    }
    case 3:                            // .L_74
        func_ov002_0226af94(e->f0, 1);
        return 0x7e;
    case 4: {                          // .L_44
        int *q = (int *)data_ov002_022d016c;
        if (q[0xc/4] != 0 && q[0x874/4] != 0) {
            st[0x5ac/4] = 0;
            func_ov002_021e2b3c();
            return 0x7f;
        }
        return 0;
    }
    }
}
