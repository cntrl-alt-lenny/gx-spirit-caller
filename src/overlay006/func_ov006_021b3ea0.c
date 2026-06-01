/* func_ov006_021b3ea0: per-state "step" — run the seven fixed per-subobject
 * updates, fire the per-state display-blank "enter", then advance the state
 * word to 1. Returns 1. 0x70 step family, sibling of 021b4e38 (ov006_core.h). */
extern void func_ov006_021cb0a0(void *);
extern void func_ov006_021cac30(void *);
extern void func_ov006_021c9ef4(void *);
extern void func_ov006_021c757c(void *);
extern void func_ov006_021c6990(void *);
extern void func_ov006_021c159c(void *);
extern void func_ov006_021ba090(void *);
extern int  func_ov006_021b3d60(void);
extern char data_ov006_0225e138[], data_ov006_0225e100[], data_ov006_0225e068[],
            data_ov006_0225df3c[], data_ov006_0225de70[], data_ov006_0225cb5c[],
            data_ov006_0225c4dc[];
extern int  data_ov006_0224f248[];
int func_ov006_021b3ea0(void) {
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b3d60();
    data_ov006_0224f248[0] = 1;
    return 1;
}
