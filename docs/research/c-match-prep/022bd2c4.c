/* CAMPAIGN-PREP candidate for func_022bd2c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: u16 lo/hi unpack of c58; packed=(hi&0xff)|(eq?0:0x100) shifted-or operand-first; store-order kept.
 *   risk:       struct-guessed + store-order: the ce8/ce4 stores must stay in source order (low halfword first); the `(eq?0:0x100)` then `orr r1,r2` puts the conditional in the dest reg (shifted-or operand-first) — if mwcc swaps orr operands the dest reg flips. _LIT0=022cd73c offset +4 compare is inferred; state 2 body/tail past the cut.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022bd2c4 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. 3-state cmp/beq machine on s[0xc60]. State 0
 * unpacks two u16 halfwords of s[0xc58]: low->s[0xce8] (lsl16;lsr16), high->s[0xce4]
 * (lsr16;lsl16;lsr16); then builds a packed arg (low8 | (eq?0:0x100)) and STORES the
 * struct fields in source order. Cross-checked vs src/overlay002/func_ov002_022bd2c4.s. */
extern char data_ov002_022ccfec[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022d28fc[];
extern void func_02037208(int, int, int, int);
extern void func_020a978c(int, int);
extern void func_ov002_022bdb88(int, int, int, int, int);

int func_ov002_022bd2c4(int *s) {
    int i;
    int *e;
    int found;
    int lo;
    int hi;
    int packed;
    switch (s[0xc60 / 4]) {
    case 0:
        lo = (unsigned short)s[0xc58 / 4];
        s[0xce8 / 4] = lo;
        hi = (unsigned short)((unsigned int)s[0xc58 / 4] >> 0x10);
        s[0xce4 / 4] = hi;
        packed = (s[0xce8 / 4] == *(int *)(data_ov002_022cd73c + 4)) ? 0 : 0x100;
        packed = (s[0xce4 / 4] & 0xff) | packed;
        func_ov002_022bdb88((int)data_ov002_022d28fc, 0x4a, packed, 0, 0);
        func_020a978c((int)s + 0x924, (int)data_ov002_022ccfec);
        s[0xcec / 4] = 1;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 1:
        if (s[0xc64 / 4] == 0x3c) {
            s[0xcec / 4] = 0;
            func_02037208(0x33, -1, 0, 1);
        }
        e = (int *)data_ov002_022d28fc;
        found = 0;
        for (i = 0; i < 0x10; i++) {
            if (e[0] != 0 && e[1] == 0x4a) { found = 1; break; }
            e += 2;
        }
        if (!found) {
            s[0xc60 / 4] = 2;
            s[0xc64 / 4] = 0;
        }
        break;
    case 2:
        break;
    default:
        break;
    }
    s[0xc64 / 4]++;
    return 1;
}
