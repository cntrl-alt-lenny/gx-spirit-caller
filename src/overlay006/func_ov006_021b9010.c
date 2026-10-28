extern unsigned short func_0202b0b4(int id);
extern unsigned short func_0202b33c(int id);
extern int func_0202de9c(int unused0);
extern int func_0202b950(int unused0);
extern int func_0202b980(int unused0);
extern unsigned int func_0202b890(int id);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202bb78(int a);
extern unsigned short data_ov006_0224f3e0[];
extern int data_ov006_021cb348[];
extern int data_ov006_021cb370[];
extern int data_ov006_021cb2d8[];
extern int data_ov006_021cb2f4[];
extern unsigned char data_ov006_0225bee0[];

int func_ov006_021b9010(unsigned short *a, unsigned short *b) {
    int id1 = *a;
    int id2 = *b;
    int x, y, k1, k2;
    if (data_ov006_0224f3e0[0] & 1) {
        x = func_0202b33c(id1); y = func_0202b33c(id2);
        if (x != y) return x-y;
    }
    if (data_ov006_0224f3e0[0] & 2) {
        x = func_0202de9c(id1); y = func_0202de9c(id2);
        if (x != y) return x-y;
    }
    if (data_ov006_0224f3e0[0] & 4) {
        x = func_0202de9c(id1); y = func_0202de9c(id2);
        if (x == 7) k1 = 0xfe; else if (x == 8) k1 = 0xff; else k1 = 0;
        if (y == 7) k2 = 0xfe; else if (y == 8) k2 = 0xff; else k2 = 0;
        if (k1 != k2) return k1-k2;
        if (k1 == 0) {
            x = (short)func_0202b950(id1); y = (short)func_0202b950(id2);
            if (x != y) return y-x;
        }
    }
    if (data_ov006_0224f3e0[0] & 8) {
        x = func_0202de9c(id1); y = func_0202de9c(id2);
        if (x == 7) k1 = 0xfe; else if (x == 8) k1 = 0xff; else k1 = 0;
        if (y == 7) k2 = 0xfe; else if (y == 8) k2 = 0xff; else k2 = 0;
        if (k1 != k2) return k1-k2;
        if (k1 == 0) {
            x = (short)func_0202b980(id1); y = (short)func_0202b980(id2);
            if (x != y) return y-x;
        }
    }
    if (data_ov006_0224f3e0[0] & 0x10) {
        x = func_0202b890(id1); y = func_0202b890(id2);
        x = data_ov006_021cb348[x]; y = data_ov006_021cb348[y];
        if (x != y) return x-y;
    }
    if (data_ov006_0224f3e0[0] & 0x20) {
        x = func_0202b878(id1); y = func_0202b878(id2);
        x = data_ov006_021cb370[x]; y = data_ov006_021cb370[y];
        if (x != y) return x-y;
    }
    if (data_ov006_0224f3e0[0] & 0x40) {
        x = func_0202b8a8(id1); y = func_0202b8a8(id2);
        if (x != y) return y-x;
    }
    if (data_ov006_0224f3e0[0] & 0x80) {
        x = func_0202de9c(id1); y = func_0202de9c(id2);
        if (x == 7) k1 = -2; else if (x == 8) k1 = -1; else k1 = x;
        if (y == 7) k2 = -2; else if (y == 8) k2 = -1; else k2 = y;
        if (k1 != k2) return k1-k2;
        if (x == 7) {
            x = func_0202b8c0(id1); y = func_0202b8c0(id2);
            x = data_ov006_021cb2d8[x]; y = data_ov006_021cb2d8[y];
            if (x != y) return x-y;
        } else if (x == 8) {
            x = func_0202b8c0(id1); y = func_0202b8c0(id2);
            x = data_ov006_021cb2f4[x]; y = data_ov006_021cb2f4[y];
            if (x != y) return x-y;
        }
    }
    if (data_ov006_0224f3e0[0] & 0x100) {
        x = data_ov006_0225bee0[func_0202b0b4(id1)]; y = data_ov006_0225bee0[func_0202b0b4(id2)];
        if (x != y) return x-y;
    }
    if (data_ov006_0224f3e0[0] & 0x200) {
        x = func_0202bb78(id1) != 0; y = func_0202bb78(id2) != 0;
        if (x != y) return y-x;
    }
    if (data_ov006_0224f3e0[0] & 0x4000) {
        x = func_0202de9c(id1); y = func_0202de9c(id2);
        if (x != y) return x-y;
    }
    if (data_ov006_0224f3e0[0] & 0x8000) {
        x = func_0202b33c(id1); y = func_0202b33c(id2);
        if (x != y) return x-y;
    }
    return id1-id2;
}
