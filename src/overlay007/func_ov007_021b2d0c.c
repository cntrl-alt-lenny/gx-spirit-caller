/* func_ov007_021b2d0c: initialise control block a0 — open its data file
 * (func_020211c8 on data_020f7a00) into *a0, prime the subsystem
 * (func_0202147c), and reset the cursor record at a0+0x24. Returns 1.
 */

extern int func_020211c8(void *a);
extern void func_0202147c(void);
extern void func_0202227c(int a, void *b);
extern char data_020f7a00[];

int func_ov007_021b2d0c(char *a0) {
    *(int *)a0 = func_020211c8(data_020f7a00);
    func_0202147c();
    func_0202227c(0, a0 + 0x24);
    return 1;
}
