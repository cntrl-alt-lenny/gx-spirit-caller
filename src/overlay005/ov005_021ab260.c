/* func_ov005_021ab260: array-of-struct field getter.
 *
 *     ldr r2, [r0, #0x8]      ; base = obj->entries (pointer at +0x8)
 *     mov r0, #0x1c           ; stride
 *     mla r0, r1, r0, r2      ; r0 = idx*0x1c + base
 *     ldr r0, [r0, #0xc]
 *     bx  lr
 *
 * Reads obj->entries[idx].field_at_0xc. Entries are a 0x1c-byte
 * struct; field at +0xc is one of several nearby fields read by a
 * whole family of sibling accessors (see ov005_021ab318 /
 * _021ab3a0 / _021ab3b4 at offsets 0x4 / 0x14 / 0x10).
 */

int func_ov005_021ab260(void *obj, int idx) {
    char *base = *(char **)((char *)obj + 0x8);
    return *(int *)(base + idx * 0x1c + 0xc);
}
