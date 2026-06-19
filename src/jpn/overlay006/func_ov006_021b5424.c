/* func_ov006_021b5424: run the fixed 8-step subsystem init sequence and seed
 * the shared state words; return 1. */
extern void func_ov006_021caf94(void *p);
extern void func_ov006_021cab24(void *p);
extern void func_ov006_021c9de8(void *p);
extern void func_ov006_021c7470(void *p);
extern void func_ov006_021c6884(void *p);
extern void func_ov006_021c1490(void *p);
extern void func_ov006_021b9f90(void *p);
extern void func_ov006_021b51d0(void);
extern char data_ov006_0225e018[];
extern char data_ov006_0225dfe0[];
extern char data_ov006_0225df48[];
extern char data_ov006_0225de1c[];
extern char data_ov006_0225dd50[];
extern char data_ov006_0225ca3c[];
extern char data_ov006_0225c3bc[];
extern int  data_ov006_0224f210[];
int func_ov006_021b5424(void) {
    func_ov006_021caf94(data_ov006_0225e018);
    func_ov006_021cab24(data_ov006_0225dfe0);
    func_ov006_021c9de8(data_ov006_0225df48);
    func_ov006_021c7470(data_ov006_0225de1c);
    func_ov006_021c6884(data_ov006_0225dd50);
    func_ov006_021c1490(data_ov006_0225ca3c);
    func_ov006_021b9f90(data_ov006_0225c3bc);
    func_ov006_021b51d0();
    data_ov006_0224f210[3] = 1;
    data_ov006_0224f210[0] = 2;
    return 1;
}
