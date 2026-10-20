typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Entry;
extern Entry data_ov002_022cdc88[];
extern int func_0202e2c8(int unused0);
extern int func_ov002_021bb950(int self, int arg2);
int func_ov002_0227ee34(int a, int idx) {
    switch (a) {
    case 0x1366: case 0x137d: case 0x15e6:
        switch (data_ov002_022cdc88[idx].id) {
        case 0x1596: return 1;
        case 0x13c3: return a != 0x137d;
        case 0x1914:
            if (func_ov002_021bb950(0, 0x1784) == 0 && func_ov002_021bb950(1, 0x1784) == 0) return 1;
            return 0;
        case 0x1578: return 1;
        }
        break;
    case 0x1335:
        switch (data_ov002_022cdc88[idx].id) { case 0x1835: return 1; }
        break;
    case 0x12e5: case 0x149c: case 0x1920: case 0x1a7e:
        if (data_ov002_022cdc88[idx].id == 0x1956 || data_ov002_022cdc88[idx].id == 0x1981) return 1;
        break;
    case 0x14d2: case 0x1845: case 0x18f7: case 0x196f:
        return func_0202e2c8(a);
    }
    return 0;
}

