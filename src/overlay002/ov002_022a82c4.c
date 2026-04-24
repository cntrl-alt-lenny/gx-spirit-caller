/* func_ov002_022a82c4: clear 2 fields at offsets 0x588 and 0x58c,
 * `obj[0x58c] = 0; obj[0x588] = 0;` order matches baserom emit
 * (store 0x58c first — that's why the literal sequence fits the
 * 0x0 in r1 once and reuses it).
 *
 *     mov r1, #0x0
 *     str r1, [r0, #0x58c]
 *     str r1, [r0, #0x588]
 *     bx  lr
 */

void func_ov002_022a82c4(void *obj) {
    *(int *)((char *)obj + 0x58c) = 0;
    *(int *)((char *)obj + 0x588) = 0;
}
