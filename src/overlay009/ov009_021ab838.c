/* func_ov009_021ab838: field getter at offset 0xc.
 *
 *     ldr r0, [r0, #0xc]
 *     bx  lr
 *
 * Reads a 32-bit word at byte offset 0xc of the struct at `*p`,
 * returns it. Two callers inside ov009's big state machines
 * (func_ov009_021aa5d8, func_ov009_021aacc4).
 */

int func_ov009_021ab838(void *p) {
    return *(int *)((char *)p + 0xc);
}
