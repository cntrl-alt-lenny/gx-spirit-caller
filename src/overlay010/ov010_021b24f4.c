/* func_ov010_021b24f4: "range-nonempty-and-distinct" predicate.
 *
 *     ldr   r1, [r0, #0x64]
 *     cmp   r1, #0x0
 *     ldrne r1, [r0, #0x5c]
 *     ldrne r0, [r0, #0x60]
 *     cmpne r1, r0
 *     moveq r0, #0x0
 *     movne r0, #0x1
 *     bx    lr
 *
 * Returns 0 if `obj->field_64 == 0`, else returns 1 if
 * `obj->field_5c != obj->field_60`, else 0. Short-circuit &&
 * pattern; mwcc emits the conditional-execution form.
 */

int func_ov010_021b24f4(void *p) {
    char *obj = (char *)p;
    if (*(int *)(obj + 0x64) == 0 ||
        *(int *)(obj + 0x5c) == *(int *)(obj + 0x60)) {
        return 0;
    }
    return 1;
}
