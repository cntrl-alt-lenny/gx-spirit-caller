typedef unsigned short u16;
struct Bits { u16 side:1; u16 pad:11; u16 mode:2; u16 other:1; u16 top:1; };
struct Self { u16 id; struct Bits bits; u16 pad[2]; u16 result; };
struct State { char pad[0x5b4]; int phase; };
struct Result { char pad[0xd44]; int value; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_02203290(struct Self *self, int arg);
extern int func_ov002_021ae484(int x);
extern int func_ov002_0226ae30(unsigned int bit, unsigned int one, unsigned int z, unsigned int one2);

int func_ov002_021f6544(struct Self *self, int arg) {
    switch (data_ov002_022ce288.phase) {
    case 0:
        if (self->bits.mode == 3) {
            data_ov002_022d016c.value = 1;
        } else if (func_ov002_02203290(self, arg) == 2) {
            if (data_ov002_022cd744[self->bits.side] == 1) {
                data_ov002_022d016c.value = 0;
            } else {
                func_ov002_021ae484(0x10e);
            }
        } else {
            data_ov002_022d016c.value = 0;
        }
        data_ov002_022ce288.phase++;
        return 0;
    case 1:
        self->result = data_ov002_022d016c.value;
        if (data_ov002_022d016c.value == 0) return 1;
        func_ov002_0226ae30(self->bits.side, 1, 0, 1);
        return 1;
    }
    return 0;
}
