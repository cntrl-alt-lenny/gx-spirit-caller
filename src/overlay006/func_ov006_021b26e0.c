/* func_ov006_021b26e0: ov006 cf140 state-handler (init sequence + state=4). */
extern void func_ov006_021b2400(int a);
extern void func_ov006_021b9ef8(void *p, int a, int b);
extern void func_ov006_021c155c(void *p);
extern void func_ov006_021c6964(void *p);
extern void func_ov006_021c755c(void *p);
extern void func_ov006_021c9ed4(void *p);
extern void func_ov006_021cac10(void *p);
extern void func_ov006_021cb030(void *p);
extern char data_ov006_021cf140[];
extern char data_ov006_0225c4dc[], data_ov006_0225cb5c[], data_ov006_0225de70[];
extern char data_ov006_0225df3c[], data_ov006_0225e068[], data_ov006_0225e100[], data_ov006_0225e138[];
int func_ov006_021b26e0(void) {
    func_ov006_021b2400(1);
    func_ov006_021b9ef8(data_ov006_0225c4dc, 0, 0);
    func_ov006_021c155c(data_ov006_0225cb5c);
    func_ov006_021c6964(data_ov006_0225de70);
    func_ov006_021c755c(data_ov006_0225df3c);
    func_ov006_021c9ed4(data_ov006_0225e068);
    func_ov006_021cac10(data_ov006_0225e100);
    func_ov006_021cb030(data_ov006_0225e138);
    *(int *)data_ov006_021cf140 = 4;
    return 1;
}
