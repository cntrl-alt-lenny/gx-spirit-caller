typedef struct {
    char _pad0[2];
    unsigned short low6 : 6;
    unsigned short mid6 : 6;
    unsigned short hi4 : 4;
} T_ov002_02202b2c;

int func_ov002_02202a3c(T_ov002_02202b2c *p) {
    switch (p->mid6) {
    case 6:
    case 7:
    case 8:
        return 1;
    }
    return 0;
}
