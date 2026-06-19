/* func_ov002_021f4c28: C-42 — pool-load + indirect-load + helper.
 *
 *   ldr r0, [pc, #N]; ldr r0, [r0, #3440]; mov r1, #17; mov r2, #1
 *   bl func_ov002_021e2c30(*(data + 3440), 17, 1)
 *   mov r0, #1; pop
 */

extern char data_ov002_022d008c[];
extern void func_ov002_021e2c30(void *p, int k, int one);

int func_ov002_021f4c28(void) {
    func_ov002_021e2c30(((void **)data_ov002_022d008c)[860], 17, 1);
    return 1;
}
