/* func_ov005_021ab0fc: chained pointer load.
 *
 *     ldr r0, [r0, #0x4]
 *     ldr r0, [r0, #0x4]
 *     bx  lr
 *
 * Reads pointer at [r0 + 4], then reads value at [that_pointer + 4].
 * Callsites treat the return as a count (cmp r0, #0; ble ...), so
 * this is likely "get size of the nested list at struct.field[4]".
 */

int func_ov005_021ab0fc(void *p) {
    void *q = *(void **)((char *)p + 4);
    return *(int *)((char *)q + 4);
}
