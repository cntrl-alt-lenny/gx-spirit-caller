/* func_ov006_021b6594: optionally reset+seed a subobject (when flag set), then
 * run the standard pass; return 1. (021b805c setup family — guarded.) */
extern void func_ov006_021b7f5c(void *p);
extern void func_02012420(int z, void *p);
extern void func_ov006_021b8c6c(void *p);
int func_ov006_021b6594(char *p, int flag) {
    if (flag != 0) {
        func_ov006_021b7f5c(p);
        func_02012420(0, p + 292);
    }
    func_ov006_021b8c6c(p);
    return 1;
}
