/* func_ov006_021b5390: init-sequence family — kick 021b50b0, register a node
 * from 0224f330[4], run the 7-step init, seed state 7. */
extern void func_ov006_021b4fb0(int a);
extern void func_ov006_021b6150(void *p, int a);
extern void func_ov006_021b9df8(void *p, int a, int b);
extern void func_ov006_021c1450(void *p);
extern void func_ov006_021c6858(void *p);
extern void func_ov006_021c7450(void *p);
extern void func_ov006_021c9dc8(void *p);
extern void func_ov006_021cab04(void *p);
extern void func_ov006_021caf24(void *p);
extern int  data_ov006_0224f210[];
extern char data_ov006_0224f328[];
extern char data_ov006_0225c3bc[];
extern char data_ov006_0225ca3c[];
extern char data_ov006_0225dd50[];
extern char data_ov006_0225de1c[];
extern char data_ov006_0225df48[];
extern char data_ov006_0225dfe0[];
extern char data_ov006_0225e018[];
int func_ov006_021b5390(void) {
    func_ov006_021b4fb0(1);
    func_ov006_021b6150(data_ov006_0224f328, data_ov006_0224f210[4]);
    func_ov006_021b9df8(data_ov006_0225c3bc, 6, 0);
    func_ov006_021c1450(data_ov006_0225ca3c);
    func_ov006_021c6858(data_ov006_0225dd50);
    func_ov006_021c7450(data_ov006_0225de1c);
    func_ov006_021c9dc8(data_ov006_0225df48);
    func_ov006_021cab04(data_ov006_0225dfe0);
    func_ov006_021caf24(data_ov006_0225e018);
    data_ov006_0224f210[0] = 7;
    return 1;
}
