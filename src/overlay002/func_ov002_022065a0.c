typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
} S022065a0;

extern char data_ov002_022cf17c[];
extern int func_ov002_0223f6c4(S022065a0 *);
extern int func_ov002_022536e8(int, unsigned short, int);

int func_ov002_022065a0(S022065a0 *p) {
    int player = p->bit0 & 1;
    if (*(int *)(data_ov002_022cf17c + player * 0x868) == 0) {
        int r = func_ov002_0223f6c4(p);
        if (func_ov002_022536e8(p->bit0, p->w0, r) == 0) {
            return 0;
        }
    }
    return 1;
}
