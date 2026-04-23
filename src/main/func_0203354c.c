/* func_0203354c: u32 getter at offset 0xe88. Sibling of func_0203353c/
 * func_02033544 — the 0xe80/0xe84/0xe88 triple are adjacent u32 fields
 * in the same struct.
 *
 *     ldr r0, [r0, #0xe88]
 *     bx  lr
 */

int func_0203354c(void *p) {
    return *(int *)((char *)p + 0xe88);
}
