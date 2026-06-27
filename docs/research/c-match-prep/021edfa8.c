/* CAMPAIGN-PREP candidate for func_021edfa8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: multi-bitfield slot extract, byteHi*2+bit13 build, asymmetric (f4<<17)>>23 raw shift
 *   risk:       the +0x30 slot is re-read (add r3,#0x30 reuse of cf16c+poff base) and decomposed via lsl/lsr chains mwcc will likely NOT reproduce as bitfield loads; byteHi/bit13/f4-field offsets struct-guessed. struct-guessed + permuter-class (already .s-shipped).
 *   confidence: low
 */
/* func_ov002_021edfa8 - CLASS D. idx==0xa ->0; idx<5 -> 021b8fcc(player,idx) guard;
 * f30 slot bitfield; cf1a4[0]==0 ->0; bit9 of cf1ac word set ->0; then a multi-
 * bitfield extract of the +0x30 slot word compared to a self->f4 sub-field.
 * Slot word bits: id:13 (guard), bit13, byte at [29:22]; value = byteHi*2 + bit13.
 * self->f4 field = bits[14:8] (7-bit). Returns (field != value).
 * Bitfield layout STRUCT-GUESSED beyond the proven id:13 - confirm offsets. */
typedef unsigned short u16;
struct Slot { unsigned int id : 13; unsigned int bit13 : 1; unsigned int _m : 8; unsigned int byteHi : 8; unsigned int _hi : 2; };
struct Self { u16 f0; u16 f2; u16 f4; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b8fcc(int player, int idx);

int func_ov002_021edfa8(struct Self *self, int player, int idx) {
    int poff, ioff;
    struct Slot *slot;
    int field, value;
    if (idx == 0xa)
        return 0;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    poff = (player & 1) * 0x868;
    ioff = idx * 20;
    slot = (struct Slot *)(data_ov002_022cf16c + poff + ioff + 0x30);
    if (slot->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) != 0)
        return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + poff + ioff) >> 9) & 1)
        return 0;
    value = slot->byteHi * 2 + slot->bit13;
    field = ((unsigned int)((u16)self->f4 << 0x11)) >> 0x17;
    return field != value;
}
