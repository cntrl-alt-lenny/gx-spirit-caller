typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 slot:5; u16 rest:10; u16 pad4:6; u16 field:9; u16 rest4:1; };
struct State { char pad[0x5b8]; int step; };
struct Info { char pad[0xd44]; int ready; char pad2[0x28]; int side, slot, extra; };
struct Card { u32 pad:13; u32 flag:1; u32 pad2:8; u32 number:8; u32 pad3:2; char rest[16]; };
struct Table { char pad[0x30]; struct Card cards[100]; char rest[104]; };
extern struct State data_ov002_022ce288;
extern struct Info data_ov002_022d016c;
extern struct Table data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0223dcc0(struct Self *self,int side,int slot);
extern int func_ov002_022575c8(int a0,int a1,int a2);
extern int func_ov002_02280c40(int side,int other,int previous,int a,int b);
extern int func_ov002_021ae484(int x);
extern void func_ov002_0225935c(int arg0,int arg1,int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0223fd74(void *arg0,int arg1,int arg2);
int func_ov002_0224003c(struct Self *self) {
    switch(data_ov002_022ce288.step) {
    case 0:
        if(func_ov002_022577dc(self)==0) return 1;
        if(data_ov002_022cd744[self->side]==1) {
            int count=0;
            int previous=-1;
            if(data_ov002_022cf16c[self->side & 1].cards[self->slot].number * 2 + data_ov002_022cf16c[self->side & 1].cards[self->slot].flag == self->field) {
                func_ov002_0223dcc0(self,self->side,self->slot);
                count++;
            }
            for(;count<2;count++) {
                previous=func_ov002_02280c40(self->side,1-self->side,previous,1,1);
                if(previous>-1 && func_ov002_022575c8((int)self,1-self->side,previous)!=0)
                    func_ov002_0223dcc0(self,1-self->side,previous);
            }
            return 1;
        }
        func_ov002_021ae484(0x73);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if(data_ov002_022d016c.ready==0) return 1;
        func_ov002_0225935c(self->side,self->id,(int)func_ov002_0223fd74);
        data_ov002_022ce288.step++;
        return 0;
    case 2:
        if(func_ov002_022593f4()) {
            func_ov002_0223dcc0(self,data_ov002_022d016c.side,data_ov002_022d016c.slot+data_ov002_022d016c.extra);
            if(func_ov002_022577dc(self)==1) return 1;
            data_ov002_022ce288.step++;
            return 0;
        }
        data_ov002_022ce288.step-=2;
        return 0;
    case 3:
        func_ov002_021ae484(0x75);
        data_ov002_022ce288.step++;
        return 0;
    case 4:
        if(data_ov002_022d016c.ready==0) return 1;
        func_ov002_0225935c(self->side,self->id,(int)func_ov002_0223fd74);
        data_ov002_022ce288.step++;
        return 0;
    case 5:
        if(func_ov002_022593f4()) {
            func_ov002_0223dcc0(self,data_ov002_022d016c.side,data_ov002_022d016c.slot+data_ov002_022d016c.extra);
            return 1;
        }
        data_ov002_022ce288.step-=2;
        return 0;
    }
    return 0;
}
