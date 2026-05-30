/* func_ov006_021b287c: ov006 cf140 state-handler (init + state=7). */
extern void func_ov006_021b2400(int a);
extern void func_ov006_021c19a8(void *p, int v);
extern void func_ov006_021c9ed4(void *p);
extern char data_ov006_021cf140[];
extern char data_ov006_0225cbb8[];
extern char data_ov006_0225e068[];
int func_ov006_021b287c(void) {
    func_ov006_021b2400(0);
    func_ov006_021c19a8(data_ov006_0225cbb8, *(int *)(data_ov006_021cf140 + 12));
    func_ov006_021c9ed4(data_ov006_0225e068);
    *(int *)data_ov006_021cf140 = 7;
    return 1;
}
