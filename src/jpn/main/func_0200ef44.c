/* CAMPAIGN-PREP candidate for func_0200ef44 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc/copy + two null-guard Task_InvokeLocked + setter + tail
 *   risk:       load-test-invoke-clear ordering on 0x18/0x1c; r5 store@0x27c before edb8; Copy32 direction; offsets guessed
 *   confidence: high
 */
/* func_0200ef44: allocate+zero+copy a record, then for each of two
 * pending-task slots (@0x18,@0x1c) invoke and clear it, stash a2 @0x27c,
 * and finalize via func_0200ed9c. Returns the edb8 result. */

extern void Copy32(void *dst, void *src, int n);
extern void Fill32(int value, void *dest, int count);
extern void Task_InvokeLocked(void *t);
extern void *func_0200ed2c(void);
extern int func_0200ed9c(void *p);

int func_0200ef44(void *o, int a2) {
    int *p = (int *)func_0200ed2c();
    if (p == 0) return 0;
    if (o == 0) return 0;
    Fill32(0, p, 0x284);
    Copy32(o, p, 0x34);
    if (p[0x18 / 4] != 0) {
        Task_InvokeLocked((void *)p[0x18 / 4]);
        p[0x18 / 4] = 0;
    }
    if (p[0x1c / 4] != 0) {
        Task_InvokeLocked((void *)p[0x1c / 4]);
        p[0x1c / 4] = 0;
    }
    p[0x27c / 4] = a2;
    return func_0200ed9c(p);
}
