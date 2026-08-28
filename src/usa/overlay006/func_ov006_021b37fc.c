extern void func_ov006_021caf94(void *);
extern void func_ov006_021cab24(void *);
extern void func_ov006_021c9de8(void *);
extern void func_ov006_021c7470(void *);
extern void func_ov006_021c6884(void *);
extern void func_ov006_021c1490(void *);
extern void func_ov006_021b9f90(void *);
extern int  func_ov006_021b36bc(void);
extern char data_ov006_0225e018[], data_ov006_0225dfe0[], data_ov006_0225df48[],
            data_ov006_0225de1c[], data_ov006_0225dd50[], data_ov006_0225ca3c[],
            data_ov006_0225c3bc[];
extern int data_ov006_0224f0dc[];

int func_ov006_021b37fc(void) {
    int r4 = *(int *)(data_ov006_0225c3bc + 0x44);

    func_ov006_021caf94(data_ov006_0225e018);
    func_ov006_021cab24(data_ov006_0225dfe0);
    func_ov006_021c9de8(data_ov006_0225df48);
    func_ov006_021c7470(data_ov006_0225de1c);
    func_ov006_021c6884(data_ov006_0225dd50);
    func_ov006_021c1490(data_ov006_0225ca3c);
    func_ov006_021b9f90(data_ov006_0225c3bc);
    func_ov006_021b36bc();

    if (r4 == 0) {
        goto L_70;
    }
    if (r4 != 3) {
        goto L_70;
    }
    data_ov006_0224f0dc[3] = 0;
    data_ov006_0224f0dc[0] = 1;
    goto L_80;
L_70:
    data_ov006_0224f0dc[3] = 1;
    data_ov006_0224f0dc[0] = 1;
L_80:
    return 1;
}
