typedef unsigned short u16;
struct Bits { u16 side:1; u16 pad:11; u16 mode:2; u16 other:1; u16 top:1; };
struct Self { u16 id; struct Bits bits; u16 pad[4]; u16 result; };
struct Func021f4a00Self;
struct F021f4a4c_Self;
extern int func_ov002_021f4a00(struct Func021f4a00Self *self);
extern int func_ov002_021f4a4c(struct F021f4a4c_Self *self, int unused1);
extern int func_ov002_02257594(void *arg0, int arg1);
extern int func_ov002_0227ddf8(struct Self *self);
extern int func_ov002_021ae484(int x);
extern void func_ov002_021df780(int arg0, int arg1);
struct State { char pad[0x5b4]; int phase; };
struct Result { char pad[0xd44]; int value; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
int func_ov002_021f60fc(struct Self *self, int arg) {
    switch (data_ov002_022ce288.phase) {
    case 0:
        if (self->bits.mode == 0) {
            if (func_ov002_02257594(self, arg) == 2) {
                if (self->id == 0x1517 && arg == 0) {
                    data_ov002_022d016c.value = 1;
                } else if (data_ov002_022cd744[self->bits.side] == 1) {
                    data_ov002_022d016c.value = func_ov002_0227ddf8(self);
                } else if (self->id == 0x1a1a) {
                    func_ov002_021ae484(0x2f);
                } else {
                    func_ov002_021ae484(0x10e);
                }
                data_ov002_022ce288.phase++;
                return 0;
            } else {
                data_ov002_022d016c.value = 0;
            }
        } else {
            data_ov002_022d016c.value = 1;
        }
        data_ov002_022ce288.phase++;
        return 0;
    case 1:
        self->result = data_ov002_022d016c.value;
        if (data_ov002_022d016c.value == 0) return 1;
        switch (self->id) {
        case 0x12f3:
        case 0x14c2:
            func_ov002_021df780(self->bits.side ^ self->bits.other, 500);
            break;
        case 0x1517:
            func_ov002_021df780(self->bits.side ^ self->bits.other, 800);
            break;
        case 0x14de:
            return func_ov002_021f4a00((struct Func021f4a00Self *)self);
        case 0x1624:
            return func_ov002_021f4a4c((struct F021f4a4c_Self *)self, arg);
        }
        return 1;
    }
    return 1;
}

