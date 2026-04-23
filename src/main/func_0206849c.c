/* func_0206849c: u8 getter at offset 0x14 (ldrb — zero-extended).
 *
 *     ldrb r0, [r0, #0x14]
 *     bx   lr
 */

unsigned char func_0206849c(void *p) {
    return *((unsigned char *)p + 0x14);
}
