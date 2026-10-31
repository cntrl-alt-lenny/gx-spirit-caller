extern void *func_020498f0(void);
extern int func_020529e8(int kind, int id, int data, int size);
extern long long func_020930b0(void);

typedef struct {
    unsigned char pad0[0xd];
    unsigned char count;
    unsigned char pad1[0x1a2];
    unsigned short value;
    unsigned char pad2[0x2e];
    int timeLo;
    int timeHi;
    unsigned char pad3[0xe8];
    unsigned char ids[256];
} State;

void func_0204bb5c(int id, int kind) {
    unsigned char data[8];
    unsigned char i;
    State *p;
    long long time;
    switch (kind) {
    case 2:
        if (id == ((State *)func_020498f0())->ids[((State *)func_020498f0())->count]) data[0] = 1; else data[0] = 0;
        for (i = 1; i <= ((State *)func_020498f0())->count; i++) {
            if (id == ((State *)func_020498f0())->ids[i]) {
                data[1] = i;
                data[2] = id;
                break;
            }
        }
        break;
    case 3:
        data[0] = ((State *)func_020498f0())->value;
        data[1] = ((State *)func_020498f0())->value >> 8;
        break;
    }
    func_020529e8(kind, id, (int)data, 4);
    p = func_020498f0();
    time = func_020930b0();
    p->timeLo = (int)time;
    p->timeHi = (int)(time >> 32);
}

