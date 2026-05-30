/* func_ov006_021b2cbc: ov006 cf140 state-handler (setup seq + state=16). */
extern void func_ov006_021b2400(int a);
extern void func_ov006_021b5f60(void *p);
extern void func_ov006_021b60a4(void *p, int a, int b);
extern void func_ov006_021b9ef8(void *p, int a, int b);
extern void func_ov006_021c155c(void *p);
extern void func_ov006_021c6964(void *p);
extern void func_ov006_021c755c(void *p);
extern void func_ov006_021c9ed4(void *p);
extern void func_ov006_021cac10(void *p);
extern void func_ov006_021cb030(void *p);
extern char data_ov006_021cf140[];
extern char data_ov006_0224f448[], data_ov006_0225c4dc[], data_ov006_0225cb5c[], data_ov006_0225de70[];
extern char data_ov006_0225df3c[], data_ov006_0225e068[], data_ov006_0225e100[], data_ov006_0225e138[];
int func_ov006_021b2cbc(void) {
    func_ov006_021b2400(1);
    func_ov006_021b5f60(data_ov006_0224f448);
    func_ov006_021b60a4(data_ov006_0224f448, *(int *)(data_ov006_021cf140 + 16), *(int *)(data_ov006_021cf140 + 20));
    func_ov006_021b9ef8(data_ov006_0225c4dc, 4, 0);
    func_ov006_021c155c(data_ov006_0225cb5c);
    func_ov006_021c6964(data_ov006_0225de70);
    func_ov006_021c755c(data_ov006_0225df3c);
    func_ov006_021c9ed4(data_ov006_0225e068);
    func_ov006_021cac10(data_ov006_0225e100);
    func_ov006_021cb030(data_ov006_0225e138);
    *(int *)data_ov006_021cf140 = 16;
    return 1;
}
