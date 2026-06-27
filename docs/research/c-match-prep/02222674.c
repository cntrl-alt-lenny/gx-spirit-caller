/* CAMPAIGN-PREP candidate for func_02222674 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state-7d switch; :5 and :1 bitfield extracts; indexed word table; flag store
 *   risk:       struct-guessed: batch asm is TRUNCATED at .L_ec (cases 2/3 bodies missing) so those arms are placeholders; full body needed to match. Also bitfield struct offsets inferred. struct-guessed.
 *   confidence: low
 */
// func_ov002_02222674 — ov002, class D (jump-table + bitfield extracts) — PARTIAL asm in batch
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent { u16 f0; u16 f2; };

extern u8 data_ov002_022cd744[];   // _LIT3 (+0xd44 flag)
extern u8 data_ov002_022ce288[];   // _LIT0 (+0x5a8 state)
extern u8 data_ov002_022d016c[];   // _LIT2 (indexed word table)
extern u8 data_ov002_022d0e6c[];   // _LIT1 (+0xb0 halfword)
extern void func_ov002_021ae484(int);
extern int  func_ov002_021af9d0(void);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021bc618(int);
extern int  func_ov002_021ca2b8(int);
extern int  func_ov002_0225368c(int,int,int);
extern void func_ov002_0226b258(int,int,int);
extern int  func_ov002_0227adb8(void);

int func_ov002_02222674(struct Ent *e)
{
    int *st = (int *)data_ov002_022ce288;
    int state = st[0x5a8/4];
    switch (state - 0x7d) {
    default: return 0;                       // .L_150
    case 0: {                                // .L_30
        int side = e->f2 & 1;
        if (func_ov002_021ca2b8(side) == 0) return 0;
        if (func_ov002_021bc618(side) == 0) return 0;
        u16 f = e->f2;
        int a = (f << 0x1a) >> 0x1b;         // :5 bitfield bits5..1
        int b = (f << 0x1f) >> 0x1f;         // bit0
        func_ov002_0226b258(b, a, 0);
        return 0x7f;
    }
    case 1: {                                // .L_88
        int side = (e->f2 << 0x1f) >> 0x1f;
        u16 h = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        if (func_ov002_0225368c(side, e->f0, h) == 0) return 0;
        int idx = (e->f2 << 0x1f) >> 0x1f;
        int v = ((int *)data_ov002_022d016c)[idx];
        if (v == 1) {
            *(int *)(data_ov002_022cd744 + 0xd44) = 1;
        } else {
            func_ov002_021ae484(0x2f);
        }
        return 0x7e;
    }
    case 2: {                                // .L_ec  (asm truncated in batch)
        if (*(int *)(data_ov002_022cd744 + 0xd44) == 0) return 0;
        u16 h = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        (void)h; (void)e;
        return 0x7d;   // body truncated — placeholder return
    }
    case 3:                                  // .L_128 (not shown)
        return 0x7c;
    }
}
