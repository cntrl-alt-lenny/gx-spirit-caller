typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Output { u32 flags; char pad4[0x24]; int m[9]; int v[3]; } Output;
typedef struct Obj Obj;
typedef struct Handler { char pad0[0x10]; void *arg; int (*test)(Output *,void *,u32); char pad18[0x1c]; Output *out; } Handler;
struct Obj { u8 *pc; Handler *h; u32 flags; char padc[0x18]; void (*cb)(Obj *); char pad28[0x6a]; u8 state; char pad93[0x1b]; u8 id; char padaf[5]; Output *out; char padb8[0x1c]; u8 *res; char padd8[0x10]; void (*decode)(Output *,u8 *,u8 *,u32); void (*emit)(Output *); char padf0[0x3c]; Output temp; };
extern u8 data_020bef5c[][4];
extern void func_02084e0c(int cmd, void *src, int n);
extern void func_020947b8(void *dst);
void func_02083dd8(Obj *o, int mode)
{
    u32 id=o->pc[1];
    int len=4;
    int st;
    int busy;
    Output *out;
    o->id=id;
    o->flags |= 0x10;
    if(o->flags & 0x400) {
        if(mode==0x40 || mode==0x60) len++;
        if(mode==0x20 || mode==0x60) {
            len++;
            if(!(o->flags & 0x100)) {
                int v=o->pc[4];
                func_02084e0c(0x14,&v,1);
            }
        }
        o->pc+=len;
        return;
    }
    if(mode==0x40 || mode==0x60) {
        int v;
        len++;
        if(mode==0x40) v=o->pc[4]; else v=o->pc[5];
        if(!(o->flags & 0x100)) func_02084e0c(0x14,&v,1);
    }
    o->out=&o->temp;
    if(o->cb != 0) st=o->state; else st=0;
    if(st==1) {
        o->flags &= ~0x40;
        o->cb(o);
        if(o->cb != 0) st=o->state; else st=0;
        busy=o->flags & 0x40;
    } else busy=0;
    if(busy==0) {
        if(o->h->out != 0) {
            out=&o->h->out[id];
            busy=!(o->flags & 0x80);
        } else {
            out=&o->temp;
            busy=0;
        }
        if(busy==0) {
            out->flags=0;
            if(o->h->arg == 0 || !o->h->test(out,o->h->arg,id)) {
                u8 *res=o->res;
                u32 off=*(u16 *)(res+6);
                u8 *entry=res+off;
                u8 *p;
                u8 *in=res+*(u32 *)(entry+*(u16 *)entry*id+4);
                p=in+4;
                if(*(u16 *)in & 1) out->flags |= 4;
                else {
                    out->v[0]=*(int *)p;
                    out->v[1]=*(int *)(p+4);
                    out->v[2]=*(int *)(p+8);
                    p+=12;
                }
                if(*(u16 *)in & 2) out->flags |= 2;
                else if(*(u16 *)in & 8) {
                    int axis=(*(u16 *)in & 0xf0)>>4;
                    int a=*(short *)p;
                    int b=*(short *)(p+2);
                    func_020947b8(out->m);
                    out->m[axis]=(*(u16 *)in & 0x100) ? -0x1000 : 0x1000;
                    p+=4;
                    out->m[data_020bef5c[axis][0]]=a;
                    out->m[data_020bef5c[axis][1]]=b;
                    if(*(u16 *)in & 0x200) b=-b;
                    out->m[data_020bef5c[axis][2]]=b;
                    if(*(u16 *)in & 0x400) a=-a;
                    out->m[data_020bef5c[axis][3]]=a;
                } else {
                    out->m[0]=*(short *)(in+2);
                    out->m[1]=*(short *)p;
                    out->m[2]=*(short *)(p+2);
                    out->m[3]=*(short *)(p+4);
                    out->m[4]=*(short *)(p+6);
                    out->m[5]=*(short *)(p+8);
                    out->m[6]=*(short *)(p+10);
                    out->m[7]=*(short *)(p+12);
                    out->m[8]=*(short *)(p+14);
                    p+=16;
                }
                o->decode(out,p,o->pc,*(u16 *)in);
            }
        }
        o->out=out;
    }
    if(st==2) {
        o->flags &= ~0x40;
        o->cb(o);
        if(o->cb != 0) st=o->state; else st=0;
        busy=o->flags & 0x40;
    } else busy=0;
    if(busy==0 && !(o->flags & 0x100)) o->emit(o->out);
    o->out=0;
    busy=0;
    if(st==3) {
        o->flags &= ~0x40;
        o->cb(o);
        busy=o->flags & 0x40;
    }
    if(mode==0x20 || mode==0x60) {
        len++;
        if(busy==0 && !(o->flags & 0x100)) {
            int v=o->pc[4];
            func_02084e0c(0x13,&v,1);
        }
    }
    o->pc+=len;
}

