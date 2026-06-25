/* Ov013_InitGraphics: bring the overlay's graphics up — reset the core
 * (func_020058b4 / func_ov000_021aae70 / func_ov013_021c9ff8), install the
 * default palette set (func_ov000_021ace2c 0), then power both engines
 * (func_02005c60 1 & 2). (ov013_core.h) */
extern void func_020058b4(void);
extern void func_ov000_021aae70(void);
extern void func_ov013_021c9ff8(void);
extern void func_ov000_021ace2c(int);
extern void func_0202c1ac(void);
extern void func_02005c60(int);
void Ov013_InitGraphics(void) {
    func_020058b4();
    func_ov000_021aae70();
    func_ov013_021c9ff8();
    func_ov000_021ace2c(0);
    func_0202c1ac();
    func_02005c60(1);
    func_02005c60(2);
}
