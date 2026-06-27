/* CAMPAIGN-PREP candidate for func_02212954 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: player bound (cd744 idx + 0x80 mul), case 0x7e reloads bit0; descending case order matches cmp-chain (proven by 0222b2e0).
 *   risk:       struct-guessed: 021d71e0 arity (3 args; r3 is dead scratch) and 022592ec taking a fn-ptr inferred; confirm sigs. Codegen byte-verified incl. split bit0 extract.
 *   confidence: high
 */
/* func_ov002_02212954 (ov002, cls D): bit2 guard, cd744[player] gate, state
 * switch (0x7e/0x7f/0x80) keyed on *(int*)(ce288+0x5a8). */
typedef unsigned short u16;
typedef unsigned int   u32;

struct S02212954 {
    u16 f0;
    u16 b0 : 1;            /* +2 bit0 = player */
    u16    : 15;
    u16 b2_2 : 2;          /* +4 bits0-1 */
    u16 b2  : 1;           /* +4 bit2 */
    u16     : 13;
};

extern int  data_ov002_022cd744[];   /* int table, indexed by player */
extern char data_ov002_022ce288[];   /* +0x5a8 = state int */
extern char data_ov002_022cf178[];   /* per-player table, 0x868 stride */
extern char data_ov002_022d016c[];   /* per-player field table */

extern int  func_ov002_021ae484(int x);
extern void func_ov002_022592ec(void *fn);
extern int  func_ov002_022593f4(void);
extern void func_ov002_021d71e0(int bit0, int v, int zero);
extern int  func_ov002_0221292c(int a, int b);

int func_ov002_02212954(struct S02212954 *self) {
    int player;
    int state;
    if (self->b2) return 0;
    player = self->b0;
    if (data_ov002_022cd744[player] == 1) return 0;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + (player & 1) * 0x868) == 0) return 0;
        func_ov002_021ae484(30);
        return 0x7f;
    case 0x7f:
        if (*(int *)(data_ov002_022d016c + 0xd44) == 0) return 0;
        func_ov002_022592ec((void *)func_ov002_0221292c);
        return 0x7e;
    case 0x7e:
        if (func_ov002_022593f4()) {
            func_ov002_021d71e0(self->b0, *(int *)(data_ov002_022d016c + 0xd78), 0);
        }
        return 0x80;
    default:
        return 0;
    }
}
