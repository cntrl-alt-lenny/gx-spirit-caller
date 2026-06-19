/* func_ov006_021b5cb4: reset a subobject, copy a 292-byte template into it at
 * +292, then run two more passes; return 1. */
extern void func_ov006_021b7f5c(void *p);
extern void Copy32(void *dst, void *src, int n);
extern void func_ov006_021b8d1c(void *p);
extern void func_ov006_021b8c6c(void *p);
extern char data_0210596c[];
int func_ov006_021b5cb4(char *p) {
    func_ov006_021b7f5c(p);
    Copy32(p + 292, data_0210596c, 292);
    func_ov006_021b8d1c(p);
    func_ov006_021b8c6c(p);
    return 1;
}
