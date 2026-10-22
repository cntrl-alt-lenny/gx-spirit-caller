extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern unsigned int func_0202b8a8(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202bbdc(int a);
extern int func_0202de9c(int unused0);
extern int func_ov006_021b8d9c(int id, int slot);
extern unsigned short data_ov006_0224f3e0[];
extern short data_ov006_0224f400[][7];
extern short data_ov006_0224f402[][7];
extern short data_ov006_0224f404[][7];
extern short data_ov006_0224f406[][7];
extern short data_ov006_0224f408[][7];
extern short data_ov006_0224f40a[][7];
extern short data_ov006_0224f40c[][7];
extern int data_ov006_021cb310[];
extern int data_ov006_021cb32c[];

int func_ov006_021b9a00(int index, int id) {
    int value;
    int kind;
    if (data_ov006_0224f3e0[1] & 1) {
        value = func_0202bbdc(id);
        if (value != data_ov006_0224f400[index][0]) return 0;
    }
    if (data_ov006_0224f3e0[1] & 2) {
        value = func_0202de9c(id);
        switch (data_ov006_0224f402[index][0]) {
        case 0xf0:
            if (value != 0 && value != 1) return 0;
            break;
        case 0xf1:
            if (value != 7 && value != 8) return 0;
            break;
        default:
            if (value != data_ov006_0224f402[index][0]) return 0;
            break;
        }
    }
    if (data_ov006_0224f3e0[1] & 4) {
        value = func_0202b8a8(id);
        switch (data_ov006_0224f404[index][0]) {
        case 0:
            if (value < 1 || value > 4) return 0;
            break;
        case 1:
            if (value < 5 || value > 6) return 0;
            break;
        case 2:
            if (value < 7) return 0;
            break;
        }
    }
    if (data_ov006_0224f3e0[1] & 8) {
        value = func_0202b890(id);
        if (value != data_ov006_0224f406[index][0]) return 0;
    }
    if (data_ov006_0224f3e0[1] & 0x10) {
        value = func_0202b878(id);
        if (value != data_ov006_0224f408[index][0]) return 0;
    }
    if (data_ov006_0224f3e0[1] & 0x20) {
        kind = func_0202de9c(id);
        value = func_0202b8c0(id);
        if (kind == 7) {
            if (data_ov006_021cb310[value] != data_ov006_0224f40a[index][0]) return 0;
        } else if (kind == 8) {
            if (data_ov006_021cb32c[value] != data_ov006_0224f40a[index][0]) return 0;
        } else return 0;
    }
    if (data_ov006_0224f3e0[1] & 0x40) {
        if (func_ov006_021b8d9c(id, data_ov006_0224f40c[index][0]) == 0) return 0;
    }
    return 1;
}
