/* func_020326f4: helper(self->fe7c, 0, self->feac * 0xc) + return 0.
 * USA struct is 8 bytes narrower before this point than EUR's (brief
 * 673/676 region-specific struct-offset class) -- offsets shifted -8.
 *
 *     push {r3, lr}
 *     ldr r3, [r0, #0xea4]; mov r1, #0xc; mul r2, r3, r1
 *     ldr r0, [r0, #0xe74]; mov r1, #0
 *     bl func_02094500
 *     mov r0, #0; pop
 */
struct F02032748 {
    char pad[0xe74];
    void *fe7c;
    char pad2[0x2c];
    int feac;
};

extern void func_02094500(void *p, int z, int n);

int func_020326f4(struct F02032748 *self) {
    func_02094500(self->fe7c, 0, self->feac * 0xc);
    return 0;
}
