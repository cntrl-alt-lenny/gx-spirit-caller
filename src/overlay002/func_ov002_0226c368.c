typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern struct { char pad[0xd70]; int a,b,c; char pad2[0x20]; u32 state; } data_ov002_022d016c;
extern struct { u16 pad[0x50]; u16 h_a0,h_a2,h_a4,h_a6,h_a8,h_aa,h_ac,h_ae,h_b0,h_b2,h_b4; } data_ov002_022d0e6c;
extern u16 data_ov002_022d0f1c[];
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern int func_ov002_0226c2b8(int a, int b, int c);
extern int func_ov002_021b1200(int (*fn)(int,int,int));
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021deb84(int arg0,int arg1);
extern int func_ov002_02290500(int a,int b,int (*fn)(int,int,int));
extern int func_ov002_0229ade0(int a,int b,int c,int d);
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 rest:2; u32 extra[4]; };
#define STATE (data_ov002_022d016c.state)
#define A (*(volatile int *)((char *)&data_ov002_022d016c + 0xd70))
#define B (*(volatile int *)((char *)&data_ov002_022d016c + 0xd74))
#define C (*(volatile int *)((char *)&data_ov002_022d016c + 0xd78))
#define H(o) data_ov002_022d0e6c.h_##o
int func_ov002_0226c368(int a,int b,int c) {
    c=(u8)c;
    switch(STATE) {
    case 0:
        H(a6)=c;
        H(b4)=0;
        H(b2)=0;
        if(func_ov002_021b1200(func_ov002_0226c2b8)==0) return 1;
        func_ov002_021ae400(a,0x12);
        STATE++;
        return 0;
    case 1:
        if(data_ov002_022cd744[a]==1) func_ov002_02290500(a,1,func_ov002_0226c2b8);
        else func_ov002_022592ec((int)func_ov002_0226c2b8);
        STATE++;
        return 0;
    case 2:
        if(func_ov002_022593f4()!=0) {
            int x=A;
            int y=B+C;
            data_ov002_022d0f1c[x+1] |= 1<<y;
            if(c) {
                struct Slot *s=(struct Slot *)(data_ov002_022cf16c+(x&1)*0x868+0x30+y*20);
                func_ov002_0229ade0(0x28,x,y,s->flag+(s->value<<1));
            } else {
                int sum=data_ov002_022d016c.b+data_ov002_022d016c.c;
                H(b0)=(u8)data_ov002_022d016c.a|((u8)sum<<8); return 1;
            }
            STATE++;
            return 0;
        }
        func_ov002_0229ade0(0x29,0,0,0);
        STATE=0;
        return 0;
    case 3:
        if(H(a6)>1) {
            H(a6)--;
            STATE=1;
            return 0;
        }
        func_ov002_021deb84(a,H(b2)|(H(b4)<<16));
        STATE++;
        return 0;
    }
    return 1;
}

















