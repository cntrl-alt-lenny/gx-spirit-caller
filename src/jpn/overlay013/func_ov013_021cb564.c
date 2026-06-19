/* func_ov013_021cb564: bring the overlay's graphics up — reset the core
 * (func_02005898 / func_ov000_021aad90 / func_ov013_021c9f18), install the
 * default palette set (func_ov000_021acd4c 0), then power both engines
 * (func_02005c44 1 & 2). (ov013_core.h) */
extern void func_02005898(void);
extern void func_ov000_021aad90(void);
extern void func_ov013_021c9f18(void);
extern void func_ov000_021acd4c(int);
extern void func_0202c158(void);
extern void func_02005c44(int);
void func_ov013_021cb564(void) {
    func_02005898();
    func_ov000_021aad90();
    func_ov013_021c9f18();
    func_ov000_021acd4c(0);
    func_0202c158();
    func_02005c44(1);
    func_02005c44(2);
}
