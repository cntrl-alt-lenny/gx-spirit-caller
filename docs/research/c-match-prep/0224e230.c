/* CAMPAIGN-PREP candidate for func_0224e230 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 bitfield extract; bind base, reload count each test; single predicate
 *   risk:       struct-guessed: count +0x14, entries +0x418, stride 0x868 inferred. Simplest of batch; main divergence would be early-return ldmls (signed <=0) — written as <=0 to match. Else high.
 *   confidence: high
 */
// func_ov002_0224e230: simple bitfield loop, single predicate, class D (tractable)
extern int func_0202f9e8(int id);
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

void func_ov002_0224e230(int who) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf180)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        if (func_0202f9e8(s->entries[i].id) == 0x1) {
            func_ov002_02253458(who, 0xe, i);
        }
    }
}
