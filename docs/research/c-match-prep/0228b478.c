/* CAMPAIGN-PREP candidate for func_0228b478 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard, event-code compares, mul-index table, unsigned>=4
 *   risk:       0x1325 may not reuse 0x12d5+0x50; n*0x868 may emit mla not mul; b0 holder
 *   confidence: low
 */
/* func_ov002_0228b478: if evt==NULL -> 0. code = *(u16*)evt. If
 * code==0x12d5 -> 1. If code==0x1325 -> (cf178[!b0 player] >= 4). Else 0. */
typedef unsigned short u16;
struct S8b478 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022cf178[];

int func_ov002_0228b478(struct S8b478 *self, u16 *evt) {
    u16 code;
    int n;
    if (evt == 0) return 0;
    code = *evt;
    if (code == 0x12d5) return 1;
    if (code == 0x1325) {
        n = (1 - self->b0) & 1;
        return *(unsigned int *)(data_ov002_022cf178 + n * 0x868) >= 4;
    }
    return 0;
}
