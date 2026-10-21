struct Self { unsigned short value; unsigned short side:1; unsigned short pad:11; unsigned short mode:2; unsigned short rest:2; };
struct State { char pad[0x5a8]; int state; int choice; };
struct Global { char pad[0xd0]; unsigned int flags; char pad2[0xc18]; int side; char pad3[0x84]; int a; int b; };
struct Row { char pad[0xc]; int count; char pad2[0x110]; char cards[0x748]; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern struct Row data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021d59cc(int a,int b,int c,int d,unsigned short e);
extern void func_ov002_021d7c1c(void *a,void *b,void *c);
extern int func_ov002_021ded1c(int a,int b);
extern void func_ov002_021e276c(int a,int b,int c,int d);
extern int func_ov002_0225764c(int a,int b,int c);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0225935c(int a,int b,int c);
extern int func_ov002_022593f4(void);
int func_ov002_0222396c(struct Self *self) {
    if(self->mode==0) {
        switch(data_ov002_022ce288.state) {
        case 0x80:
            if(data_ov002_022d016c.flags & 1) return 0;
            data_ov002_022ce288.choice=0x10;
            if(func_ov002_022577dc(self)==0) return 0x7d;
            func_ov002_021ae400(self->side,0x7c);
            func_ov002_0225935c(self->side,self->value,(int)func_ov002_0225764c);
            return 0x7f;
        case 0x7f:
            if(func_ov002_022593f4()==0) return 0x80;
            data_ov002_022ce288.choice=data_ov002_022d016c.a+data_ov002_022d016c.b;
            return 0x7e;
        case 0x7e:
            if(data_ov002_022ce288.choice<=4)
                func_ov002_021d59cc(self->side,data_ov002_022ce288.choice,self->value,1,0);
            return 0x7d;
        case 0x7d: {
            int mask=-1;
            if(data_ov002_022ce288.choice!=0x10)
                mask &= ~(1 << (data_ov002_022ce288.choice + (self->side << 4)));
            func_ov002_021ded1c((int)self,mask);
            return 0x7c;
        }
        case 0x7c: {
            int i;
            for(i=0;i<2;i++) {
                int side=data_ov002_022d016c.side ^ i;
                struct Row *row=&data_ov002_022cf16c[side & 1];
                if(row->count!=0) {
                    func_ov002_021d7c1c((void *)side,row->cards,0);
                    return 0x7c;
                }
            }
            return 0x7b;
        }
        case 0x7b:
            func_ov002_021e276c((1-self->side),self->value,1,0);
            return 0;
        }
    }
    return 0;
}
