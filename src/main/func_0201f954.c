typedef unsigned char u8;
typedef unsigned short u16;
typedef struct {
    u16 h0, h2;
    u8 pad4[4];
    u16 h8;
    u8 a,b,c,d,e,f;
    u8 pad10[0x26];
    u16 h36,h38;
    u8 pad3a[2];
    int id;
    u8 pad40[3];
    u8 flags;
} Packet;
typedef struct {
    u16 h0;
    u8 pad2[0x12];
    int f14;
    u8 pad18[0x10];
    void (*cb28)(void *);
    int f2c;
    int f30;
    int f34;
    void (* volatile cb38)(const char *, ...);
    u8 pad3c[0x6c];
    int fa8;
} State;
extern State data_02191f40;
extern char data_02192020[];
extern char data_020c65e4[], data_020c661c[], data_020c6634[], data_020c664c[], data_020c6660[];
extern void func_0201f19c(int arg);
extern void func_0201f138(int index);
extern int func_0201fbb8(void);
extern int func_0201f874(void);
extern void func_020928cc(void *, int);
extern int func_020a6924(void *);
void func_0201f954(Packet *p) {
    void (*print)(const char *, ...);
    if (p->h2 != 0) {
        func_0201f19c(p->h2);
        func_0201f138(9);
        return;
    }
    if (data_02191f40.f30 != 2) {
        if (func_0201fbb8()) return;
        func_0201f138(9);
        return;
    }
    switch (p->h8) {
    case 3: return;
    case 4: break;
    case 5:
        if (data_02191f40.cb38) {
            data_02191f40.cb38(data_020c65e4, p->a,p->b,p->c,p->d,p->e,p->f);
        }
        func_020928cc(data_02192020, 0xc0);
        if (data_02191f40.f14 && func_020a6924(data_02192020)) {
            if ((print = data_02191f40.cb38) != 0) print(data_020c661c);
            if (data_02191f40.cb28) data_02191f40.cb28(data_02192020);
        } else {
            int valid = 0;
            if (p->h36 >= 0x10) {
                valid = (p->h38 == 1);
            }
            if (valid == 0 || (p->id != data_02191f40.fa8 && p->id != 0x53)) {
                if ((print = data_02191f40.cb38) != 0) print(data_020c6634);
            } else {
                if ((p->flags & 3) != 1) {
                    if ((print = data_02191f40.cb38) != 0) print(data_020c664c);
                } else {
                    if ((print = data_02191f40.cb38) != 0) print(data_020c6660);
                    if (data_02191f40.cb28) data_02191f40.cb28(data_02192020);
                    if (data_02191f40.h0) {
                        if (func_0201fbb8()) return;
                        func_0201f138(9);
                        return;
                    }
                }
            }
        }
        break;
    }
    if (func_0201f874()) return;
    func_0201f138(9);
}






