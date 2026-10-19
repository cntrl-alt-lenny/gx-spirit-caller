extern int data_ov002_022cd744[];
typedef struct {
    char pad[0xd44];
    int field_d44;
    char pad2[0x54];
    int field_d9c;
} State;
typedef struct {
    char pad[0xb0];
    unsigned short field_b0;
} Output;
extern State data_ov002_022d016c;
extern Output data_ov002_022d0e6c;
extern int func_0202b100(int a0);
extern void func_ov002_021ae430(int a, const char *src);
extern int func_ov002_021f4260(int a, int b);

int func_ov002_0226a284(int a, int b, int c) {
    if (data_ov002_022cd744[a] == 1) return 1;
    if (data_ov002_022d016c.field_d9c == 0) {
        switch (b) {
        case 0x1368:
        case 0x1568:
        case 0x1590:
        case 0x1593:
        case 0x15de:
        case 0x169d:
        case 0x16d3:
        case 0x1803:
        case 0x1a7e:
            func_ov002_021ae430(a, (const char *)func_0202b100(c));
            break;
        default:
            func_ov002_021ae430(a, (const char *)func_ov002_021f4260(b, c));
            break;
        }
        data_ov002_022d016c.field_d9c++;
        return 0;
    } else {
        data_ov002_022d0e6c.field_b0 = data_ov002_022d016c.field_d44;
        return 1;
    }
}
