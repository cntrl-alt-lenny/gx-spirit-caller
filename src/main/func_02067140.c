/* func_02067140: swap two bytes pointed to by *r0 and *r1.
 *
 *     ldrb r3, [r0, #0x0]
 *     ldrb r2, [r1, #0x0]
 *     strb r2, [r0, #0x0]
 *     strb r3, [r1, #0x0]
 *     bx   lr
 *
 * mwcc loads both bytes before storing, allowing the swap without
 * a temp variable colliding.
 */

void func_02067140(unsigned char *a, unsigned char *b) {
    unsigned char tmp_a = *a;
    unsigned char tmp_b = *b;
    *a = tmp_b;
    *b = tmp_a;
}
