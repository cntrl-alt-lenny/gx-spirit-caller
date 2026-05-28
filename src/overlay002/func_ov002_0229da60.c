/* func_ov002_0229da60: C-42 — helper + return char* + (arg - field) * 20.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_0229da1c(self)
 *   ldr r1, [r5, #0xa8]; mov r0, #0x14
 *   sub r1, r4, r1; mla r0, r1, r0, r5  ; r0 = (arg - self->fa8) * 20 + self
 *   pop
 */

struct F0229da60 {
    char pad[0xa8];
    int fa8;
};

extern void func_ov002_0229da1c(struct F0229da60 *self);

char *func_ov002_0229da60(struct F0229da60 *self, int arg) {
    func_ov002_0229da1c(self);
    return (char *)self + (arg - self->fa8) * 20;
}
