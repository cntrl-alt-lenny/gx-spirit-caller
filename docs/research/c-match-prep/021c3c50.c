/* CAMPAIGN-PREP candidate for func_021c3c50 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :13 bitfield + reloaded unsigned bound + addge accumulator
 *   risk:       entry guard may load via row+0xc (cf16c) not cf178 pool; i/count r4/r5 order
 *   confidence: med
 */
/* func_ov002_021c3c50: per-player row at cf16c+(player&1)*0x868. count = how
 * many of the first (*(row+0xc)) entries (13-bit id at row+0x120, stride 4)
 * have func_0202b8a8(id) >= arg1. The bound is reloaded each iteration
 * (unsigned compares). id is a :13 bitfield (lsl#19;lsr#19). */
extern char data_ov002_022cf16c[];
extern int  func_0202b8a8(int id);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c3c50(int player, int arg1) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int i = 0;
    int count = 0;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0xc); i++) {
        unsigned int id =
            ((struct Ov002Id13 *)(row + 0x120 + i * 4))->v;
        if (func_0202b8a8(id) >= arg1)
            count++;
    }
    return count;
}
