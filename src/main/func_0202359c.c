typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int x,y,z; } Vec;
typedef struct { Vec v; short id; signed char mode; unsigned char active:1; } State;
typedef struct { u32 *pc; int timer; char pad[0x60]; Vec a,b,c,d; State sa,sb,sc; short c8,ca; u16 cc; unsigned short b0:1; unsigned short b1:1; } Obj;
struct F02023f4c { char pad[0xca]; signed short fca; unsigned short fcc; };
extern void func_0200592c(void);
extern int func_02021cd8(char *);
extern int func_020224c0(char *base,int mode,int val);
extern int func_02022644(char *,State *,Vec *);
extern int func_0202290c(char *base,State *state,Vec *out);
extern int func_02023eb8(Obj *o);
extern int func_02023f28(char *p);
extern int func_02023f4c(struct F02023f4c *self);
extern void func_0208c8b0(u32 v);
extern void func_0208c8cc(u32 a,u32 b,u32 c);
extern int func_0208cc90(void);
extern void func_0208cfa4(int);
extern void func_0208d030(int);
extern void func_0208d0bc(u16 v);
extern void func_0208d138(u16 v);
extern void func_0208d1e4(int a0);
extern void func_0208d3fc(u16 v);
extern void func_0208d4f0(u16 v);
extern void func_0208da2c(int);
extern void func_02094504(int,int,int);
int func_0202359c(Obj *o) {
    u32 *start = o->pc;
    int stop = 0;
    while (!stop && !func_02021cd8((char *)o)) {
        switch (*o->pc >> 24) {
        case 0x20:
            func_0200592c();
            func_0208d1e4(0x1ff);
            func_02094504(0,0x6800000,0xa4000);
            func_0208cc90();
            func_0208da2c(0x60);
            func_0208d4f0(3);
            func_0208d3fc(0x10);
            func_0208d138(4);
            func_0208d0bc(8);
            func_0208d030(0x80);
            func_0208cfa4(0x100);
            func_0208c8cc(1,0,1);
            func_0208c8b0(0);
            o->pc++;
            break;
        case 0x21:
            o->a.x=0; o->a.y=0x1000; o->a.z=0x1000;
            o->b.x=0; o->b.y=0; o->b.z=0;
            o->c.x=0; o->c.y=0x1000; o->c.z=0;
            o->pc++;
            break;
        case 0x22: { Vec *a = &o->a;
            a->x=(short)func_020224c0((char *)o, ((*o->pc >> 16)&255), (u16)o->pc[1]) << 4;
            a->y=(short)func_020224c0((char *)o, ((*o->pc >> 16)&255), (u16)(o->pc[1] >> 16)) << 4;
            a->z=(short)func_020224c0((char *)o, ((*o->pc >> 16)&255), (u16)o->pc[2]) << 4;
            o->sa.v=*a;
            o->pc+=3;
            break;
        } case 0x23:
            if(func_02022644((char *)o,&o->sa,&o->a)) stop=1;
            break;
        case 0x24: { Vec *b = &o->b;
            b->x=(short)func_020224c0((char *)o, ((*o->pc >> 16)&255), (u16)o->pc[1]) << 4;
            b->y=(short)func_020224c0((char *)o, ((*o->pc >> 16)&255), (u16)(o->pc[1] >> 16)) << 4;
            b->z=(short)func_020224c0((char *)o, ((*o->pc >> 16)&255), (u16)o->pc[2]) << 4;
            o->sb.v=*b;
            o->pc+=3;
            break;
        } case 0x25:
            if(func_02022644((char *)o,&o->sb,&o->b)) stop=1;
            break;
        case 0x26:
            o->sc.mode=1;
            if(func_02022644((char *)o,&o->sc,&o->d)) stop=1;
            break;
        case 0x27:
            o->b1=(u16)func_020224c0((char *)o,((*o->pc >> 16)&255),(u16)*o->pc);
            func_02023eb8(o);
            o->pc++;
            break;
        case 0x28:
            o->c8=func_020224c0((char *)o,((*o->pc >> 16)&255),(u16)*o->pc);
            func_02023f28((char *)o);
            o->pc++;
            break;
        case 0x29: {
            int a,b,c,d;
            a=func_020224c0((char *)o,((*o->pc >> 16)&255),(u16)o->pc[1]);
            b=func_020224c0((char *)o,((*o->pc >> 16)&255),(u16)(o->pc[1] >> 16));
            c=func_020224c0((char *)o,((*o->pc >> 16)&255),(u16)o->pc[2]);
            d=func_020224c0((char *)o,((*o->pc >> 16)&255),(u16)(o->pc[2] >> 16));
            o->ca=a;
            o->cc=b | (c << 5) | (d << 10);
            func_02023f4c((struct F02023f4c *)o);
            o->pc+=3;
            break;
        }
        }
        if(o->pc != start) o->timer=0;
    }
    if(o->b0) {
        if(o->sa.active) func_0202290c((char *)o,&o->sa,&o->a);
        if(o->sb.active) func_0202290c((char *)o,&o->sb,&o->b);
        if(o->sc.active) func_0202290c((char *)o,&o->sc,&o->d);
    }
    o->timer++;
    return 1;
}


