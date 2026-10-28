typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id : 13; u32 rest : 19; } Id;
extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021bb2cc(int self, int id);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02256720(void) {
    int a, j, i;
    for (i = 0; i < 2; i++) {
        Id *id;
        char *p, *base;
        a = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        base = data_ov002_022cf16c + (a & 1) * 0x868;
        id = (Id *)(base + 0x94);
        p = base + 0x64;
        for (j = 5; j < 10; j++, id += 5, p += 0x14) {
            if (id->id == 0x1760 || id->id == 0x1765) {
                u32 flags = *(u32 *)(p + 0x40);
                u16 active = *(u16 *)(p + 0x38);
                if ((active & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) != 0) {
                    if (func_ov002_021bb2cc(a, 0x173c) == 0) {
                        func_ov002_021de480(a, j, 0, 0);
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}
