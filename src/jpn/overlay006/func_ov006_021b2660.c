/* func_ov006_021b2660: ov006 cf140 state-handler variant — the same 7-call
 * teardown sequence as the family sibling func_ov006_021b2d5c (family-D
 * enter + the seven 0225xxxx subobject updates), but a flag-gated status
 * write instead of the plain state=5 tail: when data_ov006_0225c3bc's +0x44
 * field reads exactly 1, clear cf140[3] and set cf140[0]=5; any other value
 * sets cf140[0]=1 instead. */
extern void func_ov006_021caf94(void *p);
extern void func_ov006_021cab24(void *p);
extern void func_ov006_021c9de8(void *p);
extern void func_ov006_021c7470(void *p);
extern void func_ov006_021c6884(void *p);
extern void func_ov006_021c1490(void *p);
extern void func_ov006_021b9f90(void *p);
extern void func_ov006_021b2520(void);
extern char data_ov006_0225e018[], data_ov006_0225dfe0[], data_ov006_0225df48[], data_ov006_0225de1c[];
extern char data_ov006_0225dd50[], data_ov006_0225ca3c[], data_ov006_0225c3bc[];
extern int  data_ov006_021cf020[];

int func_ov006_021b2660(void) {
    int flag = *(int *)(data_ov006_0225c3bc + 0x44);
    func_ov006_021caf94(data_ov006_0225e018);
    func_ov006_021cab24(data_ov006_0225dfe0);
    func_ov006_021c9de8(data_ov006_0225df48);
    func_ov006_021c7470(data_ov006_0225de1c);
    func_ov006_021c6884(data_ov006_0225dd50);
    func_ov006_021c1490(data_ov006_0225ca3c);
    func_ov006_021b9f90(data_ov006_0225c3bc);
    func_ov006_021b2520();
    if (flag != 0 && flag == 1) {
        data_ov006_021cf020[3] = 0;
        data_ov006_021cf020[0] = 5;
    } else {
        data_ov006_021cf020[0] = 1;
    }
    return 1;
}
