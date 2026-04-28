/* func_020498dc: indirect-pointer store through a global.
 *
 *     ldr r1, .L = data_0219dc88
 *     ldr r1, [r1, #0x0]          ; deref global = obj pointer
 *     str r0, [r1, #0x1a0]        ; obj->field_1a0 = arg
 *     bx  lr
 *
 * `data_0219dc88` is a global pointer-variable (holds a
 * pointer, not a struct). Baserom loads its address, dereferences
 * once to get the actual obj, then stores through that.
 */

typedef struct {
    char _pad[0x1a0];
    int field_1a0;
} ov000_obj_144_t;

extern ov000_obj_144_t *data_0219dc88;

void func_020498dc(int x) {
    data_0219dc88->field_1a0 = x;
}
