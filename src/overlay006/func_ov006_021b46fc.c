extern int func_ov006_021c9ef4(void *);
extern int func_ov006_021c19e4(void *);
extern int func_ov006_021b45f8(void);
extern unsigned int data_ov006_0225cbb8[];
extern char data_ov006_0225e068[];
extern int data_ov006_0224f290[];
int func_ov006_021b46fc(void) {
    unsigned int state = data_ov006_0225cbb8[20];
    unsigned int value = data_ov006_0225cbb8[21];
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c19e4(data_ov006_0225cbb8);
    func_ov006_021b45f8();
    switch (state) {
    case 3:
        data_ov006_0224f290[5] = (unsigned short)(value >> 16);
        data_ov006_0224f290[6] = (unsigned short)value;
        data_ov006_0224f290[0] = 5;
        break;
    case 4:
        data_ov006_0224f290[5] = (unsigned short)(value >> 16);
        data_ov006_0224f290[6] = (unsigned short)value;
        data_ov006_0224f290[0] = 1;
        break;
    case 5:
        data_ov006_0224f290[5] = -1;
        data_ov006_0224f290[6] = -1;
        data_ov006_0224f290[0] = 1;
        break;
    case 0:
    case 1:
    case 2:
    default:
        data_ov006_0224f290[0] = 1;
        break;
    }
    return 1;
}

