/* func_ov006_021b3290: kick a subsystem, register a node from a main-table
 * field, run a 6-step init, seed state; return 1. */
extern void func_ov006_021b2fb0(int a);
extern void func_ov006_021b9ef8(void *p, int a, int b);
extern void func_ov006_021c155c(void *p);
extern void func_ov006_021c6964(void *p);
extern void func_ov006_021c755c(void *p);
extern void func_ov006_021c9ed4(void *p);
extern void func_ov006_021cac10(void *p);
extern void func_ov006_021cb030(void *p);
extern char data_021040ac[];
extern char data_ov006_0225c4dc[];
extern char data_ov006_0225cb5c[];
extern char data_ov006_0225de70[];
extern char data_ov006_0225df3c[];
extern char data_ov006_0225e068[];
extern char data_ov006_0225e100[];
extern char data_ov006_0225e138[];
extern int  data_ov006_0224f1b0[];
int func_ov006_021b3290(void) {
    func_ov006_021b2fb0(1);
    func_ov006_021b9ef8(data_ov006_0225c4dc, 1, *(int *)(data_021040ac + 2992));
    func_ov006_021c155c(data_ov006_0225cb5c);
    func_ov006_021c6964(data_ov006_0225de70);
    func_ov006_021c755c(data_ov006_0225df3c);
    func_ov006_021c9ed4(data_ov006_0225e068);
    func_ov006_021cac10(data_ov006_0225e100);
    func_ov006_021cb030(data_ov006_0225e138);
    data_ov006_0224f1b0[0] = 4;
    return 1;
}
