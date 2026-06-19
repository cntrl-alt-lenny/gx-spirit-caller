/* func_ov006_021b2870: cf140-guard multi-call (brief 270 16/16). gotcha 1 return r. */
extern int func_ov006_021c18e0(void *);
extern void func_ov006_021b2568(void);
extern void func_ov006_021c1bac(void *);
extern void func_ov006_021b2590(void);
extern char data_ov006_0225ca98[];
extern int data_ov006_021cf020;
int func_ov006_021b2870(void) {
    int r = func_ov006_021c18e0(data_ov006_0225ca98);
    func_ov006_021b2568();
    func_ov006_021c1bac(data_ov006_0225ca98);
    func_ov006_021b2590();
    if (r) data_ov006_021cf020 = 6;
    return r;
}
