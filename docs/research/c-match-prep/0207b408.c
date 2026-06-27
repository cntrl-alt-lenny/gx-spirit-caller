/* CAMPAIGN-PREP candidate for func_0207b408 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     re-derive base per store (orig RELOADS global, never binds); ordered stores; rsb/bic align math
 *   risk:       orig reloads `ldr;add #0x2000` before EVERY store and never CSEs the base; mwcc -O4 will likely hoist/CSE `data_021a088c+0x2000` into one reg -> collapses ~10 ldr to 1, all stores diverge. permuter-class / may need volatile global to force reload.
 *   confidence: low
 */
/* func_0207b408: alignment-fixup, writes 5 ordered fields into the global ctx
 * at base+0x2000 (base = *(char**)data_021a088c), offsets 0x26c..0x27c.
 * r0=cfg ptr (may be NULL), r1=mode.
 * cfg fields: f0(+0),f4(+4),f8(+8),fc(+0xc).
 * NULL cfg -> defaults {0x26c=3,0x270=0,0x274=0,0x278=0}.
 * else: 0x26c=f0&3; pad=((4-(f4&3))&3)+0xc; if(pad>f8){0x270=0;0x274=0;}
 *       else {0x270=(f4+3)&~3; 0x274=f8-((4-(f4&3))&3); memset(0x270val,0,0x274val);}
 *       0x278=fc; 0x27c=mode.
 */
typedef struct {
    int f0;   /* +0x0 */
    int f4;   /* +0x4 */
    int f8;   /* +0x8 */
    int fc;   /* +0xc */
} cfg_0207b408;

extern char *data_021a088c;
extern void func_020945f4(void *p, int b, int n);

void func_0207b408(cfg_0207b408 *cfg, int mode) {
    char *base;

    if (cfg == 0) {
        base = data_021a088c + 0x2000;
        *(int *)(base + 0x26c) = 3;
        base = data_021a088c + 0x2000;
        *(int *)(base + 0x270) = 0;
        base = data_021a088c + 0x2000;
        *(int *)(base + 0x274) = 0;
        base = data_021a088c + 0x2000;
        *(int *)(base + 0x278) = 0;
    } else {
        int pad;
        base = data_021a088c + 0x2000;
        *(int *)(base + 0x26c) = cfg->f0 & 3;
        pad = ((4 - (cfg->f4 & 3)) & 3) + 0xc;
        if (pad > cfg->f8) {
            base = data_021a088c + 0x2000;
            *(int *)(base + 0x270) = 0;
            base = data_021a088c + 0x2000;
            *(int *)(base + 0x274) = 0;
        } else {
            base = data_021a088c + 0x2000;
            *(int *)(base + 0x270) = (cfg->f4 + 3) & ~3;
            base = data_021a088c + 0x2000;
            *(int *)(base + 0x274) = cfg->f8 - ((4 - (cfg->f4 & 3)) & 3);
            base = data_021a088c + 0x2000;
            func_020945f4((void *)*(int *)(base + 0x270), 0, *(int *)(base + 0x274));
        }
        base = data_021a088c + 0x2000;
        *(int *)(base + 0x278) = cfg->fc;
    }
    base = data_021a088c + 0x2000;
    *(int *)(base + 0x27c) = mode;
}
