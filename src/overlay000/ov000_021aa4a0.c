/* func_ov000_021aa4a0: indirect-pointer store through a global.
 *
 *     ldr r1, .L = data_ov000_021c73e0
 *     ldr r1, [r1, #0x0]          ; deref global = obj pointer
 *     str r0, [r1, #0x144]        ; obj->field_144 = arg
 *     bx  lr
 *
 * `data_ov000_021c73e0` is a global pointer-variable (holds a
 * pointer, not a struct). Baserom loads its address, dereferences
 * once to get the actual obj, then stores through that.
 */

typedef struct {
    char _pad[0x144];
    int field_144;
} ov000_obj_144_t;

extern ov000_obj_144_t *data_ov000_021c73e0;

void func_ov000_021aa4a0(int x) {
    data_ov000_021c73e0->field_144 = x;
}
