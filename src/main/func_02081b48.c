/* func_02081b48: read halfword from `*p`, advance the pointer by 2,
 * write back the new pointer, return the read value.
 *
 *     ldr  r1, [r0, #0x0]
 *     ldrh r2, [r1], #0x2       ; r2 = *r1; r1 += 2
 *     str  r1, [r0, #0x0]
 *     mov  r0, r2
 *     bx   lr
 */

unsigned short func_02081b48(unsigned short **pp) {
    unsigned short *p = *pp;
    unsigned short v = *p++;
    *pp = p;
    return v;
}
