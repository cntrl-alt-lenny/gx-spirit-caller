typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    unsigned short pad4 : 6;
    unsigned short f4 : 9;
    unsigned short pad15 : 1;
} S0220898c;

extern char data_ov002_022cf17c[];
extern int func_ov002_021ca698(int, int);
extern int func_ov002_021b99b4(int, int);
extern int func_ov002_021ca2b8();
extern int func_ov002_0223f6c4(S0220898c *);
extern int func_ov002_022536e8(int, unsigned short, int);

int func_ov002_0220898c(S0220898c *p) {
    if (func_ov002_021ca698(p->bit0, p->bit0) == 0) {
        return 0;
    }
    if (func_ov002_021b99b4(p->bit0, p->f4) < 0) {
        return 0;
    }
    if (func_ov002_021ca2b8(p->bit0) == 0) {
        return 0;
    }
    if (*(int *)(data_ov002_022cf17c + (p->bit0 & 1) * 0x868) == 0) {
        int r = func_ov002_0223f6c4(p);
        if (func_ov002_022536e8(p->bit0, p->w0, r) == 0) {
            return 0;
        }
    }
    return 1;
}
