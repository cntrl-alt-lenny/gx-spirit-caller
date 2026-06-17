/* func_020344f8: if (self->f30) helper1; else { helper2(self, 0x400); h3; h4; }.
 *
 *     push {r3, lr}
 *     ldr r1, [r0, #0x30]; cmp r1, #0; beq L_else
 *     bl func_02031cb8(self); pop
 *     L_else: mov r1, #0x400; bl func_02034338(self, 0x400)
 *     bl func_02032638; bl func_020335cc; pop
 */
struct F02034548 {
    char pad[0x30];
    int f30;
};

extern void func_02031cb8(struct F02034548 *self);
extern void func_02034338(struct F02034548 *self, int n);
extern void func_02032638(void);
extern void func_020335cc(void);

void func_020344f8(struct F02034548 *self) {
    if (self->f30 != 0) {
        func_02031cb8(self);
        return;
    }
    func_02034338(self, 0x400);
    func_02032638();
    func_020335cc();
}
