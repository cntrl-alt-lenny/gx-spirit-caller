typedef struct { unsigned lo:10, mode:2, flag:1, hi:19; int f4; short next, f0a; } Node;
typedef struct { unsigned a:2, pad:8, toggle:1, id:8, kind:8, rest:5; } Bits;
typedef struct { unsigned a:5, pad:1, active:1, pad2:2, trigger:1, state:2, rest:20; } Flags;
typedef void (*Draw)(int,int,int,int,void*,int,int,int);
typedef struct { int x,y; Bits bits; int fc; unsigned f10,f14; Flags flags; Draw draw,draw2; } Self;
extern char data_ov011_021d403c[];
extern void func_ov011_021cc140(int);
extern int func_ov011_021cc15c(int);
extern void func_ov011_021cc194(int,int,int,int,void*,int,int,int);
extern int func_02037208(int,int,int,int);
extern int func_0201942c(int);
extern char *GetSystemWork(void);
extern void *func_02018bc0(int);
extern void func_ov011_021d1434(void *,int);
extern Node *func_02005dac(int,int);
extern void func_0209448c(int,int,int);
void func_ov011_021d1514(Self *s) {
    int pos[2]; int y; Node *n;
    if (!s->flags.active) return;
    pos[0] = s->x - *(int *)(data_ov011_021d403c + 0x1fc);
    pos[1] = s->y - *(int *)(data_ov011_021d403c + 0x200);
    if (s->bits.a == 0 || s->bits.a == 2) {
        switch (s->flags.state) {
        case 1:
            func_ov011_021cc140(3);
            s->flags.state++;
            func_02037208(0x47,-1,0,1);
        case 2:
            if (!func_ov011_021cc15c(3))
                func_ov011_021cc194(3,-1,2,s->flags.a,pos,0,0,0);
            else s->flags.state = 0;
            break;
        case 0:
            if (s->bits.toggle++) func_ov011_021cc194(2,-1,2,s->flags.a,pos,0,0,0);
            switch (s->bits.a) {
            case 0: s->draw(s->bits.kind,-1,2,s->flags.a,pos,0,0,0); break;
            case 2: s->draw2(0,-1,2,s->flags.a,pos,0,0,0); break;
            }
            break;
        }
    }
    if (!s->bits.id || s->bits.a == 2) return;
    if (func_0201942c(s->bits.id)) return;
    if (!((*(unsigned *)(GetSystemWork()+0x8e8) << 23) >> 31) && !((*(unsigned *)((char *)func_02018bc0(s->bits.id)+0x10) << 31) >> 31)) return;
    if (s->flags.trigger) { func_ov011_021d1434(s,0); s->flags.trigger=0; return; }
    y = (pos[1] >> 12) - 50;
    if (y >= 240 || y <= -16) return;
    n=func_02005dac(1,0x11);
    func_0209448c(0,(int)n,6);
    n->f4 = (n->f4 & ~0x3ff) | ((s->f10 >> 7) & 0x3ff);
    n->f4 = (n->f4 & ~0xf000) | (((s->f14 >> 9) & 15) << 12);
    n->f4 = (n->f4 & ~0xc00) | 0x800;
    n->flag = 0; n->mode = 0;
    *(unsigned *)n = (*(unsigned *)n & 0xfe00ffff) | (((pos[0] >> 12) - 8) & 0x1ff) << 16;
    *(unsigned *)n = (*(unsigned *)n & ~0xff) | (y & 0xff);
    *(unsigned *)n |= 0x40002000;
}





