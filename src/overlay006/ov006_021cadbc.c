/* func_ov006_021cadbc: store a 2-word block at obj[0..7], return 1.
 *
 *     stmia r0, {r1, r2}              ; obj[0] = r1, obj[4] = r2
 *     mov   r0, #0x1
 *     bx    lr
 *
 * mwcc emits `stmia` (store-multiple) when two adjacent word stores
 * hit the same base register — here that's `obj[0] = a; obj[4] = b;`
 * where the struct base is also the first-field address.
 */

typedef struct {
    int field0;
    int field4;
} pair_t;

int func_ov006_021cadbc(pair_t *obj, int a, int b) {
    obj->field0 = a;
    obj->field4 = b;
    return 1;
}
