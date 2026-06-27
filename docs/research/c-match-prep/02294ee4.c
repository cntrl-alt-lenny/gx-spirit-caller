/* CAMPAIGN-PREP candidate for func_02294ee4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branchy guard chain; same-bank w0>>0x11&1 (tst bit17); reload turn
 *   risk:       orig falls .L_40 sharing the >=2-fail path; my nested-if duplicates the 02280980<0 tail — mwcc may emit two calls vs one shared block, reordering bne .L_80. table 022cf288 not 16c. reshape-able
 *   confidence: low
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct BankData {
    unsigned int w0;
    char _pad[0x868 - 4];
} BankData;

extern BankData data_ov002_022cf288[2];
extern int func_ov002_021bbf50(int flag);
extern int func_ov002_021c3ae4(int flag, int arg);
extern int func_ov002_021c3c50(int flag, int arg);
extern int func_ov002_02280980(int flag);

int func_ov002_02294ee4(Entity *e) {
    if (func_ov002_021bbf50(e->turn) >= 2) {
        if (func_ov002_021c3ae4(e->turn, 0x19a5) != 0)
            return 1;
    }
    if ((data_ov002_022cf288[e->turn & 1].w0 >> 0x11) & 1) {
        return func_ov002_02280980(e->turn) < 0;
    }
    if (func_ov002_021c3c50(e->turn, 5) != 0)
        return 1;
    return func_ov002_02280980(e->turn) < 0;
}
