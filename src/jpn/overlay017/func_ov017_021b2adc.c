/* func_ov017_021b2adc: poll the two scene controllers for "both ready", reset
 * their per-frame state, toggle the two BG layers, and return whether both
 * were ready.
 *
 *     cmp r5,#0; cmpne r4,#0; movne r4,#1; mov r0,#1; moveq r4,#0
 */

extern char data_ov017_021b8470[];
extern char data_ov017_021b8794[];
extern int func_ov017_021b32dc(void *ctrl);
extern int func_ov017_021b7230(void *ctrl);
extern void func_ov017_021b302c(void *ctrl);
extern void func_ov017_021b6f10(void *ctrl);
extern void func_02005e04(int bg);
extern void func_02005c84(int bg);

int func_ov017_021b2adc(void) {
    int a = func_ov017_021b32dc(data_ov017_021b8470);
    int b = func_ov017_021b7230(data_ov017_021b8794);
    func_ov017_021b302c(data_ov017_021b8470);
    func_ov017_021b6f10(data_ov017_021b8794);
    b = (a != 0 && b != 0);
    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    return b;
}
