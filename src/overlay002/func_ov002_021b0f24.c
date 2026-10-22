extern unsigned int func_0202b8c0(int id);
extern struct {
    char pad[0xd58];
    int id;
    char pad2[0x10];
    int side;
} data_ov002_022d016c;

int func_ov002_021b0f24(void) {
    if (func_0202b8c0(data_ov002_022d016c.id) == 3) {
        switch (data_ov002_022d016c.id) {
        case 0x130d: case 0x130e: case 0x13f3: case 0x149d: case 0x1842:
            return 1 - data_ov002_022d016c.side;
        default:
            return data_ov002_022d016c.side;
        }
    }
    switch (data_ov002_022d016c.id) {
    case 0xfee: case 0x1238: case 0x12f1: case 0x12f2:
    case 0x1326: case 0x1329: case 0x132a: case 0x1391: case 0x13fe:
    case 0x148d: case 0x1492: case 0x14b9: case 0x14d3:
    case 0x1511: case 0x1537: case 0x1538: case 0x15e4:
    case 0x1612: case 0x1620: case 0x1624: case 0x1690: case 0x1694:
    case 0x16ce: case 0x178e: case 0x184b: case 0x190e: case 0x192d:
    case 0x1945: case 0x1980: case 0x19f1: case 0x1a7c:
        return data_ov002_022d016c.side;
    default:
        return 1 - data_ov002_022d016c.side;
    }
}
