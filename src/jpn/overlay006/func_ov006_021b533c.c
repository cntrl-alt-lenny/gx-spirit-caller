/* func_ov006_021b533c: 6-step setup over two subobjects; on success post
 * state 3; return the first step's result. */
extern int  func_ov006_021c4fc0(void *p);
extern void func_ov006_021c6b28(void *p);
extern void func_ov006_021b5218(void);
extern void func_ov006_021c51a4(void *p);
extern void func_ov006_021c6b6c(void *p);
extern void func_ov006_021b5240(void);
extern char data_ov006_0225db14[];
extern char data_ov006_0225dd94[];
extern int  data_ov006_0224f210[];
int func_ov006_021b533c(void) {
    int r = func_ov006_021c4fc0(data_ov006_0225db14);
    func_ov006_021c6b28(data_ov006_0225dd94);
    func_ov006_021b5218();
    func_ov006_021c51a4(data_ov006_0225db14);
    func_ov006_021c6b6c(data_ov006_0225dd94);
    func_ov006_021b5240();
    if (r != 0)
        data_ov006_0224f210[0] = 3;
    return r;
}
