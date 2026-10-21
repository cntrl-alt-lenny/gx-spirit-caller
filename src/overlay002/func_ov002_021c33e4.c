typedef unsigned int u32;
typedef struct { u32 id:13; u32 flag13:1; u32 flag14:1; u32 rest:17; } Entry;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf288[];
extern int func_02030808(int a);
extern int func_0203058c(int a);
extern int func_0202e310(int unused0);
extern int func_ov002_021bbe8c(int arg);
/* Original supplies only r0 and r1 to the four-argument thunk. */
extern int func_ov002_021bb90c();
extern int func_ov002_021bce2c(int self, int key);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
int func_ov002_021c33e4(int a, int b, int c) {
    Entry *p = (Entry *)(data_ov002_022cf16c + (b & 1) * 0x868 + 0x418);
    int id = p[c].id;
    if (func_02030808(id) == 0) return 0;
    if (func_0203058c(id) != 0) {
        if (p[c].flag14 == 0) return 0;
        if (func_0202e310(id) != 0) {
            if (func_ov002_021bbe8c(a) == 0) return 0;
        }
        switch (id) {
        case 0x14fc:
            if (func_ov002_021bb90c(a, 0x1414) == 0) return 0;
            break;
        case 0x1578:
            if ((*(u32 *)(data_ov002_022cf288 + (a & 1) * 0x868) >> 17) & 1) return 0;
            if (func_ov002_021b3ecc(a, 11, 0x12f3) != 0) return 0;
            break;
        }
    } else {
        if (func_ov002_021ca440(a, id) == 0) return 0;
    }
    switch (id) {
    case 0x14b5:
    case 0x1571:
    case 0x15b1:
    case 0x15b4:
    case 0x15f9:
    case 0x15fa:
    case 0x17c7:
    case 0x17c8:
    case 0x1820:
        return 0;
    case 0x14d5:
        if (func_ov002_021bce2c(a, 1) == 0) return 0;
        break;
    }
    if (func_ov002_021ca3f0(a, id) == 0) return 0;
    return 1;
}



