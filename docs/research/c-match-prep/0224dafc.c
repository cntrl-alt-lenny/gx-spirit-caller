/* CAMPAIGN-PREP candidate for func_0224dafc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 bitfield for lsl;lsr extract; bind base in s, reload count each test
 *   risk:       struct-guessed: count at +0x10 and entries at +0x260, stride 0x868 inferred from asm; confirm real Ov002Scan layout or offsets diverge.
 *   confidence: med
 */
// func_ov002_0224dafc: ov002 entity-scan loop (player-indexed), class D bitfield
// data_ov002_022cf16c = struct base; _022cf17c = same struct + 0x10 (the count field)
extern int func_0202e234(int id);
extern int func_0203058c(int id);
extern void func_ov002_02253458(int who, int kind, int idx);

typedef struct {
    unsigned int id : 19;   // [18:0]  -> lsl#13;lsr#13
    unsigned int rest : 13; // [31:19]
} Ov002Entry;

typedef struct {
    unsigned char pad0[0x10];
    int count;              // +0x10  (== data_ov002_022cf17c)
    unsigned char pad1[0x260 - 0x14];
    Ov002Entry entries[1];  // +0x260
} Ov002Scan;

extern Ov002Scan data_ov002_022cf16c;  // [0x868-byte stride per player]
extern int       data_ov002_022cf17c;  // count for player (r0&1)

void func_ov002_0224dafc(int who) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf17c)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        unsigned int id = s->entries[i].id;
        if (func_0202e234(id)) {
            if (!func_0203058c(id)) {
                func_ov002_02253458(who, 0xd, i);
            }
        }
    }
}
