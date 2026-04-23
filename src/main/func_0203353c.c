/* func_0203353c: u32 getter at offset 0xe80.
 *
 *     ldr r0, [r0, #0xe80]
 *     bx  lr
 *
 * 0xe80 fits in ARM's 12-bit load immediate (max 0xfff), so no
 * literal-pool helper is required.
 */

int func_0203353c(void *p) {
    return *(int *)((char *)p + 0xe80);
}
