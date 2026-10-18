typedef struct {
    unsigned int lo : 13;
    unsigned int hi : 19;
} Bits32;

typedef struct {
    unsigned short pad : 8;
    unsigned short b : 8;
} Bits16;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c8470(int a, int b);

int func_ov002_021f0788(unsigned short *p, int a, int b) {
    int off;
    char *q;
    if (b >= 5) {
        return 0;
    }
    off = (a & 1) * 0x868;
    q = data_ov002_022cf16c + off;
    if (((Bits32 *)(q + 0x30 + b * 20))->lo == 0) {
        return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + b * 20) == 0) {
        return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a2 + off + b * 20) != 0) {
        return 0;
    }
    if (((Bits16 *)(p + 3))->b != 0) {
        return p[4] == func_ov002_021c8470(a, b);
    }
    return 1;
}
