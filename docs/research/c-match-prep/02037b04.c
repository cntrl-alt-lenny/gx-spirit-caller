/* CAMPAIGN-PREP candidate for func_02037b04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed-index guard; indexed global load; nonzero-or-null tail
 *   risk:       mwcc -O4 may fold the trailing `if(p)return p;return 0;` into a bare return, dropping the cmp r0,#0
 *   confidence: med
 */
/* func_02037b04: bounded table lookup.
 *   ldrsh r1,[r0,#0x4]; cmp r1,#0; blt ret0   -> if (idx < 0) return 0
 *   ldr r0,[base, idx, lsl #2]                 -> p = data_0219b344[idx]
 *   cmp r0,#0; bxne lr; mov r0,#0             -> return p ? p : 0
 */

typedef struct {
    char  _pad_00[0x04];
    short f04;   /* +0x04, signed index */
} Ctx;

extern Ctx   data_0219b2e0;
extern void *data_0219b344[];

void *func_02037b04(void) {
    short idx = data_0219b2e0.f04;
    void *p;

    if (idx < 0) return 0;
    p = data_0219b344[idx];
    if (p != 0) return p;
    return 0;
}
