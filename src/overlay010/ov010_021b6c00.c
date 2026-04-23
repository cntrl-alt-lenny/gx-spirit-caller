/* func_ov010_021b6c00: tail-call into func_02037208 with constant args.
 *
 *     ldr ip, .L_...
 *     mov r0, #0x38
 *     sub r1, r0, #0x39        ; r1 = -1
 *     mov r2, #0x0
 *     mov r3, #0x1
 *     bx  ip
 *     .word func_02037208
 *
 * Sibling of ov015_021b4040 (identical body). mwcc emits -1 via
 * `sub r1, r0, #0x39` reusing r0's 0x38, matching the "arithmetic
 * expression in source" pattern documented in ov015_021b4040.c.
 */

extern int func_02037208(int a, int b, int c, int d);

int func_ov010_021b6c00(void) {
    return func_02037208(0x38, -1, 0, 1);
}
