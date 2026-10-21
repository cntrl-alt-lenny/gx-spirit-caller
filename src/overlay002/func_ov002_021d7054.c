struct slot { unsigned int id : 13; char pad[16]; };
struct side { char hdr[0x30]; struct slot rows[1]; };
extern char data_ov002_022cf16c[];
extern void func_ov002_021d6dbc(int arg0, int arg1);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021d6e70(int arg0, int arg1);
void func_ov002_021d7054(unsigned short arg0, unsigned short arg1) {
    int a = arg0 & 0xff;
    int b = (arg0 >> 8) & 0xff;
    int c = arg1 & 0xff;
    int d = (arg1 >> 8) & 0xff;
    if (((struct side *)(data_ov002_022cf16c + (a & 1) * 0x868))->rows[b].id == 0) return;
    if (((struct side *)(data_ov002_022cf16c + (c & 1) * 0x868))->rows[d].id != 0) return;
    func_ov002_021d6dbc(arg0, arg1);
    func_ov002_021d479c((unsigned short)((a ? 0x8000 : 0) | 0x3d), arg0, arg1, 0);
    func_ov002_021d6e70(arg0, arg1);
}
