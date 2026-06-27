/* CAMPAIGN-PREP candidate for func_022bced8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch s[0xc60]; (c64-0x1e) /9 and %9 (divmod recipe); 16x8 e[0]/e[1] scan for kind 0x1a.
 *   risk:       permuter-class: orig emits the /9 quotient via TWO smull (ip and lr both = q) plus the asr#1/add-sign bias — exact reciprocal-divmod pairing for reused quotient+remainder is fragile; mwcc may merge the two smull or reorder. _LIT pool order (db88 takes data_022d28fc) is struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022bced8 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. State machine on s[0xc60] (jump-table 0..4 via
 * addls pc,pc,r0,lsl#2). State 3 does smull /9 divmod of (c64-0x1e): both quotient
 * and remainder used (DIVMOD recipe -> plain / and %). data_022d1af8 is a 16-entry
 * table of {active,kind} 8-byte rows scanned for kind==0x1a. Full asm cross-checked
 * against src/overlay002/func_ov002_022bced8.s. */
extern char data_ov002_022d1af8[];
extern char data_ov002_022d28fc[];
extern void func_02037208(int, int, int, int);
extern void func_ov002_022bdb88(int, int, int, int, int);

int func_ov002_022bced8(int *s) {
    int i;
    int *e;
    int found;
    int q;
    int rem;
    int v;
    switch (s[0xc60 / 4]) {
    case 1:
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 2:
        if (s[0xc64 / 4] < 0x2d)
            break;
        func_ov002_022bdb88((int)data_ov002_022d28fc, 0x1a, s[0xc58 / 4], 0, 0);
        s[0xc60 / 4] = 2;
        s[0xc64 / 4] = 0;
        break;
    case 3:
        v = s[0xc64 / 4] - 0x1e;
        q = v / 9;
        rem = v % 9;
        if (rem == 0 && q >= 0 && q < 0x14)
            func_02037208(0x5a, -1, 0, 1);
        if (s[0xc64 / 4] == 0xe4)
            func_02037208(0x5b, -1, 0, 1);
        e = (int *)data_ov002_022d28fc;
        found = 0;
        for (i = 0; i < 0x10; i++) {
            if (e[0] != 0 && e[1] == 0x1a) { found = 1; break; }
            e += 2;
        }
        if (!found) {
            s[0xc60 / 4] = 3;
            s[0xc64 / 4] = 0;
        }
        break;
    case 4:
        if (s[0xc64 / 4] < 0xf)
            break;
        s[0xc60 / 4] = 4;
        s[0xc64 / 4] = 0;
        break;
    case 5:
        *(int *)(data_ov002_022d1af8 + 4) = 1;
        s[0xcc8 / 4] = 0xc;
        s[0xc54 / 4] = 0;
        return 0;
    default:
        break;
    }
    s[0xc64 / 4]++;
    return 1;
}
