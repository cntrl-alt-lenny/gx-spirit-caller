struct slot { unsigned int id : 13; char pad[16]; };
struct side { char hdr[0x30]; struct slot rows[1]; };
extern char data_ov002_022cf16c[];
extern void func_ov002_021d6dbc(int arg0, int arg1);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021d6e70(int arg0, int arg1);
void func_ov002_021d7100(int flag, unsigned short arg1, unsigned short arg2) {
    unsigned char a = arg1;
    int b = (arg1 >> 8) & 0xff;
    unsigned char c = arg2;
    int d = (arg2 >> 8) & 0xff;
    unsigned short id2 = ((struct side *)(data_ov002_022cf16c + (c & 1) * 0x868))->rows[d].id;
    unsigned short id1 = ((struct side *)(data_ov002_022cf16c + (a & 1) * 0x868))->rows[b].id;
    if (id1 == 0 || id2 == 0) return;
    func_ov002_021d6dbc(arg1, arg2);
    func_ov002_021d6dbc(arg2, arg1);
    func_ov002_021d479c((unsigned short)((flag ? 0x8000 : 0) | 0x3e), arg1, arg2, 0);
    func_ov002_021d6e70(arg1, arg2);
    func_ov002_021d6e70(arg2, arg1);
}


