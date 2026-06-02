/* func_ov006_021b5db4: reset a subobject, copy a 292-byte template into it at
 * +292, then run two more passes; return 1. */
extern void func_ov006_021b805c(void *p);
extern void Copy32(void *dst, void *src, int n);
extern void func_ov006_021b8e1c(void *p);
extern void func_ov006_021b8d6c(void *p);
extern char data_02105a4c[];
int func_ov006_021b5db4(char *p) {
    func_ov006_021b805c(p);
    Copy32(p + 292, data_02105a4c, 292);
    func_ov006_021b8e1c(p);
    func_ov006_021b8d6c(p);
    return 1;
}
