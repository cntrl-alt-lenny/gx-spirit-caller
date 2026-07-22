typedef struct {
    char _pad0[2];
    unsigned short low6 : 6;
    unsigned short mid6 : 6;
    unsigned short hi4 : 4;
} T_ov002_0220cf0c;

int func_ov002_0220cf0c(T_ov002_0220cf0c *p, int flag) {
    if (flag != 0) {
        return 0;
    }
    switch (p->mid6) {
    case 0x1f:
    case 0x20:
        return 1;
    }
    return 0;
}
