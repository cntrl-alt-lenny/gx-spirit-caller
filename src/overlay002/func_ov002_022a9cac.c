typedef unsigned int u32;
typedef unsigned char u8;

typedef struct { u32 pad0; u32 side; } SideData;
typedef struct { u8 pad[0x38]; u32 flags; } FlagData;

typedef struct { u8 b[0x2c]; } Slot;
typedef struct { Slot slot[4]; } Side;
typedef struct { u8 b[0x14]; } Card;
typedef struct { u8 b[0xcc]; } Big;

typedef struct {
    Card cards[11];
    u8 pad0[0x1b8 - 0xdc + 0xdc - 0xdc];
} Dummy;

extern SideData data_ov002_022cd73c;
extern FlagData data_021040ac;

extern void func_ov002_0229e27c(void *p);
extern void func_ov002_0229e85c(void *p);
extern void func_ov002_0229d5c0(void *p);

void func_ov002_022a9cac(u8 *self)
{
    int i, j;
    Side *sd;
    int k;
    Big *p;
    Card *q;
    Card *r;

    p = (Big *)(self + 0x3e0);
    for (i = 0; i < 2; i++) {
        func_ov002_0229e27c(p);
        p++;
    }

    for (k = 0; k < 2; k++) {
        sd = (Side *)(self + 0x280) + (data_ov002_022cd73c.side ^ k);
        for (j = 0; j < 4; j++) {
            func_ov002_0229e85c(&sd->slot[j]);
        }
    }

    q = (Card *)(self + 0x1b8);
    for (i = 0; i < 2; i++) {
        if (data_021040ac.flags & 8) {
            for (j = 0; j < 5; j++) {
                func_ov002_0229d5c0(&q[j]);
            }
        }
        j = 0;
        r = (Card *)self;
        for (; j <= 10; j++) {
            func_ov002_0229d5c0(r);
            r++;
        }
        q += 5;
        q = (Card *)((u8 *)q + 0);
        self += 0xdc;
    }
}
