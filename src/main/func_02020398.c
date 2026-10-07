typedef struct {
    char pad0[0x1c];
    void (*cb)(unsigned short, int, unsigned short);
} State;

typedef struct {
    unsigned short h0;
    unsigned short h2;
    unsigned short h4;
    unsigned short h6;
    unsigned short h8;
    unsigned short ha;
    int wc;
    unsigned short h10;
    unsigned short h12;
} Msg;

extern State data_02191f40;
extern void func_0201f19c(int arg);

void func_02020398(Msg *m) {
    void (*cb)(unsigned short, int, unsigned short);
    if (m->h2 != 0) {
        func_0201f19c(m->h2);
        return;
    }
    cb = data_02191f40.cb;
    if (cb != 0) {
        if (m->h4 == 0x15) {
            cb(m->h12, m->wc, m->h10);
        } else if (m->h4 == 9) {
            cb(m->h12, 0, 0);
        }
    }
}
