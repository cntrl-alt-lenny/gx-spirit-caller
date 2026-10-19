extern int func_ov006_021c6c2c(void *);
extern int func_ov006_021c50c4(void *);
extern int func_ov006_021b52d0(void);
extern int data_ov006_0225dc34[];
extern char data_ov006_0225deb4[];
extern int data_ov006_0224f330[];
int func_ov006_021b53d4(void) {
    int state = data_ov006_0225dc34[17];
    int value = data_ov006_0225dc34[18];
    func_ov006_021c6c2c(data_ov006_0225deb4);
    func_ov006_021c50c4(data_ov006_0225dc34);
    func_ov006_021b52d0();
    switch (state) {
    case 1:
        data_ov006_0224f330[4] = value;
        data_ov006_0224f330[0] = 5;
        break;
    case 0:
    default:
        data_ov006_0224f330[0] = 1;
        break;
    }
    return 1;
}


