typedef struct {
    char _pad0[0x4];
    int x4;
    int x8;
    int xc;
    int x10;
    int x14;
    int x18;
    unsigned char x1c;
    unsigned char x1d;
    unsigned char x1e;
    char _pad1f[0x3];
    unsigned short x22;
    char _pad24[0xc];
} Rec;

extern Rec *data_0219e3ec;
extern unsigned char func_02052334(int idx);
extern int func_0205272c(void *self);
extern void func_02094688(void *src, void *dst, int n);

void func_02052098(int idx, void *msg, int len) {
    Rec *rec = &data_0219e3ec[idx];
    int buf[2];
    int kind;

    rec->x1e = func_02052334(idx);
    kind = func_0205272c(msg);
    switch (kind) {
    case 1:
        if (len != 8) {
            return;
        }
        func_02094688(msg, buf, 8);
        rec->x18 = buf[0];
        rec->x10 = 0;
        if (rec->x4 != 0 && rec->x8 >= rec->x18) {
            rec->x1d = 2;
            break;
        }
        rec->x1d = 4;
        break;
    case 2:
    case 3:
    case 4:
        rec->x1d = 3;
        break;
    }
    rec->x22 = kind;
}
