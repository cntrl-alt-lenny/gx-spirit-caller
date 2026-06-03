/* func_ov015_021b3578: build the two printer handles (index 0 and 1) onto a
 * scratch config, writing each opened handle to its out-param. (ov015) */
extern void func_ov015_021b3528(void *, int);
extern int  func_02006c0c(void *, int, int);
void func_ov015_021b3578(int *out0, int *out1) {
    char cfg[0x40];
    func_ov015_021b3528(cfg, 0);
    *out0 = func_02006c0c(cfg, 4, 0);
    func_ov015_021b3528(cfg, 1);
    *out1 = func_02006c0c(cfg, 4, 0);
}
