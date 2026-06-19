/* func_ov006_021b3da0: per-state "step" — run the seven fixed per-subobject
 * updates, fire the per-state display-blank "enter", then advance the state
 * word to 1. Returns 1. 0x70 step family, sibling of 021b4e38 (ov006_core.h). */
extern void func_ov006_021caf94(void *);
extern void func_ov006_021cab24(void *);
extern void func_ov006_021c9de8(void *);
extern void func_ov006_021c7470(void *);
extern void func_ov006_021c6884(void *);
extern void func_ov006_021c1490(void *);
extern void func_ov006_021b9f90(void *);
extern int  func_ov006_021b3c60(void);
extern char data_ov006_0225e018[], data_ov006_0225dfe0[], data_ov006_0225df48[],
            data_ov006_0225de1c[], data_ov006_0225dd50[], data_ov006_0225ca3c[],
            data_ov006_0225c3bc[];
extern int  data_ov006_0224f128[];
int func_ov006_021b3da0(void) {
    func_ov006_021caf94(data_ov006_0225e018);
    func_ov006_021cab24(data_ov006_0225dfe0);
    func_ov006_021c9de8(data_ov006_0225df48);
    func_ov006_021c7470(data_ov006_0225de1c);
    func_ov006_021c6884(data_ov006_0225dd50);
    func_ov006_021c1490(data_ov006_0225ca3c);
    func_ov006_021b9f90(data_ov006_0225c3bc);
    func_ov006_021b3c60();
    data_ov006_0224f128[0] = 1;
    return 1;
}
