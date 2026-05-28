/* func_02068b94: C-42 — deref + field+helper + zero + helper.
 *
 *   push {r4, lr}; ldr r4, [r0]
 *   ldr r0, [r4, #24]; bl func_02054684
 *   mov r1, #0; mov r0, r4; str r1, [r4, #24]
 *   bl func_020453b4; pop
 */

struct F02068b94_X {
    char pad[24];
    int f24;
};

extern void func_02054684(int x);
extern void func_020453b4(struct F02068b94_X *p);

void func_02068b94(struct F02068b94_X **pp) {
    struct F02068b94_X *p = *pp;
    func_02054684(p->f24);
    p->f24 = 0;
    func_020453b4(p);
}
