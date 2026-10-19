typedef struct { unsigned int pad0:13; unsigned int lo:1; unsigned int pad1:8; unsigned int hi:8; unsigned int pad2:2; char pad[16]; } Row;
typedef struct { char pad[0x30]; Row rows[5]; char tail[0x7d4]; } Player;
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d0250[];
extern unsigned int data_ov002_022cd4e8[];
extern unsigned int data_ov002_022cd4fc[];

int func_ov002_0225a874(void) {
    unsigned int rowVal;
    unsigned int computed;
    unsigned int tableVal;
    int index;
    Row *row;
    row = &((Row *)(data_ov002_022cf16c + (*(int *)data_ov002_022cd3f4 & 1) * 0x868 + 0x30))[*(int *)(data_ov002_022cd3f4 + 0x1c)];
    computed = row->hi * 2 + row->lo;
    if (*(unsigned int *)(data_ov002_022cd3f4 + 0xec) != computed ||
        *(unsigned int *)(data_ov002_022cd3f4 + 0xf0) != ((unsigned int)*(unsigned short *)(data_ov002_022d0250 + *(unsigned int *)(data_ov002_022cd3f4 + 0xec) * 4) << 17) >> 30)
        return 1;
    if (*(int *)(data_ov002_022cd3f4 + 8) == 0) {
        index = *(int *)(data_ov002_022cd3f4 + 0x20);
        row = &((Row *)(data_ov002_022cf16c + (*(int *)(data_ov002_022cd3f4 + 4) & 1) * 0x868 + 0x30))[index];
        if (data_ov002_022cd4e8[index] != row->hi * 2 + row->lo ||
            data_ov002_022cd4fc[index] != ((unsigned int)*(unsigned short *)(data_ov002_022d0250 + data_ov002_022cd4e8[index] * 4) << 17) >> 30)
            return 1;
    }
    return 0;
}





