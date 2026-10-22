typedef struct { unsigned short a:1,b:5,c:8,d:1,e:1; } bits_t;
typedef struct { signed char a,b,c,d; short e,f,g; unsigned short h; int i,j; } entry_t;
typedef struct { entry_t first,second; bits_t flags; short count; } state_t;
struct Ov002DaSelf { char pad0[0xa4]; int count,fa8; };
struct Ov002DaEntry { signed char b0,b1,b2,b3; short h4,h6,h8; unsigned short ha; int wc,w10; };
struct S { char pad0[0xa4]; int cnt,base; char pad1[0x10]; unsigned int bits[4]; };
extern int func_0202e2f8(int unused0);
extern int func_02037208(int a0,int r1,int r2,int r3);
extern void *func_ov002_022a6324(char *base,int idx,int type,int sub);
extern void func_ov002_0229da84(struct Ov002DaSelf *self,struct Ov002DaEntry *src);
extern void func_ov002_0229db44(struct S *self,int n);
extern void func_ov002_0229ed30(state_t *p,entry_t *src,int force);
extern void func_ov002_0229eedc(state_t *p);
extern void func_ov002_022a60f4(char *base,int idx,int type,int sub);
void func_ov002_022a6500(char *base,int value,bits_t *src,bits_t *dst) {
    int moved;
    entry_t *p;
    p=func_ov002_022a6324(base,src->a,src->b,src->c);
    if(p==0 || p->a==0) return;
    p->i=value;
    p->h=*(unsigned short *)dst;
    p->e=8;
    moved=0;
    switch(dst->b) {
    case 12: case 13: case 14: case 15:
        if(func_0202e2f8(value)==0) {
            int special=0;
            if(dst->b==13 && dst->c!=0) special=1;
            func_ov002_0229ed30((state_t *)(base+0x280+dst->a*0xb0)+(dst->b-12),p,!special);
            func_02037208(0x33,-1,0,1);
        }
        break;
    case 11:
        if(func_0202e2f8(value)==0) {
            func_ov002_0229da84((struct Ov002DaSelf *)(base+0x3e0+dst->a*0xcc),(struct Ov002DaEntry *)p);
            func_02037208(0x33,-1,0,1);
        }
        break;
    case 16: break;
    default: {
        int idx=dst->b+dst->c;
        moved=1;
        if(idx<=10) {
            entry_t *q=(entry_t *)(base+dst->a*0xdc)+idx;
            q->a=p->a; q->b=p->b; q->c=p->c; q->d=p->d;
            q->e=p->e; q->f=p->f; q->g=p->g; q->h=p->h; q->i=p->i; q->j=p->j;
            func_02037208(0x33,-1,0,1);
        } else {
            entry_t *q=(entry_t *)(base+0x1b8+dst->a*0x64)+dst->b;
            q->a=p->a; q->b=p->b; q->c=p->c; q->d=p->d;
            q->e=p->e; q->f=p->f; q->g=p->g; q->h=p->h; q->i=p->i; q->j=p->j;
        }
        break;
    }}
    switch(src->b) {
    case 12: case 13: case 14: case 15:
        func_ov002_0229eedc((state_t *)(base+0x280+src->a*0xb0)+(src->b-12));
        break;
    case 11:
        func_ov002_0229db44((struct S *)(base+0x3e0+src->a*0xcc),src->c);
        if(moved==0 && src->c!=0 && src->c>=*(int *)(base+src->a*0xcc+0x484))
            func_ov002_022a60f4(base,src->a,11,src->c-1);
        break;
    default: p->a=0; break;
    }
    if(moved) func_ov002_022a60f4(base,dst->a,dst->b,dst->c);
}


