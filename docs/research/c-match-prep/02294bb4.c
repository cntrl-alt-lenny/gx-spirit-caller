/* CAMPAIGN-PREP candidate for func_02294bb4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload turn; (*p<<0x13)>>0x13 low-13 bitfield; add base+delta then cmp
 *   risk:       orig binds 0202b8f0->r4 (base), reloads turn for opposite-bank score at end; add r0,r4,r0 order. *p<<19>>19 must stay unsigned (:13). struct-guessed score offset
 *   confidence: med
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct BankData {
    int score;
    char _pad[0x868 - 4];
} BankData;

extern BankData data_ov002_022cf16c[2];
extern int *func_ov002_021afb74(void);
extern int func_ov002_022806a4(int id, int zero);
extern int func_0202b8f0(int field13, int flag);
extern int func_ov002_022812ac(int flag, int flag2);

int func_ov002_02294bb4(Entity *e) {
    int flag;
    int hit;
    int base;
    int delta;

    if (data_ov002_022cf16c[e->turn & 1].score > 0xfa0)
        return 0;
    hit = func_ov002_022806a4(e->id, 0);
    if (hit < 0)
        return 0;
    base = func_0202b8f0((*func_ov002_021afb74() << 0x13) >> 0x13, e->turn);
    flag = e->turn;
    delta = func_ov002_022812ac(flag, flag);
    if (base + delta >= data_ov002_022cf16c[(1 - e->turn) & 1].score)
        return 1;
    return 0;
}
