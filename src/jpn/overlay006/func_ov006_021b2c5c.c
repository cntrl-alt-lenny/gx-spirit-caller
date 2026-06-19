/* func_ov006_021b2c5c: ov006 cf140 state-handler (teardown seq + state=5). */
extern void func_ov006_021caf94(void *p);
extern void func_ov006_021cab24(void *p);
extern void func_ov006_021c9de8(void *p);
extern void func_ov006_021c7470(void *p);
extern void func_ov006_021c6884(void *p);
extern void func_ov006_021c1490(void *p);
extern void func_ov006_021b9f90(void *p);
extern void func_ov006_021b5ee4(void *p);
extern void func_ov006_021b2520(void);
extern char data_ov006_021cf020[];
extern char data_ov006_0225e018[], data_ov006_0225dfe0[], data_ov006_0225df48[], data_ov006_0225de1c[];
extern char data_ov006_0225dd50[], data_ov006_0225ca3c[], data_ov006_0225c3bc[], data_ov006_0224f328[];
int func_ov006_021b2c5c(void) {
    func_ov006_021caf94(data_ov006_0225e018);
    func_ov006_021cab24(data_ov006_0225dfe0);
    func_ov006_021c9de8(data_ov006_0225df48);
    func_ov006_021c7470(data_ov006_0225de1c);
    func_ov006_021c6884(data_ov006_0225dd50);
    func_ov006_021c1490(data_ov006_0225ca3c);
    func_ov006_021b9f90(data_ov006_0225c3bc);
    func_ov006_021b5ee4(data_ov006_0224f328);
    func_ov006_021b2520();
    *(int *)(data_ov006_021cf020 + 12) = 1;
    *(int *)data_ov006_021cf020 = 5;
    return 1;
}
