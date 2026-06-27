/* CAMPAIGN-PREP candidate for func_021d9778 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :4/:13/bit9/bit13 bitfields; signed (h>>8) for asr#8; (lo&1)<<31|0x2c4e18d1 packed; 2-arg call (r2 undefined)
 *   risk:       permuter-class: deep 4-guard liveness (lo,hi,lo&1 held across 3 cmps + 2 ldr) is reg-rotation-prone; also the asr#8 needs h as signed int>>8 and func_021e30b4's leftover r2 (a2) is not modeled.
 *   confidence: low
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];

/* self: u16 f0 at +0, u16 f2 at +2 whose low 4 bits are a "kind". */
struct Self {
    u16 f0;
    u16 kind : 4;        /* +2, lsl#28;lsr#28 */
};

/* arg1 points at a dword whose bit 9 ((w<<22)>>31) is a flag. */
struct Other {
    unsigned     : 9;
    unsigned b9  : 1;    /* bit 9 */
};

struct Slot {
    unsigned id  : 13;   /* bits 0-12  */
    unsigned lsb : 1;    /* bit 13     */
    unsigned     : 8;
    unsigned hi  : 8;    /* bits 22-29 */
    unsigned char pad[16];
};

/* call site only sets r0,r1 (a2 left undefined) -> declare 2-arg here. */
extern int func_ov002_021e30b4(int packed, int value);

int func_ov002_021d9778(struct Self *self, struct Other *other)
{
    int h;
    int lo;
    int hi;
    struct Slot *s;
    int value;

    if (self->kind != 0xa)
        return 0;

    h  = self->f0;
    lo = h & 0xff;
    hi = (h >> 8) & 0xff;
    if (lo == other->b9)
        return 0;

    s = (struct Slot *)(data_ov002_022cf16c + (lo & 1) * 0x868 + 0x30);
    if (s[hi].id != 0x18d1)
        return 0;

    value = s[hi].hi * 2 + s[hi].lsb;
    func_ov002_021e30b4(((lo & 1) << 31) | 0x2c4e18d1, (u16)value);
    return 0;
}
