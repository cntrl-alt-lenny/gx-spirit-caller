/* CAMPAIGN-PREP candidate for func_022237f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state-7c switch; :1/:5 bitfield extracts; indexed word table; flag store
 *   risk:       struct-guessed: batch asm is TRUNCATED inside case .L_bc (state-2, the +0xb2 halfword + mul-stride table arm), left as placeholder; full body required. Bitfield offsets inferred. struct-guessed.
 *   confidence: low
 */
// func_ov002_022237f0 — ov002, class D (jump-table state machine, store-order) — PARTIAL asm
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent { u16 f0; u16 f2; };

extern u8 data_ov002_022cd744[];   // _LIT2 (+0xd44)
extern u8 data_ov002_022ce288[];   // _LIT0 (+0x5a8 state)
extern u8 data_ov002_022cf16c[];   // _LIT1 indexed word table
extern u8 data_ov002_022cf180[];   // _LIT6
extern u8 data_ov002_022d016c[];   // _LIT5
extern u8 data_ov002_022d0e6c[];   // _LIT3 (+0xb2 halfword) / _LIT4 stride
extern void func_ov002_021ae664(int);
extern int  func_ov002_021b00d0(int);
extern void func_ov002_021d8128(void);
extern void func_ov002_021e13f4(void);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_02257b48(void);
extern void func_ov002_0226b22c(int,int,int,int);

int func_ov002_022237f0(struct Ent *e)
{
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state - 0x7c) {
    default: return 0;                          // .L_158
    case 0: {                                   // .L_84
        u16 f2 = e->f2;
        int b0 = (f2 << 0x1f) >> 0x1f;
        int b5 = (f2 << 0x1a) >> 0x1b;
        int d = *(int *)(data_ov002_022cd744 + 0xd44);
        func_ov002_0226b22c(b0, b5, d, 1);
        return 0x7e;
    }
    case 1:                                     // .L_b0
        func_ov002_021e2b3c();
        return 0x7d;
    case 2:                                      // .L_bc (asm truncated in batch)
        return 0x7c;   // body truncated — placeholder
    case 4: {                                    // .L_34
        if (func_ov002_02257b48() == 0) return 0;
        int idx = (e->f2 << 0x1f) >> 0x1f;
        int v = ((int *)data_ov002_022cf16c)[idx];
        if (v == 1) {
            int r = func_ov002_021b00d0(2);
            *(int *)(data_ov002_022cd744 + 0xd44) = r;
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    }
    }
}
