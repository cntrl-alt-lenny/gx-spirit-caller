/* CAMPAIGN-PREP candidate for func_022949f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind turn once (held in ip across rsb); table*0x868 via BankData[2]
 *   risk:       orig HOLDS flag in ip and reuses for rsb; mwcc must keep one reg, not reload — bind covers it. arg1 must stay live in r5. reshape-able
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
extern int func_ov002_021bbf50(int flag);
extern int func_ov002_02294938(Entity *e, int arg1);

int func_ov002_022949f4(Entity *e, int arg1) {
    int flag;

    flag = e->turn;
    if (data_ov002_022cf16c[flag & 1].score >= 0x1770)
        return 0;
    if (func_ov002_021bbf50(1 - flag))
        return 0;
    return func_ov002_02294938(e, arg1);
}
