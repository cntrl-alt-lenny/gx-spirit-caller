struct State { char pad[0xd50]; int status; int pad2; unsigned int id; unsigned int value; int pad3[2]; int current; int side; int index; int add; };
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf1a4[];
extern void func_ov002_021d677c(int arg0, int arg1);
extern void func_ov002_021e3354(unsigned int a, unsigned int b, int c);
extern void func_ov002_021e311c(unsigned int a, unsigned int b);

void func_ov002_02258168(int arg)
{
    int side = *(int *)((char *)&data_ov002_022d016c + 0xd70);
    int index = *(int *)((char *)&data_ov002_022d016c + 0xd74) + *(int *)((char *)&data_ov002_022d016c + 0xd78);
    char *base = data_ov002_022cf1a4 + (side & 1) * 0x868;
    int offset = index * 20;
    unsigned int saved = *(unsigned short *)(base + offset);
    unsigned int mode = 3;
    if (saved == 0) {
        mode = 0;
        func_ov002_021d677c(side, index);
        *(unsigned short *)(base + offset) = 1;
    }
    if (arg != 0) {
        func_ov002_021e3354(
            (((unsigned int)side << 31) & 0x80000000) |
            (((unsigned int)(side != *(int *)((char *)&data_ov002_022d016c + 0xd6c)) << 24) & 0x1000000) |
            ((mode << 21) & 0xe00000) |
            (((unsigned int)index << 16) & 0x1f0000) |
            (*(unsigned int *)((char *)&data_ov002_022d016c + 0xd5c) & 0xffff),
            *(unsigned int *)((char *)&data_ov002_022d016c + 0xd60) & 0xffff, arg);
    } else {
        func_ov002_021e311c(
            (((unsigned int)side << 31) & 0x80000000) |
            (((unsigned int)(side != *(int *)((char *)&data_ov002_022d016c + 0xd6c)) << 24) & 0x1000000) |
            ((mode << 21) & 0xe00000) |
            (((unsigned int)index << 16) & 0x1f0000) |
            (*(unsigned int *)((char *)&data_ov002_022d016c + 0xd5c) & 0xffff),
            *(unsigned int *)((char *)&data_ov002_022d016c + 0xd60) & 0xffff);
    }
    *(unsigned short *)(base + offset) = saved;
    data_ov002_022d016c.status = 0;
}




