/* func_ov005_021ac9d0: indexed int-table lookup through a pointer at offset 0x2c.
 *
 *     ldr r0, [r0, #0x2c]          ; table = *(int **)(obj + 0x2c)
 *     ldr r0, [r0, r1, lsl #0x2]   ; r0 = table[idx]
 *     bx  lr
 */

int func_ov005_021ac9d0(void *obj, int idx) {
    int *table = *(int **)((char *)obj + 0x2c);
    return table[idx];
}
