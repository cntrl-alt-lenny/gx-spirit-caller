/* func_ov006_021b543c: 6-step setup over two subobjects; on success post
 * state 3; return the first step's result. */
extern int  func_ov006_021c50cc(void *p);
extern void func_ov006_021c6c34(void *p);
extern void func_ov006_021b5318(void);
extern void func_ov006_021c52b0(void *p);
extern void func_ov006_021c6c78(void *p);
extern void func_ov006_021b5340(void);
extern char data_ov006_0225dc34[];
extern char data_ov006_0225deb4[];
extern int  data_ov006_0224f330[];
int func_ov006_021b543c(void) {
    int r = func_ov006_021c50cc(data_ov006_0225dc34);
    func_ov006_021c6c34(data_ov006_0225deb4);
    func_ov006_021b5318();
    func_ov006_021c52b0(data_ov006_0225dc34);
    func_ov006_021c6c78(data_ov006_0225deb4);
    func_ov006_021b5340();
    if (r != 0)
        data_ov006_0224f330[0] = 3;
    return r;
}
