/* func_ov002_021f4d18: C-42 — pool-load + indirect-load + helper.
 *
 *   ldr r0, [pc, #N]; ldr r0, [r0, #3440]; mov r1, #17; mov r2, #1
 *   bl func_ov002_021e2d20(*(data + 3440), 17, 1)
 *   mov r0, #1; pop
 */

extern char data_ov002_022d016c[];
extern void func_ov002_021e2d20(void *p, int k, int one);

int func_ov002_021f4d18(void) {
    func_ov002_021e2d20(((void **)data_ov002_022d016c)[860], 17, 1);
    return 1;
}
