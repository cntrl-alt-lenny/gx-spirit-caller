typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
typedef union { Card b; unsigned short raw; } CardValue;
extern char data_ov002_022d1910[];
extern int func_ov002_022b867c(char *, int, int, int, void *);
extern int func_020212cc(void *);
#define I(o) (*(int *)(p + (o)))
#define C(o) (*(Card *)(p + (o)))
#define EQ(a,b) ((a).side == (b).side && (a).slot == (b).slot)
int func_ov002_022b809c(char *p, int mode, int value)
{
    I(0xc54) = mode;
    I(0xc58) = value;
    I(0xc60) = 0;
    I(0xc64) = 0;
    switch (mode) {
    case 1: case 2: case 3: case 4: case 6: case 7: case 8: case 9: case 11: case 13: case 20: case 21: case 22:
        {
            CardValue c; c.raw = *(unsigned short *)(data_ov002_022d1910 + 0x90);
            *(unsigned short *)(p + 0xc68) = c.raw;
            func_ov002_022b867c(p,c.b.side,c.b.slot,c.b.index,p + 0xc80);
        }
        break;
    case 5: case 10: case 14:
        {
            CardValue c; c.raw = *(unsigned short *)(data_ov002_022d1910 + 0x92);
            *(unsigned short *)(p + 0xc68) = c.raw;
            func_ov002_022b867c(p,c.b.side,c.b.slot,c.b.index,p + 0xc80);
        }
        break;
    case 12:
        {
            CardValue c; c.raw = *(unsigned short *)(p + 0xc6a);
            *(unsigned short *)(p + 0xc68) = c.raw;
            func_ov002_022b867c(p,c.b.side,c.b.slot,c.b.index,p + 0xc80);
        }
        break;
    }
    if (mode == 1) I(0xd30) = I(0xc58) == 2;
    if (mode == 8) I(0xcf8) = EQ(C(0xc68), C(0xc74)) || EQ(C(0xc68), C(0xc76));
    else if (mode != 3) I(0xcf8) = 0;
    if (mode == 12) I(0xcd4) = 10;
    if (mode == 13) I(0xd0c) = (unsigned char)(((unsigned short)((unsigned)I(0xc58) >> 16)) >> 8);
    if (((mode == 10 || mode == 9 || mode == 7 || mode == 12) && EQ(C(0xc6a), ((Card *)(p+0xc74))[C(0xc6a).side])) || mode == 17) {
        if (((void **)(p+0xd50))[C(0xc6a).side] != 0) {
            if (((void **)(p+0xd50))[C(0xc6a).side] != (void *)-1) {
                func_020212cc(((void **)(p+0xd50))[C(0xc6a).side]);
                ((void **)(p+0xd50))[C(0xc6a).side] = (void *)-1;
            }
            ((Card *)(p+0xc74))[C(0xc6a).side].side = C(0xc6a).side;
            ((Card *)(p+0xc74))[C(0xc6a).side].slot = 31;
            ((Card *)(p+0xc78))[C(0xc6a).side].side = C(0xc6a).side;
            ((Card *)(p+0xc78))[C(0xc6a).side].slot = C(0xc6a).slot;
        }
    }
    I(0xd3c) = 0;
    return 1;
}

