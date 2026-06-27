/* CAMPAIGN-PREP candidate for func_02253458 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table over kind; store-order (str cdc88[cur] then strh ce088[cur]); mla (player&1)*0x868 base; branchless saturating cur++.
 *   risk:       orig RELOADS cdc78.cur for STORE1, STORE2 and the cap; mwcc -O4 CSEs the reads into one ldr -> diverges. permuter-class (reload-vs-CSE; already ships .s).
 *   confidence: low
 */
/* func_ov002_02253458: switch(kind) reads a per-player record word and writes
 * it into cdc88[cur], writes the kind tag into ce088[cur] (halfword), then
 * advances cur (saturating at 0xff). cdc78.cur is RELOADED before each use in
 * the orig. Specific cases index by idx*4; default by kind*0x14. */

extern int  data_ov002_022cf28c[];
extern int  data_ov002_022cf50c[];
extern int  data_ov002_022cf3cc[];
extern int  data_ov002_022cf584[];
extern int  data_ov002_022cf73c[];
extern int  data_ov002_022cf19c[];
extern int  data_ov002_022cdc88[];
extern unsigned short data_ov002_022ce088[];
extern struct cur_t { char _pad[0xc]; unsigned int cur; } data_ov002_022cdc78;

void func_ov002_02253458(int player, int kind, int idx) {
    int v;
    switch (kind) {
    case 0xb:
        v = *(int *)((char *)data_ov002_022cf28c + (player & 1) * 0x868 + idx * 4);
        data_ov002_022cdc88[data_ov002_022cdc78.cur] = v;
        data_ov002_022ce088[data_ov002_022cdc78.cur] = 0xb;
        break;
    case 0xc:
        v = *(int *)((char *)data_ov002_022cf50c + (player & 1) * 0x868 + idx * 4);
        data_ov002_022cdc88[data_ov002_022cdc78.cur] = v;
        data_ov002_022ce088[data_ov002_022cdc78.cur] = 0xc;
        break;
    case 0xd:
        v = *(int *)((char *)data_ov002_022cf3cc + (player & 1) * 0x868 + idx * 4);
        data_ov002_022cdc88[data_ov002_022cdc78.cur] = v;
        data_ov002_022ce088[data_ov002_022cdc78.cur] = 0xd;
        break;
    case 0xe:
        v = *(int *)((char *)data_ov002_022cf584 + (player & 1) * 0x868 + idx * 4);
        data_ov002_022cdc88[data_ov002_022cdc78.cur] = v;
        data_ov002_022ce088[data_ov002_022cdc78.cur] = 0xe;
        break;
    case 0xf:
        v = *(int *)((char *)data_ov002_022cf73c + (player & 1) * 0x868 + idx * 4);
        data_ov002_022cdc88[data_ov002_022cdc78.cur] = v;
        data_ov002_022ce088[data_ov002_022cdc78.cur] = 0xf;
        break;
    default:
        v = *(int *)((char *)data_ov002_022cf19c + (player & 1) * 0x868 + kind * 0x14);
        data_ov002_022cdc88[data_ov002_022cdc78.cur] = v;
        data_ov002_022ce088[data_ov002_022cdc78.cur] = kind;
        break;
    }
    data_ov002_022cdc78.cur += (data_ov002_022cdc78.cur < 0xff) ? 1 : 0;
}
