/* CAMPAIGN-PREP candidate for func_021ff9c4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind-0x12>1 guard; (active&1)*0x868+f1c*0x14 mla; 13-bit field; bind active
 *   risk:       struct-guessed: cd3f4 +0/+0x1c and cf16c +0x30/cf1a2 +0x14 row offsets inferred. Also reshape-able: the (x<<0x13)>>0x13 13-bit extract must stay an explicit shift pair (a :13 bitfield member is the safer form).
 *   confidence: low
 */
/* func_ov002_021ff9c4 (ov002, class C) — mla record-index reads, guard chain, bitfield.
 * kind in {0x12,0x13} else return 1; then per-player(active&1)*0x868 + rec(f1c)*0x14
 * record at +0x30 (13-bit field) must be set, parallel cf1a2 u16 slot zero,
 * 021c1ef0(active) nonzero, finally return 2 if self.bit0 != active else 1. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct F021ff9c4_F2 {
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 rest : 4;
};
struct F021ff9c4_Self {
    u16 f0;
    struct F021ff9c4_F2 f2;
};

/* cd3f4 active-player global: word at +0 (active flag), word at +0x1c (record idx). */
struct G021ff9c4 { int active; char _p[0x1c - 4]; int f1c; };
extern struct G021ff9c4 data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a2[];

extern int func_ov002_021c1ef0(int active);

int func_ov002_021ff9c4(struct F021ff9c4_Self *self) {
    int active;
    int idx;
    if ((u16)(self->f2.kind - 0x12) > 1) return 1;
    active = data_ov002_022cd3f4.active;
    idx = (active & 1) * 0x868;
    if (((*(u32 *)(data_ov002_022cf16c + idx + data_ov002_022cd3f4.f1c * 0x14 + 0x30)) << 0x13) >> 0x13)
    {
        if (*(u16 *)((char *)data_ov002_022cf1a2 + idx + 0x14) == 0) {
            if (func_ov002_021c1ef0(active) != 0) {
                if (self->f2.bit0 != active) return 2;
            }
        }
    }
    return 1;
}
