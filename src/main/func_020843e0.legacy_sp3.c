typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Output { u32 flags,a,b,c,d,e,x,y; short sx,sy; u32 z,w; u16 q,r; u32 s,t; } Output;
typedef struct Obj Obj;
typedef struct Handler { u32 pad0[2]; void *arg; void (*cb)(Output *,void *,u32); char pad10[0x28]; Output *out; u32 bits[1]; } Handler;
struct Obj { void *pc; Handler *h; u32 flags; char padc[0x10]; void (*cb)(Obj *); char pad20[0x70]; u8 state; char pad91[0x1c]; u8 id; char padae[2]; Output *out; char padb4[8]; u32 bits[7]; u8 *res; char paddc[0x14]; void (*emit)(Output *); Output temp; };
typedef struct Input { u32 pad0,a,b,c,mask,d; u16 pad18[2]; u16 e,flags,q,r; u32 s,t; } Input;
extern Output data_021a1b20[];
extern struct Defaults { char pad[0x94]; u32 a,b,c; } data_021a18b8;
extern u32 data_020bef3c[];
extern void func_02084e0c(int cmd, void *src, int n);
void func_020843e0(Obj *o, int mode, Input *in, u32 id)
{
    int st;
    int busy;
    Output *out;
    o->id=id;
    o->flags |= 8;
    o->out=&o->temp;
    if(o->cb != 0) st=o->state; else st=0;
    if(st==1) {
        o->flags &= ~0x40;
        o->cb(o);
        if(o->cb != 0) st=o->state; else st=0;
        busy=o->flags & 0x40;
    } else busy=0;
    if(busy==0) {
        Output *base=o->h->out;
        if(base != 0 && !(o->flags & 0x80)) out=&base[id];
        else if((mode==0x20 || mode==0x40) && (o->bits[id>>5] & (1 << (id & 31)))) {
            if(base != 0) out=&base[id]; else out=&data_021a1b20[id];
        } else {
            if(base != 0) {
                o->bits[id>>5] |= 1 << (id & 31);
                out=&o->h->out[id];
            } else if(mode == 0x40) {
                o->bits[id>>5] |= 1 << (id & 31);
                out=&data_021a1b20[id];
            } else out=&o->temp;
            out->flags=0;
            {
                u8 *res=o->res;
                u8 *table=res+4;
                u32 offset=*(u16 *)(res+0xa);
                u8 *entry=table+offset;
                u8 *sub=res+*(u32 *)(entry+*(u16 *)entry*id+4);
                if(*(u16 *)(sub+0x1e) & 0x20) out->flags |= 0x20;
            }
            {
                u32 mask=data_020bef3c[(in->flags>>6)&7];
                out->a=(data_021a18b8.a & ~mask) | (in->a & mask);
                mask=data_020bef3c[(in->flags>>9)&7];
                out->b=(data_021a18b8.b & ~mask) | (in->b & mask);
                out->c=(data_021a18b8.c & ~in->mask) | (in->c & in->mask);
            }
            out->d=in->d;
            out->e=in->e;
            if(in->flags & 1) {
                u8 *p=(u8 *)in+0x2c;
                if(!(in->flags & 2)) { out->x=*(u32 *)p; out->y=*(u32 *)(p+4); p+=8; }
                else out->flags |= 1;
                if(!(in->flags & 4)) { out->sx=*(short *)p; out->sy=*(short *)(p+2); p+=4; }
                else out->flags |= 2;
                if(!(in->flags & 8)) { out->z=*(u32 *)p; out->w=*(u32 *)(p+4); }
                else out->flags |= 4;
                out->flags |= 8;
            }
            {
                Handler *h=o->h;
                if(h->arg != 0 && (h->bits[id>>5] & (1 << (id&31)))) h->cb(out,h->arg,id);
            }
            if(out->flags & 0x18) { out->q=in->q; out->r=in->r; out->s=in->s; out->t=in->t; }
        }
        o->out=out;
    }
    if(st==2) {
        o->flags &= ~0x40;
        o->cb(o);
        if(o->cb != 0) st=o->state; else st=0;
        busy=o->flags & 0x40;
    } else busy=0;
    if(busy==0) {
        out=o->out;
        if(out->c & 0x1f0000) {
            if(out->flags & 0x20) out->c &= ~0x1f0000;
            o->flags &= ~2;
            if(!(o->flags & 0x100)) {
                
                u32 args[7];
                args[0]=0x293130; args[1]=out->a; args[2]=out->b; args[3]=out->c;
                args[4]=0x2b2a; args[5]=out->d; args[6]=out->e;
                func_02084e0c(args[0],&args[1],6);
                if(out->flags & 0x18) o->emit(out);
            }
        } else o->flags |= 2;
    }
    if(st==3) { o->flags &= ~0x40; o->cb(o); }
}




