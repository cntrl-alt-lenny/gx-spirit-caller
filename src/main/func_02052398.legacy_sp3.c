typedef struct {
    char _pad0[0xc];
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

void func_02052398(int idx) {
    if (data_0219e3ec == 0) {
        return;
    }
    data_0219e3ec[idx].xc = 0;
    data_0219e3ec[idx].x10 = 0;
    data_0219e3ec[idx].x14 = 0;
    data_0219e3ec[idx].x18 = 0;
    data_0219e3ec[idx].x1c = 0;
    if (data_0219e3ec[idx].x1d != 0) {
        data_0219e3ec[idx].x1d = 1;
    }
    data_0219e3ec[idx].x22 = 0;
}
