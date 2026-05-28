/* func_02034548: if (self->f30) helper1; else { helper2(self, 0x400); h3; h4; }.
 *
 *     push {r3, lr}
 *     ldr r1, [r0, #0x30]; cmp r1, #0; beq L_else
 *     bl func_02031d0c(self); pop
 *     L_else: mov r1, #0x400; bl func_02034388(self, 0x400)
 *     bl func_0203268c; bl func_0203361c; pop
 */
struct F02034548 {
    char pad[0x30];
    int f30;
};

extern void func_02031d0c(struct F02034548 *self);
extern void func_02034388(struct F02034548 *self, int n);
extern void func_0203268c(void);
extern void func_0203361c(void);

void func_02034548(struct F02034548 *self) {
    if (self->f30 != 0) {
        func_02031d0c(self);
        return;
    }
    func_02034388(self, 0x400);
    func_0203268c();
    func_0203361c();
}
