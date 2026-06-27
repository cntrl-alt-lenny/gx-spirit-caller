/* CAMPAIGN-PREP candidate for func_022222d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield byte-extract via mask+shift; insert store-back into f6 hi-byte; 1-(x&1) side flag
 *   risk:       struct-guessed: f6 field semantics + the +0x400/+0x30 table offsets inferred; the (cnt+0xff)&0xff decrement-and-pack store may codegen as add;and not the orig's lsl;lsr;orr sequence. struct-guessed.
 *   confidence: low
 */
// func_ov002_022222d8 — ov002, class D (bitfield insert store-back)
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent {
    u16 f0;
    u16 f2;          // bit0 = side flag
    u16 f4;
    u16 f6;          // byte[0] = count-ish field, byte[1] = id
};

struct Rec { u32 packed; /* ... 0x14 bytes total */ u8 _pad[0x10]; };

extern u8 data_ov002_022cf16c[];           // base of 0x868-stride table
extern s32 func_ov002_0223def4(s32);
extern s32 func_ov002_021b99b4(s32);
extern void func_ov002_021d7268(s32, s32, s32);
extern void func_ov002_021e286c(s32);

#define TBL ((data_ov002_022cf16c))

int func_ov002_022222d8(struct Ent *e)
{
    int id = (e->f6 << 0x10) >> 0x18;   // (u16<<16)>>24 -> byte field at bit8..15? matches lsl16;lsr24
    if (id == 0) {
        int side0 = 1 - (e->f2 & 1);
        func_ov002_021e286c(side0);
        return 0;
    } else {
        int sub = func_ov002_0223def4(id - 1);
        int side = 1 - (e->f2 & 1);
        int ip = func_ov002_021b99b4(side);
        if (ip >= 0) {
            int side2 = 1 - (e->f2 & 1);
            u32 *p = (u32 *)(data_ov002_022cf16c + (side2 & 1) * 0x868 + 0x30 + 0x400);
            u32 w = p[ip];
            int a = ((w << 2) >> 0x18) << 1;
            int b = (w << 0x12) >> 0x1f;
            func_ov002_021d7268(side, a + b, 1);
        }
        {
            int cnt = (e->f6 << 0x10) >> 0x18;   // low byte of f6
            cnt = (cnt + 0xff) & 0xff;            // (x-1)&0xff via +0xff
            u16 v = e->f6;
            v = (u16)((v & ~0xff00) | (cnt << 8)); // store back into byte[1]
            e->f6 = v;
        }
        return 0x80;
    }
}
