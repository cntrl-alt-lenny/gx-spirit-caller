/* func_02068b20: C-42 — deref + field+helper + zero + helper.
 *
 *   push {r4, lr}; ldr r4, [r0]
 *   ldr r0, [r4, #24]; bl func_02054610
 *   mov r1, #0; mov r0, r4; str r1, [r4, #24]
 *   bl func_02045364; pop
 */

struct F02068b94_X {
    char pad[24];
    int f24;
};

extern void func_02054610(int x);
extern void func_02045364(struct F02068b94_X *p);

void func_02068b20(struct F02068b94_X **pp) {
    struct F02068b94_X *p = *pp;
    func_02054610(p->f24);
    p->f24 = 0;
    func_02045364(p);
}
