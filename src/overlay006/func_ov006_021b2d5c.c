/* func_ov006_021b2d5c: ov006 cf140 state-handler (teardown seq + state=5). */
extern void func_ov006_021cb0a0(void *p);
extern void func_ov006_021cac30(void *p);
extern void func_ov006_021c9ef4(void *p);
extern void func_ov006_021c757c(void *p);
extern void func_ov006_021c6990(void *p);
extern void func_ov006_021c159c(void *p);
extern void func_ov006_021ba090(void *p);
extern void func_ov006_021b5fe4(void *p);
extern void func_ov006_021b2620(void);
extern char data_ov006_021cf140[];
extern char data_ov006_0225e138[], data_ov006_0225e100[], data_ov006_0225e068[], data_ov006_0225df3c[];
extern char data_ov006_0225de70[], data_ov006_0225cb5c[], data_ov006_0225c4dc[], data_ov006_0224f448[];
int func_ov006_021b2d5c(void) {
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b5fe4(data_ov006_0224f448);
    func_ov006_021b2620();
    *(int *)(data_ov006_021cf140 + 12) = 1;
    *(int *)data_ov006_021cf140 = 5;
    return 1;
}
