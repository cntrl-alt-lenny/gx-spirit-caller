struct Bits { unsigned short side:1; unsigned short slot:5; unsigned short rest:10; };
struct Self { unsigned short x; struct Bits bits; };
struct State { char pad[0x5a8]; int state; };
struct Saved { char pad[0xd44]; unsigned int value; };
struct Flag { char pad[0xb2]; unsigned short value; };
struct Count { int count; char pad[0x864]; };
struct Row { char pad[0x418]; int cards[0x114]; };
extern struct State data_ov002_022ce288;
extern struct Saved data_ov002_022d016c;
extern struct Flag data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern struct Count data_ov002_022cf180[];
extern struct Row data_ov002_022cf16c[];
extern int func_ov002_02257b48(void *p, void *q);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021ae664(int x);
extern void func_ov002_0226b22c(int arg0,int arg1,int arg2,int arg3);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_021d8128(int arg0,void *arg1,int arg2);
extern int func_ov002_021e13f4(int a,int b,int c,int unused);
int func_ov002_022237f0(struct Self *self, void *q) {
    switch(data_ov002_022ce288.state) {
    case 0x80:
        if(func_ov002_02257b48(self,q)==0) return 0;
        if(data_ov002_022cd744[self->bits.side]==1)
            data_ov002_022d016c.value=func_ov002_021b00d0(2);
        else func_ov002_021ae664(0x38);
        return 0x7f;
    case 0x7f:
        func_ov002_0226b22c(self->bits.side,self->bits.slot,1,data_ov002_022d016c.value);
        return 0x7e;
    case 0x7e:
        func_ov002_021e2b3c((int)self);
        return 0x7d;
    case 0x7d:
        if(data_ov002_022d0e6c.value!=0) {
            int side=1-self->bits.side;
            int count=data_ov002_022cf180[side&1].count;
            if(count!=0) {
                func_ov002_021d8128(side,&data_ov002_022cf16c[side&1].cards[count-1],1);
                return 0x7d;
            }
        } else {
            int side=self->bits.side;
            int other=(1-side)&1;
            func_ov002_021e13f4(side,data_ov002_022cf180[other].count,0,other);
        }
        return 0x7c;
    case 0x7c:
        func_ov002_021e2c5c((int)self);
        return 0;
    }
    return 0;
}
