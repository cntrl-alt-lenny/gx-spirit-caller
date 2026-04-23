/* func_02062528: u16 getter at offset 0x8 (halfword load, zero-extended).
 *
 *     ldrh r0, [r0, #0x8]
 *     bx   lr
 */

unsigned short func_02062528(void *p) {
    return *(unsigned short *)((char *)p + 0x8);
}
