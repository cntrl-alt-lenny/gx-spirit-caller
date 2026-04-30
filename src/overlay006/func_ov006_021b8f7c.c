/* func_ov006_021b8f7c: read int at offset 0xca94 of arg.
 *
 *     add r0, r0, #0xc000
 *     ldr r0, [r0, #0xa94]
 *     bx  lr
 *
 * 3 insns = 0xc bytes. Offset 0xca94 doesn't fit a single ldr
 * immediate (12-bit max = 0xfff), so mwcc splits it: add 0xc000
 * (rot-8 encodable) + ldr [r0, #0xa94] (12-bit immediate).
 */

int func_ov006_021b8f7c(void *p) {
    return *(int *)((char *)p + 0xca94);
}
