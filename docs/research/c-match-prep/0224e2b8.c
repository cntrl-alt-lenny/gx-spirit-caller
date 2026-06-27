/* CAMPAIGN-PREP candidate for func_0224e2b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 bitfield; bind id in r9; entries +0x260, count +0x10; reload count
 *   risk:       struct-guessed offsets (+0x10/+0x260). Four-deep predicate chain: cmp #0x2 must stay signed 'bgt'; if mwcc reorders the && short-circuit branches, becomes permuter-class. Else reshape-able.
 *   confidence: med
 */
// func_ov002_0224e2b8: entity-scan, three predicates chained, class D bitfield
// uses data_ov002_022cf17c (count at +0x10) and entries at +0x260 (like 0224dafc)
extern int func_0202e234(int id);
extern int func_0202b8a8(int id);
extern int func_0202de9c(int id);
extern int func_ov002_021ca440(int who, int id);
extern void func_ov002_02253458(int who, int kind, int idx);

typedef struct {
    unsigned int id : 19;
    unsigned int rest : 13;
} Ov002Entry;

typedef struct {
    unsigned char pad0[0x10];
    int count;             // +0x10 (== data_ov002_022cf17c)
    unsigned char pad1[0x260 - 0x14];
    Ov002Entry entries[1]; // +0x260
} Ov002Scan;

extern Ov002Scan data_ov002_022cf16c;
extern int       data_ov002_022cf17c;

void func_ov002_0224e2b8(int who) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf17c)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        unsigned int id = s->entries[i].id;
        if (func_0202e234(id)) {
            if (func_0202b8a8(id) <= 0x2) {
                if (!func_0202de9c(id)) {
                    if (func_ov002_021ca440(who, id)) {
                        func_ov002_02253458(who, 0xd, i);
                    }
                }
            }
        }
    }
}
