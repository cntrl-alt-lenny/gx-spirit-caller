struct Self { unsigned short f0; unsigned short side:1; unsigned short rest:15; };
struct State { char pad[0x5a8]; int state; unsigned int count; };
struct Slot { unsigned int id:13; unsigned int rest:19; };
extern struct State data_ov002_022ce288;
extern unsigned int data_ov002_022be154[];
extern int func_ov002_02257b48(void *p, void *q);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0227ac64(int a, void *b, int c, int d, unsigned int e);
int func_ov002_0222904c(struct Self *self, void *q) {

    int result;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_02257b48(self, q) == 0) return 0;
        result = func_ov002_021ca3f0(self->side, 0x1670);
        if (result == 0) return 0;
        func_ov002_021e2b3c(result);
        data_ov002_022ce288.count = 0;
        return 0x7f;
    case 0x7f: {
        if (data_ov002_022ce288.count >= 3) return 0x7e;
        struct Slot slot = {0};
        slot.id = data_ov002_022be154[data_ov002_022ce288.count];
        func_ov002_0227ac64(1 - self->side, &slot, 1, 1, (self->f0 << 16) | 0x11);
        data_ov002_022ce288.count++;
        return 0x7f;
    }
    case 0x7e:
        func_ov002_021e2c5c((int)self);
    }
    return 0;
}


