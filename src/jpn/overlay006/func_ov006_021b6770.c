/* func_ov006_021b6770: run a fixed 3-step setup over a subobject; return 1. */
extern void func_ov006_021b7f5c(void *p);
extern void func_02012420(int z, void *p);
extern void func_ov006_021b8c6c(void *p);
int func_ov006_021b6770(char *p) {
    func_ov006_021b7f5c(p);
    func_02012420(0, p + 292);
    func_ov006_021b8c6c(p);
    return 1;
}
