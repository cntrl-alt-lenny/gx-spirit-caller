typedef unsigned short u16;
struct Self { u16 code; struct { u16 side:1; u16 rest:15; } flags; };
struct State { char pad[0x48c]; void *current; char pad2[0x128]; int step; };
struct Request { char pad[0xd70]; int side; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_02240ee4(int a, int b, int c);
extern int func_ov002_02240efc(void *a, int b, int c);
extern int func_ov002_02240f44(void *arg0, int arg1, int arg2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0229ce5c(char *dest, int format, int value);
int func_ov002_02240f88(struct Self *self, u16 *arg) {
    int callback;
    char buffer[256];
    switch (self->code) {
    case 0x1327: callback = (int)func_ov002_02240ee4; break;
    case 0x140a: callback = (int)func_ov002_02240efc; break;
    case 0x1719: callback = (int)func_ov002_02240f44; break;
    }
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_0229ce5c(buffer, 0x8a, func_0202b100(*arg));
        func_ov002_021ae400(self->flags.side, (int)buffer);
        data_ov002_022ce288.current = arg;
        func_ov002_0225935c(self->flags.side, self->code, callback);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.side, data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            data_ov002_022ce288.step++;
            return 0;
        } else {
            data_ov002_022ce288.step--;
            return 0;
        }
    case 2:
        data_ov002_022ce288.current = self;
        return 1;
    }
    return 0;
}

