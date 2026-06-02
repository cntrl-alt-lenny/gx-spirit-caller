/* func_ov006_021b4818: init-sequence family — kick 021b43d8, register two
 * nodes from 0224f290[5..6], run the 7-step init, seed state 7. */
extern void func_ov006_021b43d8(int a);
extern void func_ov006_021b5f60(void *p);
extern void func_ov006_021b60a4(void *p, int a, int b);
extern void func_ov006_021b9ef8(void *p, int a, int b);
extern void func_ov006_021c155c(void *p);
extern void func_ov006_021c6964(void *p);
extern void func_ov006_021c755c(void *p);
extern void func_ov006_021c9ed4(void *p);
extern void func_ov006_021cac10(void *p);
extern void func_ov006_021cb030(void *p);
extern int  data_ov006_0224f290[];
extern char data_ov006_0224f448[];
extern char data_ov006_0225c4dc[];
extern char data_ov006_0225cb5c[];
extern char data_ov006_0225de70[];
extern char data_ov006_0225df3c[];
extern char data_ov006_0225e068[];
extern char data_ov006_0225e100[];
extern char data_ov006_0225e138[];
int func_ov006_021b4818(void) {
    func_ov006_021b43d8(1);
    func_ov006_021b5f60(data_ov006_0224f448);
    func_ov006_021b60a4(data_ov006_0224f448, data_ov006_0224f290[5], data_ov006_0224f290[6]);
    func_ov006_021b9ef8(data_ov006_0225c4dc, 4, 0);
    func_ov006_021c155c(data_ov006_0225cb5c);
    func_ov006_021c6964(data_ov006_0225de70);
    func_ov006_021c755c(data_ov006_0225df3c);
    func_ov006_021c9ed4(data_ov006_0225e068);
    func_ov006_021cac10(data_ov006_0225e100);
    func_ov006_021cb030(data_ov006_0225e138);
    data_ov006_0224f290[0] = 7;
    return 1;
}
