/* CAMPAIGN-PREP candidate for func_0221da74 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b0:1 bitfield; (h6>>8)==1 asymmetric; packed 021b947c decode; mla base + slot*4 offset
 *   risk:       reshape-able-or-permuter: redundant slot computations must collapse to one ((unsigned)v>>16); orig keeps a(r4)/slot(r5)/b0 live across 021c33e4 + the address build (mla then add#0x18,#0x400,lsl#2) — reg-alloc may diverge.
 *   confidence: low
 */
/* func_ov002_0221da74 (ov002, class D) — two predicate guards on self->b0
 * (021ca2b8, 021bc618), then require (h6>>8)==1, decode 021b947c(h8) packed
 * record: r4=v&0xff (a), check ((v>>8)&0xff)==0xe, r5=(v>>16)&0xffff (slot).
 * Then 021c33e4(b0,a,slot) guard, then build a per-player base = cf16c +
 * (a&1)*0x868 + 0x18 + 0x400 + slot*4 and post via 021adb8(b0, base, 1, 0).
 * r0=self. */
#include "ov002_core.h"

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b947c(int h8);
extern int  func_ov002_021bc618(int b0);
extern int  func_ov002_021c33e4(int b0, int a, int slot);
extern int  func_ov002_021ca2b8(int b0, int unused, int c, int d);
extern int  func_ov002_0227adb8(int b0, void *p, int c, int d);

struct Self_a74 { u16 f0; u16 b0 : 1; u16 : 16; u16 : 16; u16 f6; u16 f8; };

int func_ov002_0221da74(void *self) {
    struct Self_a74 *s = (struct Self_a74 *)self;
    int v, a, kind, slot;
    char *p;
    if (func_ov002_021ca2b8(s->b0, 0, 0, 0) == 0) return 0;
    if (func_ov002_021bc618(s->b0) == 0) return 0;
    if (((unsigned int)s->f6 >> 8) != 1) return 0;
    v = func_ov002_021b947c(s->f8);
    a = v & 0xff;
    kind = ((((unsigned int)v << 16) >> 16) >> 8) & 0xff;
    slot = (((unsigned int)v << 16) >> 16);
    slot = ((unsigned int)(v << 16) >> 16) >> 16; /* hi u16 */
    slot = ((unsigned int)v) >> 16;
    if (kind != 0xe) return 0;
    if (func_ov002_021c33e4(s->b0, a, slot) == 0) return 0;
    p = data_ov002_022cf16c + (a & 1) * 0x868 + 0x18 + 0x400 + slot * 4;
    func_ov002_0227adb8(s->b0, p, 1, 0);
    return 0;
}
