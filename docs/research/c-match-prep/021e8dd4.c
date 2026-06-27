/* CAMPAIGN-PREP candidate for func_021e8dd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: parity*0x868+idx*20 indexing; bitfield+guard chain; switch tail
 *   risk:       permuter-class AND truncated-asm: body cut at .L_104 so the switch case set/returns (.L_1bc/.L_1c8) and the func_021c8940 case id are guessed; indexed-load scheduling and off/row register binding are also coin-flip.
 *   confidence: low
 */
/* func_ov002_021e8dd4: parity*0x868+idx*20 indexing, 13-bit field, idx<5
 * guard, halfword guard, 3 helper guards, then switch(entity->id) into
 * 0-returns and a func_021c8940 tail.
 * NOTE: asm truncated after case .L_104 (full case map / .L_1bc/.L_1c8/
 * .L_1d4 returns reconstructed); offsets/strides inferred. */
extern int func_ov002_021c1e44(void *ent, int id, int idx);
extern int func_ov002_021c1ef0(void *ent, int id, int idx);
extern int func_ov002_021c2084(void *ent, int id, int idx, int flag);
extern int func_ov002_021c8940(int id, int idx);

typedef struct {
    unsigned short id;       /* +0x0 */
} Entity021e8dd4;

extern unsigned char data_ov002_022cf16c[]; /* _LIT1 */
extern unsigned char data_ov002_022cf1a4[]; /* _LIT2 */

int func_ov002_021e8dd4(Entity021e8dd4 *ent, int id, int idx) {
    unsigned int parity = (unsigned int)id & 1;
    unsigned int off = parity * 0x868;
    unsigned int row = (unsigned int)idx * 20;
    unsigned int field;
    field = (*(unsigned int *)(data_ov002_022cf16c + off + row + 0x30) << 19) >> 19;
    if (idx >= 5)
        return 0;
    if (field == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + row) == 0)
        return 0;
    if (func_ov002_021c1ef0(ent, id, idx) == 0)
        return 0;
    if (func_ov002_021c2084(ent, id, idx, 0) == 0)
        return 0;
    if (func_ov002_021c1e44(ent, id, idx) != 0)
        return 0;
    switch (ent->id) {
    /* .L_104 case */
    case 0:
        return func_ov002_021c8940(id, idx) == 1 ? 1 : 0;
    /* .L_1bc / .L_1c8 cases and .L_1d4 default: tail truncated */
    default:
        return 0;
    }
}
