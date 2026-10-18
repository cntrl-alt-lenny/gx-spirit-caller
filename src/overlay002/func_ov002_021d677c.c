struct slot { unsigned int id : 13; unsigned int pad : 19; char pad2[16]; };
struct side { char hdr[0x30]; struct slot rows[1]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021d479c(int a, int b, int c, int d);
void func_ov002_021d677c(int arg0, int arg1) {
    int off = (arg0 & 1) * 0x868;
    struct side *s = (struct side *)(data_ov002_022cf16c + off);
    int roff = arg1 * 20;
    if (s->rows[arg1].id == 0)
        return;
    func_ov002_021d479c((unsigned short)((arg0 ? 0x8000 : 0) | 0x35),
                        (unsigned short)arg1,
                        (unsigned short)(*(unsigned short *)(data_ov002_022cf1a4 + off + roff) == 0), 4);
}
