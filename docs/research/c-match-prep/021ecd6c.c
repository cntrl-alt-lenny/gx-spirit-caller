/* CAMPAIGN-PREP candidate for func_021ecd6c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 5..10 guard; :13 flags; 0202b878(flags)==0x17; explicit packed reconstruct cmp
 *   risk:       final cmp rebuilds ((raw>>22&0xff)<<1)+(raw>>31) vs (u4>>6)&0x1ff — non-contiguous combine; the +>>31 carry-in shift schedule is permuter-class. struct-guessed bit layout.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021ecd6c (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: range 5..10 guard; e->flags :13; func_0202b878(flags)==0x17 guard; explicit packed-field reconstruct compare (self->u4 bits vs raw bits)
 *   risk:       the final compare reconstructs ((raw>>22 & 0xFF)<<1)+(raw>>31) vs (self->u4>>6)&0x1ff — a non-contiguous bit-combine (bit30 skipped). mwcc's shift sequence for this packed read is the divergence: permuter-class if the +>>31 carry-in schedules differently. struct-guessed (raw bit layout).
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };
struct Obj02 { u16 f0; u16 f2; u16 f4; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_0202b878(int id);

int func_ov002_021ecd6c(struct Obj02 *self, int player, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;
    u32 raw;
    u32 lhs;
    u32 rhs;

    if (index < 5 || index > 10)
        return 0;

    half = (player & 1) * 0x868;
    row  = index * 0x14;

    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    if (e->flags == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;
    if (func_0202b878(e->flags) == 0x17)
        return 0;

    raw = *(u32 *)(data_ov002_022cf16c + half + row + 0x30);
    lhs = (((raw >> 22) & 0xFF) << 1) + (raw >> 31);
    rhs = ((u32)self->f4 >> 6) & 0x1FF;
    if (rhs != lhs)
        return 1;
    return 0;
}
