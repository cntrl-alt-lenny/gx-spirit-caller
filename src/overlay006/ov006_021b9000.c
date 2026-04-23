/* func_ov006_021b9000: u16 field-subtract — `a->_0x0 - b->_0x0` on u16 halfwords.
 *
 *     ldrh r2, [r0, #0x0]
 *     ldrh r0, [r1, #0x0]
 *     sub  r0, r2, r0
 *     bx   lr
 *
 * Likely a comparator (sort/ordering predicate) for a pair of
 * objects whose first field is a 16-bit key.
 */

int func_ov006_021b9000(unsigned short *a, unsigned short *b) {
    return *a - *b;
}
