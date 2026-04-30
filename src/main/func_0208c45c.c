/* func_0208c45c: 3-component vector add — `*r2 = *r0 + *r1`. Sibling
 * of func_0208c428 (subtract); identical 13-insn 0x34 shape with `add`
 * replacing `sub`.
 */

typedef struct { int x, y, z; } v3i_t;

void func_0208c45c(v3i_t *a, v3i_t *b, v3i_t *result) {
    result->x = a->x + b->x;
    result->y = a->y + b->y;
    result->z = a->z + b->z;
}
