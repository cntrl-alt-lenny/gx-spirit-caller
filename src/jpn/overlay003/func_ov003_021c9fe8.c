/* func_ov003_021c9fe8: tear down the scene — capture the result of the primary
 * teardown, run the secondary teardown, then disable the two channel pairs (1,2)
 * on both subsystems. Returns the primary teardown's result. (ov003_core.h;
 * ov005 teardown recipe.) */
extern int  func_ov003_021cbd3c(void *);
extern void func_ov003_021cbca4(void *);
extern void func_02005e04(int);
extern void func_02005c84(int);
extern char data_ov003_021cf5ec[];
int func_ov003_021c9fe8(void) {
    int r = func_ov003_021cbd3c(data_ov003_021cf5ec);
    func_ov003_021cbca4(data_ov003_021cf5ec);
    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    return r;
}
