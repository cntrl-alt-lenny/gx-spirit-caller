typedef struct {
    char pad0[6];
    unsigned short h6;
    unsigned short h8;
    char pad0a[0x38 - 0x0a];
    void (*cb38)(void *, unsigned short, unsigned short);
} State;

typedef struct {
    unsigned short h0;
    unsigned short h2;
    char pad4[4];
    unsigned short h8;
    unsigned short ha;
} Msg;

extern State data_02191f40;
extern char data_020c67dc[];
extern void func_0201f19c(int arg);
extern void func_0201f138(int x);
extern int func_02020550(int n);

void func_020205ec(Msg *m) {
    int r;
    unsigned short ha, h8;
    if (m->h2 != 0) {
        func_0201f19c(m->h2);
        func_0201f138(9);
        return;
    }
    if (data_02191f40.cb38 != 0) {
        data_02191f40.cb38(data_020c67dc, m->h8, m->ha);
    }
    ha = m->ha;
    h8 = m->h8;
    if (data_02191f40.h8 > ha) {
        data_02191f40.h8 = ha;
        data_02191f40.h6 = 1 << (h8 - 1);
    } else if (data_02191f40.h8 == ha) {
        data_02191f40.h6 |= 1 << (h8 - 1);
    }
    r = func_02020550((unsigned short)(h8 + 1));
    if (r == 0x18) {
        func_0201f138(7);
        return;
    }
    if (r != 2) {
        func_0201f138(9);
    }
}
