/* func_ov006_021b5490: init-sequence family — kick 021b50b0, register a node
 * from 0224f330[4], run the 7-step init, seed state 7. */
extern void func_ov006_021b50b0(int a);
extern void func_ov006_021b6250(void *p, int a);
extern void func_ov006_021b9ef8(void *p, int a, int b);
extern void func_ov006_021c155c(void *p);
extern void func_ov006_021c6964(void *p);
extern void func_ov006_021c755c(void *p);
extern void func_ov006_021c9ed4(void *p);
extern void func_ov006_021cac10(void *p);
extern void func_ov006_021cb030(void *p);
extern int  data_ov006_0224f330[];
extern char data_ov006_0224f448[];
extern char data_ov006_0225c4dc[];
extern char data_ov006_0225cb5c[];
extern char data_ov006_0225de70[];
extern char data_ov006_0225df3c[];
extern char data_ov006_0225e068[];
extern char data_ov006_0225e100[];
extern char data_ov006_0225e138[];
int func_ov006_021b5490(void) {
    func_ov006_021b50b0(1);
    func_ov006_021b6250(data_ov006_0224f448, data_ov006_0224f330[4]);
    func_ov006_021b9ef8(data_ov006_0225c4dc, 6, 0);
    func_ov006_021c155c(data_ov006_0225cb5c);
    func_ov006_021c6964(data_ov006_0225de70);
    func_ov006_021c755c(data_ov006_0225df3c);
    func_ov006_021c9ed4(data_ov006_0225e068);
    func_ov006_021cac10(data_ov006_0225e100);
    func_ov006_021cb030(data_ov006_0225e138);
    data_ov006_0224f330[0] = 7;
    return 1;
}
