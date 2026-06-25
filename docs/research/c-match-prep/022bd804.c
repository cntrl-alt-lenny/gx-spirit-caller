/* CAMPAIGN-PREP candidate for func_022bd804 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: switch s[0xc60]; counted e[0]/e[1] search; sub sp#4 = one outgoing-arg word for _db88.
 *   risk:       truncated/struct-guessed: asm clipped at 90 lines; state5 body after .L_638 and the .L_65c tail are partly past the cut. The single stack word forces _db88 to take a 5th (stacked) arg.
 *   confidence: low
 */
/* func_ov002_022bd804: PARTIAL/TRUNCATED (asm clipped at 90 lines; size=316). Sibling
 * of 022bd428 (key=0x19 not 7). states 0/1/2/3/4 + state5(.L_638) reconstructed; the
 * shared tail .L_65c (ldr r1,[r4,#0xc64]; mov r0,#1; ...) is the timer++/return epilogue.
 * Frame is sub sp,#4 (one stack word at sp for the _db88 5th arg). */
extern char data_ov002_022d1af8[];
extern char data_ov002_022d28fc[];
extern void func_ov002_022bdb88(int, int, int, int, int);

int func_ov002_022bd804(int *s) {
    int i;
    int *e;
    int found;
    int t;
    switch (s[0xc60 / 4]) {
    case 1:
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 2:
        if (s[0xc64 / 4] < 0xf) break;
        func_ov002_022bdb88((int)data_ov002_022d1af8, 0x19, s[0xc58 / 4], 0, 0);
        s[0xc60 / 4] = 2;
        s[0xc64 / 4] = 0;
        break;
    case 3:
        e = (int *)data_ov002_022d1af8;
        found = 0;
        for (i = 0; i < 0x10; i++) {
            if (e[0] != 0 && e[1] == 0x19) { found = 1; break; }
            e += 2;
        }
        if (!found) {
            s[0xc60 / 4] = 3;
            s[0xc64 / 4] = 0;
        }
        break;
    case 4:
        if (s[0xc64 / 4] < 0xf) break;
        s[0xc60 / 4] = 4;
        s[0xc64 / 4] = 0;
        break;
    case 5:
        *(int *)(data_ov002_022d1af8 + 4) = 1;
        s[0xcc8 / 4] = 0xc;
        s[0xc54 / 4] = 0;
        return 1;
    default:
        break;
    }
    t = s[0xc64 / 4];
    s[0xc64 / 4] = t + 1;
    return 1;
}
