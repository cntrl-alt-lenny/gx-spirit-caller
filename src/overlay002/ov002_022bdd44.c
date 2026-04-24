/* func_ov002_022bdd44: clear 2 fields at offsets 0x0 and 0x4 —
 * reset the first two u32s of a struct.
 *
 *     mov r1, #0x0
 *     str r1, [r0, #0x0]
 *     str r1, [r0, #0x4]
 *     bx  lr
 */

void func_ov002_022bdd44(int *obj) {
    obj[0] = 0;
    obj[1] = 0;
}
