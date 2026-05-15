/* func_020342f4: null-guarded pointer offset. Returns
 * func_02034134()'s result + 0x448, or 0 if null. The +0x448
 * is split into +0x48 + +0x400 because 0x448 doesn't fit in an
 * 8-bit rotated immediate; mwcc emits two predicated `addne`s.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02034134
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     addne r0, r0, #0x48
 *     addne r0, r0, #0x400
 *     ldmia sp!, {r3, pc}
 */

extern char *func_02034134(void);

void *func_020342f4(void) {
    char *r = func_02034134();
    if (r == 0) return 0;
    return r + 0x448;
}
