/* The original passes data pointers to five callees whose current C definitions take no arguments. */
extern int func_ov006_021cb0a0(int *arr);
extern int func_ov006_021cac30(void *p);
extern int func_ov006_021c9ef4(void *p);
extern int func_ov006_021c757c(void *p);
extern int func_ov006_021c6990(void *p);
extern int func_ov006_021c159c(void *p);
extern int func_ov006_021ba090(void *selfv);
extern int func_ov006_021b31d0(void);
extern int data_ov006_0225c4dc[];
extern int data_ov006_0225e138[];
extern char data_ov006_0225e100[];
extern char data_ov006_0225e068[];
extern char data_ov006_0225df3c[];
extern char data_ov006_0225de70[];
extern char data_ov006_0225cb5c[];
extern int data_ov006_0224f1b0[];
int func_ov006_021b3318(void) {
    int mode = data_ov006_0225c4dc[17];
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b31d0();
    if (!(mode == 0 || (mode != 2 && mode != 3))) {
        data_ov006_0224f1b0[3] = 0;
        data_ov006_0224f1b0[0] = 1;
    } else {
        data_ov006_0224f1b0[3] = 1;
        data_ov006_0224f1b0[0] = 1;
    }
    return 1;
}

