/* func_02033544: u32 getter at offset 0xe84. Sibling of func_0203353c
 * (0xe80) and func_0203354c (0xe88) — adjacent u32 fields.
 *
 *     ldr r0, [r0, #0xe84]
 *     bx  lr
 */

int func_02033544(void *p) {
    return *(int *)((char *)p + 0xe84);
}
