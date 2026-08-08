/* func_020b319c: int-to-float software conversion (round-to-nearest-even),
 * using `clz` for mantissa normalization. mwcc 2.0 has no clz idiom
 * recognition (see func_02079e4c.c), so a plain C cast/loop won't
 * reproduce this; ships as inline asm, direct transliteration of the
 * target disassembly.
 */

asm float func_020b319c(int x) {
    nofralloc
    ands r2, r0, #0x80000000
    rsbmi r0, r0, #0x0
    cmp r0, #0x0
    bxeq lr
    clz r3, r0
    movs r0, r0, lsl r3
    rsb r3, r3, #0x9e
    ands r1, r0, #0xff
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bxeq lr
    tst r1, #0x80
    bxeq lr
    ands r3, r1, #0x7f
    andeqs r3, r0, #0x1
    addne r0, r0, #0x1
    bx lr
}
