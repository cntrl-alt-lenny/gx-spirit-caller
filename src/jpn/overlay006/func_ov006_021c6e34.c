/* func_ov006_021c6e34: when the precondition holds, advance the object and post
 * a deferred event; return 1. */
extern int  func_ov006_021c6e18(void);
extern void func_ov006_021c70d4(int *obj, int x);
extern void func_020371b8(int a, int b, int c, int d);
int func_ov006_021c6e34(int *obj) {
    if (func_ov006_021c6e18() != 0) {
        func_ov006_021c70d4(obj, 1);
        func_020371b8(53, -1, 0, 1);
    }
    return 1;
}
