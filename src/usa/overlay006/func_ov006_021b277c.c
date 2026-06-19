/* func_ov006_021b277c: ov006 cf140 state-handler (init + state=7). */
extern void func_ov006_021b2300(int a);
extern void func_ov006_021c189c(void *p, int v);
extern void func_ov006_021c9dc8(void *p);
extern char data_ov006_021cf020[];
extern char data_ov006_0225ca98[];
extern char data_ov006_0225df48[];
int func_ov006_021b277c(void) {
    func_ov006_021b2300(0);
    func_ov006_021c189c(data_ov006_0225ca98, *(int *)(data_ov006_021cf020 + 12));
    func_ov006_021c9dc8(data_ov006_0225df48);
    *(int *)data_ov006_021cf020 = 7;
    return 1;
}
