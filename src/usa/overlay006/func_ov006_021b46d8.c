/* func_ov006_021b46d8: acquire a resource, run two passes, and on success
 * post state 3; return the acquired handle. */
extern int  func_ov006_021c18e0(void *p);
extern void func_ov006_021b4540(void);
extern void func_ov006_021c1bac(void *p);
extern void func_ov006_021b4568(void);
extern char data_ov006_0225ca98[];
extern int  data_ov006_0224f170[];
int func_ov006_021b46d8(void) {
    int r = func_ov006_021c18e0(data_ov006_0225ca98);
    func_ov006_021b4540();
    func_ov006_021c1bac(data_ov006_0225ca98);
    func_ov006_021b4568();
    if (r != 0)
        data_ov006_0224f170[0] = 3;
    return r;
}
