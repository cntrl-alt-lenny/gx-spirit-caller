typedef unsigned short u16;
struct SelfDE04 { u16 f0; u16 side:1; u16 rest:15; char pad[8]; u16 fc; };
struct State { char pad[0x5b8]; int state; };
struct Context { char pad[0xb2]; u16 fb2; };
extern struct State data_ov002_022ce288;
extern struct Context data_ov002_022d0e6c;
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
int func_ov002_02242abc(struct SelfDE04 *self) {
    if (self->fc == 0) return 1;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_021ca698(self->side, 1 - self->side) != 0 &&
            func_ov002_022536e8(self->side, self->f0, 0) != 0) {
            func_ov002_0226b194(self->side, self->f0, 0);
            data_ov002_022ce288.state++;
            return 0;
        }
        data_ov002_022ce288.state += 2;
    case 2:
        if (func_ov002_021ca698(self->side, self->side) != 0 &&
            func_ov002_022536e8(1 - self->side, self->f0, 0) != 0) {
            func_ov002_0226b194(1 - self->side, self->f0, 0);
            data_ov002_022ce288.state++;
            return 0;
        }
        data_ov002_022ce288.state += 2;
    case 4:
        return 1;
    case 1:
    case 3:
        func_ov002_0223de04(self, data_ov002_022d0e6c.fb2 & 1, 0xe, data_ov002_022d0e6c.fb2);
        data_ov002_022ce288.state++;
        return 0;
    }
    return 0;
}
