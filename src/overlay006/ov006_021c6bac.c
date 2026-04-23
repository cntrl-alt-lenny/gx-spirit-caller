/* func_ov006_021c6bac: 2-field set — store `value` at 0xc, store 1 at
 * 0x14, return 1.
 *
 *     str r1, [r0, #0xc]            ; obj[0xc] = value
 *     mov r1, #0x1
 *     str r1, [r0, #0x14]            ; obj[0x14] = 1
 *     mov r0, r1                      ; return r1 (= 1)
 *     bx  lr
 *
 * mwcc folds the `mov r0, r1` into the return path because r1 already
 * holds 1 — saves one instruction vs a separate `mov r0, #0x1`.
 */

int func_ov006_021c6bac(void *obj, int value) {
    *(int *)((char *)obj + 0xc) = value;
    *(int *)((char *)obj + 0x14) = 1;
    return 1;
}
