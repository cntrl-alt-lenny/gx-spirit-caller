/* CAMPAIGN-PREP candidate for func_0224e018 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 bitfield; bind id in r9; pass who twice to 021c33e4; reload count
 *   risk:       struct-guessed offsets (+0x14/+0x418). Chain order must lay cmp #0x3 as 'bgt' (signed <=3) — if mwcc emits unsigned, flip to (int) compare. Otherwise reshape-able.
 *   confidence: med
 */
// func_ov002_0224e018: entity-scan, three predicates, class D bitfield
// quirk: func_021c33e4 called with (r7,r7,i) -> both first args are 'who'
extern int func_0202e234(int id);
extern int func_0202de9c(int id);
extern int func_0202b8a8(int id);
extern int func_ov002_021c33e4(int who, int who2, int idx);
extern void func_ov002_02253458(int who, int kind, int idx);

typedef struct {
    unsigned int id : 19;
    unsigned int rest : 13;
} Ov002Entry;

typedef struct {
    unsigned char pad0[0x14];
    int count;             // +0x14
    unsigned char pad1[0x418 - 0x18];
    Ov002Entry entries[1]; // +0x418
} Ov002Scan;

extern Ov002Scan data_ov002_022cf16c;
extern int       data_ov002_022cf180;

void func_ov002_0224e018(int who) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf180)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        unsigned int id = s->entries[i].id;
        if (func_0202e234(id)) {
            if (!func_0202de9c(id)) {
                if (func_0202b8a8(id) <= 0x3) {
                    if (func_ov002_021c33e4(who, who, i)) {
                        func_ov002_02253458(who, 0xe, i);
                    }
                }
            }
        }
    }
}
