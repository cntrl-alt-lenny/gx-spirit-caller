/* func_ov020_021aa5ec: build the file path for entry 0 into a scratch buffer
 * and open it, storing the handle to *out.
 *
 *     mov r4, r0
 *     add r0,sp,#0; mov r1,#0; bl func_ov020_021aa59c
 *     add r0,sp,#0; mov r1,#4; mov r2,#0; bl func_02006bf0
 *     str r0, [r4, #0]
 */

extern void func_ov020_021aa59c(void *buf, int idx);
extern int func_02006bf0(int a, int b, int c);

void func_ov020_021aa5ec(int *out) {
    char buf[0x40];
    func_ov020_021aa59c(buf, 0);
    *out = func_02006bf0((int)buf, 4, 0);
}
