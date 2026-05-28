/* func_02033318: helper(&self->fdf0) + cond helper2(2) + helper3 + return 0.
 *
 *     push {r4, lr}
 *     mov r4, r1
 *     add r0, r0, #0xdf0
 *     bl func_0204593c
 *     cmp r4, #0; beq L_skip
 *     mov r0, #2; bl func_020458d8(2)
 *     L_skip: bl func_02045828; mov r0, #0; pop
 */
struct F02033318 {
    char pad[0xdf0];
    int fdf0;
};

extern void func_0204593c(int *p);
extern void func_020458d8(int n);
extern void func_02045828(void);

int func_02033318(struct F02033318 *self, int flag) {
    func_0204593c(&self->fdf0);
    if (flag != 0) {
        func_020458d8(2);
    }
    func_02045828();
    return 0;
}
