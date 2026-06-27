/* CAMPAIGN-PREP candidate for func_0224e184 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :19 for predicate id; explicit shift-decode of (hi6<<1)|bit13; cmp target!=code
 *   risk:       reshape-able: packed decode forced via explicit shifts (lsl#2/lsr#24/lsl#18/lsr#31). orig reloads [r5] for the decode after predicate; if CSE shares the predicate's load, split temps. struct-guessed offsets.
 *   confidence: med
 */
// func_ov002_0224e184: entity-scan, field-unpack compared to param, class D
// note: param r2 (target) compared against decoded ((hi6<<1)|bit13); skip-on-equal
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

void func_ov002_0224e184(int who, int unused, int target) {
    Ov002Scan *s;
    int i;
    if ((&data_ov002_022cf180)[(who & 1) * (0x868 / 4)] <= 0)
        return;
    s = (Ov002Scan *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868);
    for (i = 0; i < s->count; i++) {
        if (func_0202f9e8(s->entries[i].id) == 0x1) {
            unsigned int word = ((unsigned int *)s->entries)[i];
            unsigned int code = (((word << 2) >> 24) << 1) + ((word << 18) >> 31);
            if (target != (int)code) {
                func_ov002_02253458(who, 0xe, i);
            }
        }
    }
}
