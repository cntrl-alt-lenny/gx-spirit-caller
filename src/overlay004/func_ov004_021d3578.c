typedef struct { unsigned int a,b; char pad8[0x14]; unsigned int low8:8; unsigned int:24; char pad20[4]; unsigned int:17; unsigned int mid4:4; unsigned int:11; } state_t;
typedef struct { int a,b,c; } Triple;
typedef struct { int state,hover,choice,height,y,timer,mode; } Dialog;
struct Obj { unsigned int flags; int pad4; void *f8; int padc; void *f10; int pad14; void *f18; };
struct Mtx33 { int v[9]; };
typedef struct { int frame; char pad[0x44]; int f48; int f4c; int f50; int f54; int f58; int f5c; } State;
extern State data_ov004_0220b500;
extern unsigned short data_02104dac[];
extern int data_021040ac[];
extern Dialog data_ov004_022915e8;
extern state_t data_02102c90;
extern struct { int pad; unsigned int mode:3; unsigned int rest:29; } data_02104f4c;
extern short data_020bef80[];
extern Triple data_ov004_02200e00[];
extern Triple data_ov004_02200de8;
extern struct Mtx33 data_021a1974;
extern struct { char pad[0xfc]; unsigned int flags; } data_021a18b8;
extern struct Obj data_ov004_02211548;
extern void func_02001d0c(state_t *,int,int);
extern int func_0201d530(int);
extern int func_0202b100(int);
extern void func_0202ba94(int,int);
extern int func_0202c0c0(int);
extern int func_02037208(int,int,int,int);
extern void func_020822a0(const Triple *);
extern void func_020822c8(const Triple *);
extern void func_020822f0(void);
extern void func_02084aec(struct Obj *);
extern void func_02084fe0(void);
extern void MTX_Identity33_(struct Mtx33 *);
extern void func_0208e318(int *,int,int,int,int);
extern int OS_SPrintf(signed char *,const signed char *,...);
extern void MI_Copy36B(const void *,void *);
extern void func_ov004_021d0168(int);
extern void func_ov004_021d02f4(void);
extern void func_ov004_021d03ec(int);
extern void func_ov004_021d8798(Dialog *,void *,int);
extern int func_ov004_021d8d58(Dialog *);
extern void func_ov004_021d9134(Dialog *);
static inline int dialog_active(Dialog *p) { if (p->state) return 1; return 0; }
int func_ov004_021d3578(void) {
    signed char buf[0x100];
    Triple a,b;
    struct Mtx33 m;
    State *s=&data_ov004_0220b500;
    int count; int card;
    count=data_021040ac[0x355]; card=data_02104dac[0x30];
    int fade;
    if(s->f5c) return 0;
    if(s->frame>=64 && dialog_active(&data_ov004_022915e8)==0) {
        s->f48=0; s->f54=1; return 0;
    }
    if(s->frame<32) { fade=s->frame-20; if(fade<0) fade=0; }
    else { fade=12; func_ov004_021d0168(card); }
    if(s->frame==32) {
        func_02001d0c(&data_02102c90,26,7);
        func_0201d530(6);
        if(data_02104f4c.mode) {
            const signed char *fmt=(const signed char *)func_0202c0c0(216);
            int name=func_0202b100(card);
            OS_SPrintf(buf,fmt,count,name);
        } else {
            const signed char *fmt=(const signed char *)func_0202c0c0(216);
            int name=func_0202b100(card);
            OS_SPrintf(buf,fmt,name,count);
        }
        func_ov004_021d8798(&data_ov004_022915e8,buf,2);
        func_0202ba94(card,count);
        data_021040ac[0x355]=0;
        func_02037208(95,-1,0,1);
    }
    func_ov004_021d02f4();
    func_ov004_021d8d58(&data_ov004_022915e8);
    func_ov004_021d9134(&data_ov004_022915e8);
    { int t=s->frame-32; if(t<0)t=-t; if(t>32)t=32;
      func_ov004_021d03ec(data_020bef80[((t<<9)>>4)*2]); }
    a=data_ov004_02200e00[2];
    b=data_ov004_02200de8;
    MTX_Identity33_(&m);
    MI_Copy36B(&m,&data_021a1974);
    data_021a18b8.flags &= ~0xa4;
    func_020822a0(&a);
    func_020822c8(&b);
    func_020822f0();
    func_02084aec(&data_ov004_02211548);
    s->frame++;
    func_020822f0();
    func_02084fe0();
    *(volatile unsigned int *)0x04000540=0;
    func_0208e318((int *)0x04000050,1,63,16,0);
    *(volatile unsigned int *)0x04001018=((12-fade)<<18)&0x01ff0000;
    func_0208e318((int *)0x04001050,4,63,fade,16-fade);
    return 0;
}




