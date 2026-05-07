/* func_02092254: pre-increment counter at data_021a63c0; return new value.
 *
 *     ldr r1, .L_02092268
 *     ldr r0, [r1, #0x0]
 *     add r0, r0, #0x1
 *     str r0, [r1, #0x0]
 *     bx  lr
 *  .L_02092268: .word data_021a63c0
 *
 * Register choice (r1 for address, r0 for value) only emerges when the
 * incremented value is also the return value — mwcc keeps the value in
 * r0 so it doesn't need a final `mov r0, rN` before bx lr.
 */

extern unsigned int data_021a63c0;

unsigned int func_02092254(void) {
    return ++data_021a63c0;
}
