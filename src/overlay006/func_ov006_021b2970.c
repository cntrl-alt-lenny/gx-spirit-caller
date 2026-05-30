/* func_ov006_021b2970: cf140-guard multi-call (brief 270 16/16). gotcha 1 return r. */
extern int func_ov006_021c19ec(void *);
extern void func_ov006_021b2668(void);
extern void func_ov006_021c1cb8(void *);
extern void func_ov006_021b2690(void);
extern char data_ov006_0225cbb8[];
extern int data_ov006_021cf140;
int func_ov006_021b2970(void) {
    int r = func_ov006_021c19ec(data_ov006_0225cbb8);
    func_ov006_021b2668();
    func_ov006_021c1cb8(data_ov006_0225cbb8);
    func_ov006_021b2690();
    if (r) data_ov006_021cf140 = 6;
    return r;
}
