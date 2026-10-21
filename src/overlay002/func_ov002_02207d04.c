typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
typedef struct { u32 id : 13; u32 rest : 19; } Card;
extern int data_ov002_022cd3f4;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
int func_ov002_02207d04(S021ff3bc *p, int unused1) {
    u32 i, count;
    int id;
    if (((u32)(*(u16 *)((char *)p + 2) << 20) >> 26) != 0x12) return 0;
    if (*(int *)((char *)p + 0x14) == 0) return 0;
    if (data_ov002_022cd3f4 == p->bit0) return 0;
    if (func_ov002_021ff3bc(p, unused1) == 0) return 0;
    count = *(u32 *)(data_ov002_022cf178 + (p->bit0 & 1) * 0x868);
    for (i = 0; i < count; i++) {
        id = ((Card *)(data_ov002_022cf16c + (p->bit0 & 1) * 0x868 + 0x120))[i].id;
        if (func_0202e234(id) != 0) {
            if (func_ov002_021ca440(p->bit0, id) != 0) return 1;
        }
        count = *(u32 *)(data_ov002_022cf16c + (p->bit0 & 1) * 0x868 + 0xc);
    }
    return 0;
}



