/* func_ov006_021c1574: create a resource into *base, advance state, post a
 * mode (3-bit field from a main table), and run the configure pass; return 1. */
extern int  func_02021174(void *p);
extern void func_02021428(void);
extern void func_020221e0(int a, int b);
extern void func_ov006_021c15cc(int *base);
extern char data_020fd390[];
struct Ov006Mode { int pad; unsigned mode : 3; };
extern struct Ov006Mode data_02104e6c;
int func_ov006_021c1574(int *base) {
    *base = func_02021174(data_020fd390);
    func_02021428();
    func_020221e0(4, data_02104e6c.mode);
    func_ov006_021c15cc(base);
    return 1;
}
