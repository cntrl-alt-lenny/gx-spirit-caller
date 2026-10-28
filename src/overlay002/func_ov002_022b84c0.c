typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
typedef union { Card b; unsigned short raw; } CardValue;
extern char data_ov002_022d1910[];
extern char data_ov002_022d1410[];
extern short data_ov002_022cccc0[][3];
int func_ov002_022b84c0(void *p, int *x, int *y)
{
    CardValue c;
    int kind;
    char *base = data_ov002_022d1410;
    c.raw = *(unsigned short *)(data_ov002_022d1910 + 0x90);
    if (c.b.slot == 11) {
        kind = (c.b.index - *(int *)(base + c.b.side * 0xcc + 0x488)) % 3;
    } else {
        kind = data_ov002_022cccc0[c.b.slot][0];
    }
    switch (kind) {
    case 0: default: *x = 0x17000; *y = 0; break;
    case 1: *x = 0x16000; *y = 0x1500; break;
    case 2: *x = 0x15000; *y = 0xeb00; break;
    }
    return 1;
}

