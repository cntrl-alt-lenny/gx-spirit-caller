/* func_ov020_021aa6cc: build the file path for entry 0 into a scratch buffer
 * and open it, storing the handle to *out.
 *
 *     mov r4, r0
 *     add r0,sp,#0; mov r1,#0; bl func_ov020_021aa67c
 *     add r0,sp,#0; mov r1,#4; mov r2,#0; bl func_02006c0c
 *     str r0, [r4, #0]
 */

extern void func_ov020_021aa67c(void *buf, int idx);
extern int func_02006c0c(int a, int b, int c);

void func_ov020_021aa6cc(int *out) {
    char buf[0x40];
    func_ov020_021aa67c(buf, 0);
    *out = func_02006c0c((int)buf, 4, 0);
}
