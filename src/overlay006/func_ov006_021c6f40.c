/* func_ov006_021c6f40: when the precondition holds, advance the object and post
 * a deferred event; return 1. */
extern int  func_ov006_021c6f24(void);
extern void func_ov006_021c71e0(int *obj, int x);
extern void func_02037208(int a, int b, int c, int d);
int func_ov006_021c6f40(int *obj) {
    if (func_ov006_021c6f24() != 0) {
        func_ov006_021c71e0(obj, 1);
        func_02037208(53, -1, 0, 1);
    }
    return 1;
}
