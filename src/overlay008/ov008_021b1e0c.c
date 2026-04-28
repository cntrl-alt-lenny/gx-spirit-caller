/* func_ov008_021b1e0c: indirect-pointer store through a global.
 *
 *     ldr r1, .L = data_ov008_021b270c
 *     ldr r1, [r1, #0x0]          ; deref global = obj pointer
 *     str r0, [r1, #0x14]        ; obj->field_14 = arg
 *     bx  lr
 *
 * `data_ov008_021b270c` is a global pointer-variable (holds a
 * pointer, not a struct). Baserom loads its address, dereferences
 * once to get the actual obj, then stores through that.
 */

typedef struct {
    char _pad[0x14];
    int field_14;
} ov000_obj_144_t;

extern ov000_obj_144_t *data_ov008_021b270c;

void func_ov008_021b1e0c(int x) {
    data_ov008_021b270c->field_14 = x;
}
