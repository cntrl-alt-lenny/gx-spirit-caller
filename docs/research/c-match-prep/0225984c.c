/* CAMPAIGN-PREP candidate for func_0225984c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch(dispatch) + conditional flag-OR accumulate (orrne)
 *   risk:       each cd73c.f4 reload must stay separate (no CSE) to reproduce the repeated ldr; if mwcc hoists it, a reload drops
 *   confidence: med
 */
/* func_ov002_0225984c: accumulate a flag word from sub-queries selected by
 * func_ov002_0225929c(). case 2: OR 0x8 / 0x20; case 3: OR 0x10 then 0x20.
 * The selection word data_ov002_022cd73c.f4 is reloaded before each query. */

extern char data_ov002_022cd73c[];
extern int func_ov002_0225929c(void);
extern int func_ov002_02259f74(int x);
extern int func_ov002_0225a0e0(int x);
extern int func_ov002_02266220(int x);

int func_ov002_0225984c(void) {
    int flags = 0;
    switch (func_ov002_0225929c()) {
    case 2:
        if (func_ov002_02259f74(*(int *)(data_ov002_022cd73c + 0x4)) != 0)
            flags |= 0x8;
        if (func_ov002_0225a0e0(*(int *)(data_ov002_022cd73c + 0x4)) != 0)
            flags |= 0x20;
        break;
    case 3:
        if (func_ov002_0225a0e0(*(int *)(data_ov002_022cd73c + 0x4)) != 0) {
            flags |= 0x10;
            if (func_ov002_02266220(*(int *)(data_ov002_022cd73c + 0x4)) != 0)
                flags |= 0x20;
        }
        break;
    }
    return flags;
}
