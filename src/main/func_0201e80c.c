/* func_0201e80c: chained u16 getter — `obj->_0x18->_0x0` (u16).
 *
 *     ldr  r0, [r0, #0x18]
 *     ldrh r0, [r0, #0x0]
 *     bx   lr
 */

unsigned short func_0201e80c(void *obj) {
    void *inner = *(void **)((char *)obj + 0x18);
    return *(unsigned short *)inner;
}
