/* func_020684a4: u8 setter at offset 0x14 (strb). Counterpart of
 * func_0206849c getter.
 *
 *     strb r1, [r0, #0x14]
 *     bx   lr
 */

void func_020684a4(void *p, unsigned char value) {
    *((unsigned char *)p + 0x14) = value;
}
