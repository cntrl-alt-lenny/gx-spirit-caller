typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 f0; u16 bit:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; };
struct Status { char pad[0xb0]; u16 busy; };
struct Flag { char pad[0xd44]; int flag; };
struct Entry { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 rest:2; };
struct Side { int count; char pad[0x11c]; struct Entry entries[0x80]; char tail[0x548]; };
extern struct State data_ov002_022ce288;
extern struct Status data_ov002_022d0e6c;
extern struct Flag data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern struct Side data_ov002_022cf16c[];
extern void func_ov002_0226b094(int arg0, int arg1);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021c3b60(int player, int arg1);
extern int func_ov002_021b97d4(int a, u32 b);
extern int func_ov002_021ae4bc(void *self, int idx);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021e278c(int arg0, int arg1);
extern void func_ov002_021df73c(int arg0, int arg1);
int func_ov002_022295a0(struct Self *self) {
    int idx;
    int avg;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_0226b094(1 - self->bit, self->f0);
        return 0x7f;
    case 0x7f:
        if (data_ov002_022d0e6c.busy != 0) return 0x78;
        func_ov002_021d479c((u16)((self->bit ? 0x8000 : 0) | 0x5e), 0, 0, 0);
        return 0x7e;
    case 0x7e:
        if (func_ov002_021c3b60(self->bit, 0x167b) >= 0) {
            if (data_ov002_022cd744[self->bit] == 1) {
                data_ov002_022d016c.flag = 1;
            } else {
                func_ov002_021ae4bc((void *)0x12b, func_ov002_021b97d4(self->bit, 0x167b));
            }
            return 0x7d;
        } else {
            func_ov002_021ae400(self->bit, 0x12c);
            return 0;
        }
    case 0x7d:
        if (data_ov002_022d016c.flag == 0) return 0;
        idx = func_ov002_021c3b60(self->bit, 0x167b);
        func_ov002_021e278c(self->bit, data_ov002_022cf16c[self->bit & 1].entries[idx].value * 2 + data_ov002_022cf16c[self->bit & 1].entries[idx].flag);
        return 0x78;
    case 0x78:
        func_ov002_021d479c((u16)((self->bit ? 0x8000 : 0) | 0x5e), 1, 0, 0);
        avg = (data_ov002_022cf16c[0].count + data_ov002_022cf16c[1].count + 1) >> 1;
        func_ov002_021df73c(1 - self->bit, avg);
        func_ov002_021df73c(self->bit, avg);
        return 0;
    default:
        return 0;
    }
}
