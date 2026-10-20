struct Entry { unsigned short id; unsigned short player:1; unsigned short index:5; unsigned short rest:10; };
struct State { char pad[0x5a8]; int state; int count; };
struct Count { char pad[0xb2]; unsigned short count; };
struct Request { char pad[0xd70]; int a; int b; int c; };
extern struct State data_ov002_022ce288;
extern struct Count data_ov002_022d0e6c;
extern struct Request data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
/* Original calls supply fewer arguments than the definitions' unused slots. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_02257878();
extern int func_ov002_021e961c(void *self, int player, int idx);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0226b22c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_022313c4(struct Entry *self) {
    switch(data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_0226b22c(self->player, self->index, 3, 1);
        return 0x7f;
    case 0x7f:
        if (data_ov002_022d0e6c.count == 0) return 0;
        if (func_ov002_02257878(self, func_ov002_021e961c) == 0) return 0;
        func_ov002_021e2b3c();
        data_ov002_022ce288.count = 0;
        return 0x7e;
    case 0x7e:
        if (func_ov002_02257878(self, func_ov002_021e961c) == 0) return 0x7c;
        if (data_ov002_022ce288.count == 0) func_ov002_021ae400(self->player, 0x6d);
        func_ov002_0225935c(self->player, self->id, (int)func_ov002_021e961c);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4() != 0) {
            func_ov002_021de4b0((int)self, data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c);
            data_ov002_022ce288.count++;
            if (data_ov002_022ce288.count < data_ov002_022d0e6c.count) return 0x7e;
            else return 0x7c;
        }
        return 0x7e;
    case 0x7c:
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}
