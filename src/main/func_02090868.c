/* func_02090868: allocate from a 2-word (64-bit) free-bitmap at 0x027fffb0
 * (raw address literal in the original .s, not a named symbol -- no
 * relocation on that pool word). Scans word0 then word1 via `clz` for the
 * first set ("free") bit from the MSB, clears it, and returns a base-
 * offset (0x40 or 0x60) plus the bit position; -3 if both words are 0.
 *
 * Ships as asm: mwcc 2.0 has no clz idiom recognition (see
 * src/main/func_02079e4c.c), so a natural C loop/intrinsic can't reach
 * the `clz` instruction itself -- direct transliteration of the target
 * disassembly, matching the sibling asm functions' established style.
 */
asm int func_02090868(void) {
    nofralloc
    ldr r3, =0x027fffb0
    ldr r1, [r3]
    clz r2, r1
    cmp r2, #0x20
    movne r0, #0x40
    bne block34
    add r3, r3, #0x4
    ldr r1, [r3]
    clz r2, r1
    cmp r2, #0x20
    ldr r0, =0xfffffffd
    bxeq lr
    mov r0, #0x60
block34:
    add r0, r0, r2
    mov r1, #-2147483648
    mov r1, r1, lsr r2
    ldr r2, [r3]
    bic r2, r2, r1
    str r2, [r3]
    bx lr
}
