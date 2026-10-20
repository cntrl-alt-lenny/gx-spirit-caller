typedef unsigned short u16;
struct Card { u16 f0; u16 bit0:1; u16 rest:15; };
struct State { char pad[0x5b4]; int state; };
extern struct State data_ov002_022ce288;
extern int func_ov002_021f4a84(struct Card *self, int arg);
extern void func_ov002_0226aff0(int arg0, int arg1, int arg2);
int func_ov002_021f4d78(struct Card *self, int arg) {
    switch (data_ov002_022ce288.state) {
    default: {
        int result = func_ov002_021f4a84(self, arg);
        if (result != 1) return result;
        data_ov002_022ce288.state = 10;
        return 0;
    }
    case 10:
        func_ov002_0226aff0(self->bit0, 0xffff, 1);
        ++data_ov002_022ce288.state;
        return 0;
    case 11:
        return 1;
    }
}
