/* func_0208c428: 3-component vector subtract — `*r2 = *r0 - *r1`.
 *
 *     ldr ip, [r0, #0x0]
 *     ldr r3, [r1, #0x0]
 *     sub r3, ip, r3
 *     str r3, [r2, #0x0]
 *     ldr ip, [r0, #0x4]
 *     ldr r3, [r1, #0x4]
 *     sub r3, ip, r3
 *     str r3, [r2, #0x4]
 *     ldr r3, [r0, #0x8]
 *     ldr r0, [r1, #0x8]
 *     sub r0, r3, r0
 *     str r0, [r2, #0x8]
 *     bx  lr
 *
 * 13 insns = 0x34 bytes. mwcc reuses ip and r3 across the first 2
 * components, then switches to r0/r3 for the 3rd (since r0 was a
 * source pointer but is no longer needed at that point).
 */

typedef struct { int x, y, z; } v3i_t;

void func_0208c428(v3i_t *a, v3i_t *b, v3i_t *result) {
    result->x = a->x - b->x;
    result->y = a->y - b->y;
    result->z = a->z - b->z;
}
