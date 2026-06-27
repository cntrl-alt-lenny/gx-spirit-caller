/* CAMPAIGN-PREP candidate for func_0228b8c8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: counted loop; bind byteA/byteB, reload self->b0+count; double-mla slot index; id:13
 *   risk:       byteA/byteB held across loop, self->b0 reloaded 3x, count reloaded per iter. mwcc may bind self->b0 or hoist count -> ldrh/loop-test diverge. permuter-class on callee-saved alloc across blx.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228b8c8 (ov002, class C, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED. Per-player block data_022cf16c stride 0x868, slot[] at +0x30 stride 0x14, id:13 (see 02252998.c, 021bbf50.c).
 *   recipe:     Class C: counted loop i<other->count; bind byteA/byteB, reload self->b0; double-mla slot index; id:13 filter via 0202e234/0202e2f8
 *   risk:       byteA(r6)/byteB(r7) held across loop; self->b0 reloaded 3x (ldrh [sl,#2]) and count reloaded each iter. If mwcc binds self->b0 or hoists count, the per-use ldrh / loop-test diverges. permuter-class: callee-saved alloc of byteA/byteB across the blx may rotate.
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct Card { u16 f0; u16 b0 : 1; u16 : 15; u16 _pad4; u16 count : 8; u16 : 8; };

typedef struct { u32 id : 13; u32 : 19; } Ov2Slot;        /* 0x4 used; stride 0x14 */
typedef struct { u8 _pad00[0x30]; Ov2Slot slot[100]; } Ov2Field; /* stride 0x868, slot[] at +0x30 */
typedef unsigned char u8;

extern Ov2Field data_ov002_022cf16c[];
extern int func_0202e234(int id);
extern int func_0202e2f8(int id);
extern int func_ov002_021c10e8(int byteA, int byteB, int flag);
extern int func_ov002_0223de94(struct Card *p, int i);

int func_ov002_0228b8c8(struct Card *self, struct Card *other) {
    int i;
    if (other == 0) return 0;
    if (other->b0 == self->b0) return 0;
    for (i = 0; i < other->count; i++) {
        int v = func_ov002_0223de94(other, i);
        int byteA = v & 0xff;
        int byteB = (v >> 8) & 0xff;
        if (byteA != self->b0) continue;
        if (byteB > 4) continue;
        {
            int id = data_ov002_022cf16c[byteA & 1].slot[byteB].id;
            if (func_0202e234(id) == 0) continue;
            if (func_0202e2f8(id) != 0) continue;
        }
        if (func_ov002_021c10e8(byteA, byteB, 1) == self->b0) return 1;
    }
    return 0;
}
