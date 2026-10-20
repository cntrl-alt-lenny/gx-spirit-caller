typedef unsigned short u16;
struct Obj { u16 id; u16 side:1; u16 rest:15; u16 pad[2]; u16 a,b,result; };
struct State { char pad[0x5b4]; int step; };
struct Pending { char pad[0xd44]; int choice; };
struct Input { char pad[0xb0]; u16 pair; };
struct Stats { int pad[5]; int a,b; int tail[4]; };
extern struct State data_ov002_022ce288;
extern struct Pending data_ov002_022d016c;
extern struct Input data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern void func_ov002_0226aff0(int arg0,int arg1,int arg2);
extern void func_ov002_021c4c9c(int,int,struct Stats *);
extern void func_ov002_021ae514(int,int,int,int,int,int);
extern void func_ov002_021deb28(int a,int b);
extern int func_ov002_0226b0d0(int arg0,int arg1,int arg2);
int func_ov002_021f8de8(struct Obj *self) {
    struct Stats stats;
    switch(data_ov002_022ce288.step) {
    case 0:
        func_ov002_0226aff0(self->side,65535,0);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        func_ov002_021c4c9c((unsigned char)data_ov002_022d0e6c.pair,(unsigned char)(data_ov002_022d0e6c.pair >> 8),&stats);
        self->a = stats.a > 65535 ? 65535 : stats.a;
        self->b = stats.b > 65535 ? 65535 : stats.b;
        if(data_ov002_022cd744[self->side] == 1) {
            data_ov002_022d016c.choice = self->a < self->b ? 1 : 0;
        } else {
            func_ov002_021ae514(129,408,409,0,0,15);
        }
        data_ov002_022ce288.step++;
        return 0;
    case 2:
        func_ov002_021deb28((unsigned char)data_ov002_022d0e6c.pair,(unsigned char)(data_ov002_022d0e6c.pair >> 8));
        data_ov002_022ce288.step++;
        return 0;
    case 3:
        switch(data_ov002_022d016c.choice) {
        case 0: self->result=self->a; break;
        case 1: self->result=self->b; break;
        }
        func_ov002_0226b0d0(1-self->side,self->id,data_ov002_022d016c.choice);
        data_ov002_022ce288.step++;
        return 0;
    default: return 1;
    }
}
