/* func_ov005_021acf34: tear down the scene — capture the result of the primary
 * teardown, run the secondary teardown, then disable the two channel pairs (1,2)
 * on both subsystems. Returns the primary teardown's result. (ov005_core.h) */
extern int  func_ov005_021ad284(void *);
extern void func_ov005_021ad35c(void *);
extern void func_02005e20(int);
extern void func_02005ca0(int);
extern char data_ov005_021b1e6c[];
int func_ov005_021acf34(void) {
    int r = func_ov005_021ad284(data_ov005_021b1e6c);
    func_ov005_021ad35c(data_ov005_021b1e6c);
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    return r;
}
