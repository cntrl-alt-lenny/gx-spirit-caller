/* func_02032748: helper(self->fe7c, 0, self->feac * 0xc) + return 0.
 *
 *     push {r3, lr}
 *     ldr r3, [r0, #0xeac]; mov r1, #0xc; mul r2, r3, r1
 *     ldr r0, [r0, #0xe7c]; mov r1, #0
 *     bl func_020945f4
 *     mov r0, #0; pop
 */
struct F02032748 {
    char pad[0xe7c];
    void *fe7c;
    char pad2[0x2c];
    int feac;
};

extern void func_020945f4(void *p, int z, int n);

int func_02032748(struct F02032748 *self) {
    func_020945f4(self->fe7c, 0, self->feac * 0xc);
    return 0;
}
