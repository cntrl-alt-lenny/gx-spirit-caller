/* func_ov006_021b4718: init-sequence family — kick 021b43d8, register two
 * nodes from 0224f290[5..6], run the 7-step init, seed state 7. */
extern void func_ov006_021b42d8(int a);
extern void func_ov006_021b5e60(void *p);
extern void func_ov006_021b5fa4(void *p, int a, int b);
extern void func_ov006_021b9df8(void *p, int a, int b);
extern void func_ov006_021c1450(void *p);
extern void func_ov006_021c6858(void *p);
extern void func_ov006_021c7450(void *p);
extern void func_ov006_021c9dc8(void *p);
extern void func_ov006_021cab04(void *p);
extern void func_ov006_021caf24(void *p);
extern int  data_ov006_0224f170[];
extern char data_ov006_0224f328[];
extern char data_ov006_0225c3bc[];
extern char data_ov006_0225ca3c[];
extern char data_ov006_0225dd50[];
extern char data_ov006_0225de1c[];
extern char data_ov006_0225df48[];
extern char data_ov006_0225dfe0[];
extern char data_ov006_0225e018[];
int func_ov006_021b4718(void) {
    func_ov006_021b42d8(1);
    func_ov006_021b5e60(data_ov006_0224f328);
    func_ov006_021b5fa4(data_ov006_0224f328, data_ov006_0224f170[5], data_ov006_0224f170[6]);
    func_ov006_021b9df8(data_ov006_0225c3bc, 4, 0);
    func_ov006_021c1450(data_ov006_0225ca3c);
    func_ov006_021c6858(data_ov006_0225dd50);
    func_ov006_021c7450(data_ov006_0225de1c);
    func_ov006_021c9dc8(data_ov006_0225df48);
    func_ov006_021cab04(data_ov006_0225dfe0);
    func_ov006_021caf24(data_ov006_0225e018);
    data_ov006_0224f170[0] = 7;
    return 1;
}
