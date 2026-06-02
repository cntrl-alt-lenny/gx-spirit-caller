/* func_ov006_021c1680: create a resource into *base, advance state, post a
 * mode (3-bit field from a main table), and run the configure pass; return 1. */
extern int  func_020211c8(void *p);
extern void func_0202147c(void);
extern void func_02022234(int a, int b);
extern void func_ov006_021c16d8(int *base);
extern char data_020fd470[];
struct Ov006Mode { int pad; unsigned mode : 3; };
extern struct Ov006Mode data_02104f4c;
int func_ov006_021c1680(int *base) {
    *base = func_020211c8(data_020fd470);
    func_0202147c();
    func_02022234(4, data_02104f4c.mode);
    func_ov006_021c16d8(base);
    return 1;
}
