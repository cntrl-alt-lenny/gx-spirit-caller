/* func_ov006_021b5524: run the fixed 8-step subsystem init sequence and seed
 * the shared state words; return 1. */
extern void func_ov006_021cb0a0(void *p);
extern void func_ov006_021cac30(void *p);
extern void func_ov006_021c9ef4(void *p);
extern void func_ov006_021c757c(void *p);
extern void func_ov006_021c6990(void *p);
extern void func_ov006_021c159c(void *p);
extern void func_ov006_021ba090(void *p);
extern void func_ov006_021b52d0(void);
extern char data_ov006_0225e138[];
extern char data_ov006_0225e100[];
extern char data_ov006_0225e068[];
extern char data_ov006_0225df3c[];
extern char data_ov006_0225de70[];
extern char data_ov006_0225cb5c[];
extern char data_ov006_0225c4dc[];
extern int  data_ov006_0224f330[];
int func_ov006_021b5524(void) {
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b52d0();
    data_ov006_0224f330[3] = 1;
    data_ov006_0224f330[0] = 2;
    return 1;
}
