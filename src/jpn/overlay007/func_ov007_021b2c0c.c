/* func_ov007_021b2c0c: initialise control block a0 — open its data file
 * (func_02021174 on data_020f7920) into *a0, prime the subsystem
 * (func_02021428), and reset the cursor record at a0+0x24. Returns 1.
 */

extern int func_02021174(void *a);
extern void func_02021428(void);
extern void func_02022228(int a, void *b);
extern char data_020f7920[];

int func_ov007_021b2c0c(char *a0) {
    *(int *)a0 = func_02021174(data_020f7920);
    func_02021428();
    func_02022228(0, a0 + 0x24);
    return 1;
}
