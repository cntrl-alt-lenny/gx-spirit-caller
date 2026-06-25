/* CAMPAIGN-PREP candidate for func_021b1254 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-return-1; bind base; flag-guarded cond store-then-call; store before bl
 *   risk:       the bound base reg (ip) vs an extra reload may differ; otherwise clean
 *   confidence: med
 */
/* func_ov002_021b1254: if cmd-3 query true -> return 1; else gate on d016c.f3400.
 * If clear, clear d016c.f3404 and return 0. Else, if f3404==0 set it and post a
 * cmd-3 (0229ade0) event; return 1. ip holds the d016c base across all uses. */

extern char data_ov002_022d016c[];
extern int  func_ov002_0229c7f8(int cmd);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

int func_ov002_021b1254(void) {
    char *base = data_ov002_022d016c;
    if (func_ov002_0229c7f8(3)) {
        return 1;
    }
    if (*(int *)(base + 0xd48) == 0) {
        *(int *)(base + 0xd4c) = 0;
        return 0;
    }
    if (*(int *)(base + 0xd4c) == 0) {
        *(int *)(base + 0xd4c) = 1;
        func_ov002_0229ade0(3, 0, 0, 0);
    }
    return 1;
}
