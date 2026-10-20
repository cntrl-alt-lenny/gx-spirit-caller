typedef unsigned short u16;
typedef unsigned int u32;
struct Obj { u16 id; u16 side:1; u16 field:5; u16 rest:10; u16 low:6; u16 index:9; u16 top:1; };
struct State { char pad[0x5b4]; int step; };
struct Pending { char pad[0xd44]; int choice; char gap[0x28]; void *side; int kind; int index; };
struct Player { char pad[0x120]; u32 cards[0x1d2]; };
extern struct State data_ov002_022ce288;
extern struct Pending data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern struct Player data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_021ae4bc(void *self,int idx);
/* This caller supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021bb90c();
extern void func_ov002_021df62c(int arg0,int arg1,int idx);
extern int func_ov002_021f8a14(u32 a,int b,int c);
extern void func_ov002_02290500(int,int,int (*)(u32,int,int));
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_021d7c1c(void *a,void *b,void *c);
extern int func_ov002_021decdc(void *arg0,int arg1,int arg2);
int func_ov002_021f8b00(struct Obj *self) {
    switch(data_ov002_022ce288.step) {
    case 0:
        if(data_ov002_022cd744[self->side] == 1) {
            if(func_ov002_021bb90c(self->side,self->id) != 0)
                data_ov002_022d016c.choice=0;
            else
                data_ov002_022d016c.choice=1;
        } else {
            func_ov002_021ae4bc((void *)250,self->index);
        }
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if(data_ov002_022d016c.choice == 0) return -1;
        func_ov002_021df62c(self->side,self->field,self->index);
        data_ov002_022ce288.step++;
        return 0;
    case 2:
        func_ov002_021ae400(self->side,0x3a);
        if(data_ov002_022cd744[self->side] == 1)
            func_ov002_02290500(self->side,self->id,func_ov002_021f8a14);
        else
            func_ov002_022592ec((int)func_ov002_021f8a14);
        data_ov002_022ce288.step++;
        return 0;
    case 3:
        if(func_ov002_022593f4() != 0) {
            if(data_ov002_022d016c.kind == 11) {
                func_ov002_021d7c1c(data_ov002_022d016c.side,&data_ov002_022cf16c[(u32)data_ov002_022d016c.side & 1].cards[data_ov002_022d016c.index],0);
            } else {
                func_ov002_021decdc(self,(int)data_ov002_022d016c.side,data_ov002_022d016c.kind+data_ov002_022d016c.index);
            }
            return 1;
        }
        data_ov002_022ce288.step--;
        return 0;
    default: return 1;
    }
}

