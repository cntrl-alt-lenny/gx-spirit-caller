/* CAMPAIGN-PREP candidate for func_0224ddf0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 bitfield; bind base, reload count; entries at +0x418
 *   risk:       struct-guessed: count +0x14, entries +0x418 (0x18+0x400) inferred; the r9=#1 const arg held across loop — if mwcc rematerializes vs holds, minor. Confirm layout.
 *   confidence: med
 */
// func_ov002_0224ddf0: entity-scan loop, two predicates, class D bitfield
// data_ov002_022cf180 = struct + 0x14 (count); entries at base+0x18+0x400 = +0x418
extern int func_0202e234(int id);
extern int func_ov002_021b9128(int id, int arg);
extern void func_ov002_02253458(int who, int kind, int idx);

typedef struct {
    unsigned int id : 19;
    unsigned int rest : 13;
} Ov002Entry;

typedef struct {
    unsigned char pad0[0x14];
    int count;             // +0x14 (== data_ov002_022cf180)
    unsigned char pad1[0x418 - 0x18];
    Ov002Entry entries[1]; // +0x418
} Ov002Scan;

extern Ov002Scan data_ov002_022cf16c;
extern int       data_ov002_022cf180;

void func_ov002_0224ddf0(int who) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf180)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        unsigned int id = s->entries[i].id;
        if (func_0202e234(id)) {
            if (func_ov002_021b9128(id, 1)) {
                func_ov002_02253458(who, 0xe, i);
            }
        }
    }
}
