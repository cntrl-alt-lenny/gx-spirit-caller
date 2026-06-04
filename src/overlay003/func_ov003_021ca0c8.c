/* func_ov003_021ca0c8: tear down the scene — capture the result of the primary
 * teardown, run the secondary teardown, then disable the two channel pairs (1,2)
 * on both subsystems. Returns the primary teardown's result. (ov003_core.h;
 * ov005 teardown recipe.) */
extern int  func_ov003_021cbe8c(void *);
extern void func_ov003_021cbdf4(void *);
extern void func_02005e20(int);
extern void func_02005ca0(int);
extern char data_ov003_021cf72c[];
int func_ov003_021ca0c8(void) {
    int r = func_ov003_021cbe8c(data_ov003_021cf72c);
    func_ov003_021cbdf4(data_ov003_021cf72c);
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    return r;
}
