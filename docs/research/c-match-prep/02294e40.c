/* CAMPAIGN-PREP candidate for func_02294e40 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     opposite-bank (1-turn)*0x868 score guard; rsb invert reused; >0 tail
 *   risk:       orig reloads turn for the final 021bcf00 call (separate ldrh) and inverts again; 021c3ae4 takes flag in r0? asm passes only _LIT2 in r1, flag NOT passed — re-check arg. reshape-able
 *   confidence: low
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
extern int func_ov002_021c3ae4(int flag, int arg);
extern int func_ov002_021bcf00(int flag);

int func_ov002_02294e40(Entity *e) {
    if (data_ov002_022cf16c[(1 - e->turn) & 1].score <= 0x960)
        return 1;
    if (func_ov002_021c3ae4(1 - e->turn, 0x1894) != 0)
        return 1;
    return func_ov002_021bcf00(1 - e->turn) > 0;
}
