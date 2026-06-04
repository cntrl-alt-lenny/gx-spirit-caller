/* func_ov017_021b2bdc: poll the two scene controllers for "both ready", reset
 * their per-frame state, toggle the two BG layers, and return whether both
 * were ready.
 *
 *     cmp r5,#0; cmpne r4,#0; movne r4,#1; mov r0,#1; moveq r4,#0
 */

extern char data_ov017_021b8570[];
extern char data_ov017_021b8894[];
extern int func_ov017_021b33dc(void *ctrl);
extern int func_ov017_021b7330(void *ctrl);
extern void func_ov017_021b312c(void *ctrl);
extern void func_ov017_021b7010(void *ctrl);
extern void func_02005e20(int bg);
extern void func_02005ca0(int bg);

int func_ov017_021b2bdc(void) {
    int a = func_ov017_021b33dc(data_ov017_021b8570);
    int b = func_ov017_021b7330(data_ov017_021b8894);
    func_ov017_021b312c(data_ov017_021b8570);
    func_ov017_021b7010(data_ov017_021b8894);
    b = (a != 0 && b != 0);
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    return b;
}
