/* func_ov006_021b3190: kick a subsystem, register a node from a main-table
 * field, run a 6-step init, seed state; return 1. */
extern void func_ov006_021b2eb0(int a);
extern void func_ov006_021b9df8(void *p, int a, int b);
extern void func_ov006_021c1450(void *p);
extern void func_ov006_021c6858(void *p);
extern void func_ov006_021c7450(void *p);
extern void func_ov006_021c9dc8(void *p);
extern void func_ov006_021cab04(void *p);
extern void func_ov006_021caf24(void *p);
extern char data_02103fcc[];
extern char data_ov006_0225c3bc[];
extern char data_ov006_0225ca3c[];
extern char data_ov006_0225dd50[];
extern char data_ov006_0225de1c[];
extern char data_ov006_0225df48[];
extern char data_ov006_0225dfe0[];
extern char data_ov006_0225e018[];
extern int  data_ov006_0224f090[];
int func_ov006_021b3190(void) {
    func_ov006_021b2eb0(1);
    func_ov006_021b9df8(data_ov006_0225c3bc, 1, *(int *)(data_02103fcc + 2992));
    func_ov006_021c1450(data_ov006_0225ca3c);
    func_ov006_021c6858(data_ov006_0225dd50);
    func_ov006_021c7450(data_ov006_0225de1c);
    func_ov006_021c9dc8(data_ov006_0225df48);
    func_ov006_021cab04(data_ov006_0225dfe0);
    func_ov006_021caf24(data_ov006_0225e018);
    data_ov006_0224f090[0] = 4;
    return 1;
}
