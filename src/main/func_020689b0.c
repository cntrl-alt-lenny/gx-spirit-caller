/* func_020689b0: u16 getter at offset 0x4 (halfword load, zero-extended).
 *
 *     ldrh r0, [r0, #0x4]
 *     bx   lr
 */

unsigned short func_020689b0(void *p) {
    return *(unsigned short *)((char *)p + 0x4);
}
