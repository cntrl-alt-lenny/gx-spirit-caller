extern void func_ov006_021cb0a0(void *);
extern void func_ov006_021cac30(void *);
extern void func_ov006_021c9ef4(void *);
extern void func_ov006_021c757c(void *);
extern void func_ov006_021c6990(void *);
extern void func_ov006_021c159c(void *);
extern void func_ov006_021ba090(void *);
extern int  func_ov006_021b37bc(void);
extern char data_ov006_0225e138[], data_ov006_0225e100[], data_ov006_0225e068[],
            data_ov006_0225df3c[], data_ov006_0225de70[], data_ov006_0225cb5c[],
            data_ov006_0225c4dc[];
extern int data_ov006_0224f1fc[];

int func_ov006_021b38fc(void) {
    int r4 = *(int *)(data_ov006_0225c4dc + 0x44);

    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b37bc();

    if (r4 == 0) {
        goto L_70;
    }
    if (r4 != 3) {
        goto L_70;
    }
    data_ov006_0224f1fc[3] = 0;
    data_ov006_0224f1fc[0] = 1;
    goto L_80;
L_70:
    data_ov006_0224f1fc[3] = 1;
    data_ov006_0224f1fc[0] = 1;
L_80:
    return 1;
}
