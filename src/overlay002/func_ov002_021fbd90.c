typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    char pad4[4];
    unsigned short field8;
} S021fbd90;

typedef struct {
    char pad[0x5b4];
    int state;
} D022ce288;

typedef struct {
    char pad[0xd44];
    unsigned int count;
} D022d016c;

extern D022ce288 data_ov002_022ce288;
extern D022d016c data_ov002_022d016c;

extern void func_ov002_021ae400(int, int);
extern void func_ov002_021af9d0(int, int, int, int);
extern int func_ov002_021b004c(int);
extern void func_ov002_021d8128(int, int, int);
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();

int func_ov002_021fbd90(S021fbd90 *p) {
    unsigned int i;
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(p->bit0, 0x56);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(p->bit0, 0x47, *(unsigned short *)p, 0);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_021e2b3c();
        for (i = 0; i < data_ov002_022d016c.count; i++) {
            func_ov002_021d8128(p->bit0, func_ov002_021b004c(i + 1), 0);
        }
        func_ov002_021e2c5c();
        p->field8 = data_ov002_022d016c.count;
        return 1;
    }
    return 1;
}
