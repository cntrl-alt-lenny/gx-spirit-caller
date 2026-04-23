/* func_020684c0: u8 setter at offset 0x15 (adjacent byte to the 0x14
 * slot touched by func_020684a4).
 *
 *     strb r1, [r0, #0x15]
 *     bx   lr
 */

void func_020684c0(void *p, unsigned char value) {
    *((unsigned char *)p + 0x15) = value;
}
