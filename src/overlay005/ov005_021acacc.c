/* func_ov005_021acacc / func_ov005_021acad4: two adjacent setters for
 * offset 0x64 / 0x68 of the struct pointed to by r0.
 *
 *     str r1, [r0, #0x64]    ; or #0x68
 *     bx  lr
 *
 * Roles unknown; both take the same struct pointer + a 32-bit value.
 */

void func_ov005_021acacc(void *p, int v) {
    *(int *)((char *)p + 0x64) = v;
}

void func_ov005_021acad4(void *p, int v) {
    *(int *)((char *)p + 0x68) = v;
}
