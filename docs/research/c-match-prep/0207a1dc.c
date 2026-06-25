/* CAMPAIGN-PREP candidate for func_0207a1dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: switch lays jump-table; nested classifier switch; bind root per-use (reload after each call as asm does)
 *   risk:       Jump-table case fall-through to shared epilogues (case0/2/4 share one body; default==case-other) — mwcc will likely emit distinct tails or a different table-entry order than the orig's b .L_47c/.L_390 layout. permuter-class.
 *   confidence: low
 */
/* func_0207a1dc — UI/event dispatcher keyed on ev->field2 (0..4) with a
 * jump table; cases route to func_0207b038 (set-state) / func_0207af28
 * (commit) / func_0207b13c (post message) using a classifier from
 * func_0209e91c. data_021a088c is the global root pointer; (*root+0x2000)
 * +0x260 is the current state field, (*root)+0x2140 a sub-context.
 * Ships as .s in-tree (brief 302) — known reg-alloc/scheduling wall.
 */

extern char *data_021a088c;
extern int  func_0207a458(void);
extern void func_0207af28(void);
extern void func_0207b038(int state);
extern void func_0207b13c(int a, void *ctx, int c, int d);
extern int  func_0209e91c(void *fn, int arg);

void func_0207a1dc(unsigned short *ev) {
    char *root;
    switch (ev[1]) {
    case 1:
        root = *(char **)data_021a088c;
        if (*(int *)(root + 0x2260) == 0xc) {
            func_0207b038(0xa);
            func_0207af28();
            return;
        }
        switch (func_0209e91c(func_0207a458, 0)) {
        case 2:
            return;
        case 3:
            func_0207b038(0xa);
            func_0207af28();
            return;
        case 8:
            func_0207b038(0xc);
            root = *(char **)data_021a088c;
            func_0207b13c(1, root + 0x2140, 0, 0x8b4);
            return;
        default:
            func_0207b038(0xb);
            root = *(char **)data_021a088c;
            func_0207b13c(7, root + 0x2140, 0, 0x8d3);
            return;
        }
    case 0:
    case 2:
    case 4:
        func_0207b038(0xa);
        func_0207af28();
        return;
    default:
        func_0207b038(0xb);
        root = *(char **)data_021a088c;
        func_0207b13c(7, root + 0x2140, 0, 0x8d3);
        return;
    }
}
