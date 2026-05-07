/* func_02021c0c: increment `*data_02197434`, return 1.
 *
 *     ldr r1, .L_02021c24
 *     mov r0, #0x1
 *     ldr r2, [r1, #0x0]
 *     add r2, r2, #0x1
 *     str r2, [r1, #0x0]
 *     bx  lr
 *
 * mwcc materialises the constant return value `1` into r0 *first*
 * (before the read-modify-write), keeping r2 free as the increment
 * scratch — distinct from brief-020 func_02092254's pre-increment-
 * returns-new-value shape (which puts the value in r0).
 */

extern unsigned int data_02197434;

int func_02021c0c(void) {
    data_02197434 += 1;
    return 1;
}
