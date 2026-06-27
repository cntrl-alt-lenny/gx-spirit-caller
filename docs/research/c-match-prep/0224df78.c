/* CAMPAIGN-PREP candidate for func_0224df78 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 bitfield; reload entries[i].id per call (orig re-loads [r5]); reload count
 *   risk:       reshape-able: orig reloads [r5] + re-extracts id before BOTH calls; CSE may collapse to one load+extract. If so, force two separate reads/temps. Plus struct-guessed offsets.
 *   confidence: med
 */
// func_ov002_0224df78: entity-scan, double predicate, double extract reload, class D
// note: orig RELOADS [r5] and re-extracts the :19 id before EACH predicate -> do not cache id
extern int func_0202b878(int id);
extern int func_0202b8c0(int id);
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

void func_ov002_0224df78(int who) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf180)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        if (func_0202b878(s->entries[i].id) == 0x16) {
            if (func_0202b8c0(s->entries[i].id) == 0x4) {
                func_ov002_02253458(who, 0xe, i);
            }
        }
    }
}
