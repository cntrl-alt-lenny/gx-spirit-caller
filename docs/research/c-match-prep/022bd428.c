/* CAMPAIGN-PREP candidate for func_022bd428 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: switch on s[0xc60]; counted search e[0]/e[1] over 16*8; states declared first-use order.
 *   risk:       struct-guessed AND truncated: asm clipped at 90 lines so state 4/5 bodies (.L_280/.L_2a0) and the exact .L_2c4 tail are MISSING — recover full asm before build; tail timer++ is a guess.
 *   confidence: low
 */
/* func_ov002_022bd428: PARTIAL/TRUNCATED (asm clipped at 90 lines; size=380 =>
 * states 4 and 5 bodies at .L_280/.L_2a0 are MISSING). state machine on s[0xc60].
 * jump table 0..4 via addls pc,pc,r0,lsl#2. Tail .L_2c4 = timer++/return (shared).
 * Only states 0(default)/1/2/3 reconstructed below; tail+states4/5 are guesses. */
extern char data_ov002_022d1af8[];
extern char data_ov002_022d28fc[];
extern void func_02037208(int, int, int, int);
extern void func_ov002_022bdb88(int, int, int, int, int);

int func_ov002_022bd428(int *s) {
    int i;
    int *e;
    int found;
    int t;
    switch (s[0xc60 / 4]) {
    case 1:
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        s[0xc48 / 4] = 0;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 2:
        if (s[0xc64 / 4] < 0xf) break;
        func_ov002_022bdb88((int)data_ov002_022d1af8, 7, s[0xc58 / 4], 0, 0);
        s[0xc60 / 4] = 2;
        s[0xc64 / 4] = 0;
        break;
    case 3:
        if (s[0xc64 / 4] == 0x4b || s[0xc64 / 4] == 0x5a) {
            func_02037208(0x3b, -1, 0, 1);
        } else if (s[0xc64 / 4] == 0x9b) {
            func_02037208(0x4a, -1, 0, 1);
        }
        e = (int *)data_ov002_022d1af8;
        found = 0;
        for (i = 0; i < 0x10; i++) {
            if (e[0] != 0 && e[1] == 7) { found = 1; break; }
            e += 2;
        }
        if (!found) {
            s[0xc60 / 4] = 3;
            s[0xc64 / 4] = 0;
        }
        break;
    default:
        break;
    }
    t = s[0xc64 / 4];
    s[0xc64 / 4] = t + 1;
    return 1;
}
