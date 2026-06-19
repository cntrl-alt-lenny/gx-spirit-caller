/* func_ov006_021b2bbc: ov006 cf140 state-handler (setup seq + state=16). */
extern void func_ov006_021b2300(int a);
extern void func_ov006_021b5e60(void *p);
extern void func_ov006_021b5fa4(void *p, int a, int b);
extern void func_ov006_021b9df8(void *p, int a, int b);
extern void func_ov006_021c1450(void *p);
extern void func_ov006_021c6858(void *p);
extern void func_ov006_021c7450(void *p);
extern void func_ov006_021c9dc8(void *p);
extern void func_ov006_021cab04(void *p);
extern void func_ov006_021caf24(void *p);
extern char data_ov006_021cf020[];
extern char data_ov006_0224f328[], data_ov006_0225c3bc[], data_ov006_0225ca3c[], data_ov006_0225dd50[];
extern char data_ov006_0225de1c[], data_ov006_0225df48[], data_ov006_0225dfe0[], data_ov006_0225e018[];
int func_ov006_021b2bbc(void) {
    func_ov006_021b2300(1);
    func_ov006_021b5e60(data_ov006_0224f328);
    func_ov006_021b5fa4(data_ov006_0224f328, *(int *)(data_ov006_021cf020 + 16), *(int *)(data_ov006_021cf020 + 20));
    func_ov006_021b9df8(data_ov006_0225c3bc, 4, 0);
    func_ov006_021c1450(data_ov006_0225ca3c);
    func_ov006_021c6858(data_ov006_0225dd50);
    func_ov006_021c7450(data_ov006_0225de1c);
    func_ov006_021c9dc8(data_ov006_0225df48);
    func_ov006_021cab04(data_ov006_0225dfe0);
    func_ov006_021caf24(data_ov006_0225e018);
    *(int *)data_ov006_021cf020 = 16;
    return 1;
}
