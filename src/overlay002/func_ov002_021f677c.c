typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    char pad2[8];
    unsigned short fieldc;
} S021f677c;

extern char data_ov002_022cf17c[];
extern void func_ov002_021e1404(int, int, int);

int func_ov002_021f677c(S021f677c *p) {
    int idx = p->bit0 & 1;
    if (*(unsigned int *)(data_ov002_022cf17c + idx * 0x868) >= 3) {
        func_ov002_021e1404(p->bit0, 3, 0);
        p->fieldc = 1;
    }
    return 1;
}
