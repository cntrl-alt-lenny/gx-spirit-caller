/* func_ov005_021ace2c: tear down the scene — capture the result of the primary
 * teardown, run the secondary teardown, then disable the two channel pairs (1,2)
 * on both subsystems. Returns the primary teardown's result. (ov005_core.h) */
extern int  func_ov005_021ad17c(void *);
extern void func_ov005_021ad254(void *);
extern void func_02005e04(int);
extern void func_02005c84(int);
extern char data_ov005_021b1d6c[];
int func_ov005_021ace2c(void) {
    int r = func_ov005_021ad17c(data_ov005_021b1d6c);
    func_ov005_021ad254(data_ov005_021b1d6c);
    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    return r;
}
