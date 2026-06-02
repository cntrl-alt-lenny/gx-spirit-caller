/* func_ov006_021b47d8: acquire a resource, run two passes, and on success
 * post state 3; return the acquired handle. */
extern int  func_ov006_021c19ec(void *p);
extern void func_ov006_021b4640(void);
extern void func_ov006_021c1cb8(void *p);
extern void func_ov006_021b4668(void);
extern char data_ov006_0225cbb8[];
extern int  data_ov006_0224f290[];
int func_ov006_021b47d8(void) {
    int r = func_ov006_021c19ec(data_ov006_0225cbb8);
    func_ov006_021b4640();
    func_ov006_021c1cb8(data_ov006_0225cbb8);
    func_ov006_021b4668();
    if (r != 0)
        data_ov006_0224f290[0] = 3;
    return r;
}
