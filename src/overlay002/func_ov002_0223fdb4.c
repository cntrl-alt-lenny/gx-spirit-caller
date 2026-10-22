typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 slot:5; u16 rest:10; u16 f4; union {u16 raw; struct {u16 low:8; u16 high:8;} b;} f6; };
struct State { char pad[0x5b8]; int step; };
struct Info { char pad[0xd70]; int a,b,c; };
struct Card { int value; char pad[16]; };
struct Table { struct Card cards[100]; char pad[152]; };
extern struct State data_ov002_022ce288;
extern struct Info data_ov002_022d016c;
extern struct Table data_ov002_022cf1a8[];
extern int func_ov002_0223fd74(void *arg0,int arg1,int arg2);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_0223dcc0(struct Self *self,int side,int slot);
extern void func_ov002_0225935c(int arg0,int arg1,int arg2);
extern int func_ov002_022593a8(int a,int b,int c);
extern int func_ov002_022593f4(void);
extern void func_ov002_0229cd88(void *self,unsigned int arg1);
extern void func_ov002_0229cf10(char *dst,const char *fmt,int val);
int func_ov002_0223fdb4(struct Self *self) {
    char buf[256];
    int count=2;
    if(self->id==0x18f8) count=data_ov002_022cf1a8[self->side & 1].cards[self->slot].value;
    switch(data_ov002_022ce288.step) {
    case 0:
        if(func_ov002_022577dc(self)<count) return 1;
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        switch(self->id) {
        case 0x1147: func_ov002_0229cd88(buf,0x69); break;
        case 0x11f0: case 0x18f8: func_ov002_0229cf10(buf,(const char *)0x71,count); break;
        case 0x184a: func_ov002_0229cf10(buf,(const char *)0x116,count); break;
        case 0x17ea: func_ov002_0229cf10(buf,(const char *)0x6d,count); break;
        case 0x1a35: func_ov002_0229cd88(buf,0x119); break;
        }
        func_ov002_021ae400(self->side,(int)buf);
        func_ov002_0225935c(self->side,self->id,(int)func_ov002_0223fd74);
        data_ov002_022ce288.step++;
        return 0;
    case 3:
        func_ov002_022593a8(self->side,self->id,(int)func_ov002_0223fd74);
        data_ov002_022ce288.step++;
        return 0;
    case 2: case 4:
        if(func_ov002_022593f4()) {
            func_ov002_0223dcc0(self,data_ov002_022d016c.a,data_ov002_022d016c.b+data_ov002_022d016c.c);
            if(count<=self->f6.b.low) return 1;
            data_ov002_022ce288.step=3;
            return 0;
        }
        data_ov002_022ce288.step--;
        return 0;
    }
    return 1;
}

