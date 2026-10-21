typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
typedef struct { char pad0[0xe]; short y; char pad10[0x20]; int x, position; char pad38[0x24]; unsigned short background:2, flags:14; } State;
typedef struct { char _pad[0x30]; int f_30, f_34; } state_30_34_t;
typedef struct { char pad0[0xc]; short start; char padE[6]; unsigned short width; char pad16[10]; unsigned short *map; unsigned short palette; } Map;
typedef struct { short left,top,right,bottom; } Rect;
typedef struct { int unk0,scroll; char pad08[0x10]; int active; char pad1c[0x18]; Rect rect[5]; char pad5c[0x14]; unsigned dirty:1,disabled:1,rest:30; char pad74[0x18]; int hit[6]; } Scroll;
struct Entry { int a,b; };
struct S { char pad0[0x2c]; void *cell; char pad30[0x24]; short x,y,right,bottom; int index,min,max,state; short height,pad6e; volatile int timer; unsigned disabled:1,rest:31; };
struct S575 { char _pad[0x56]; short f56,_58,f5a; char _g5c[4]; int f60,f64; char _g68[4]; short f6c; };
typedef struct { char pad0[0x40]; Scroll *scroll; char pad44[0x50]; State *bg; } Global;
typedef struct { char pad0[4]; int selected; char pad8[0x10]; char anim[0x1c]; void *window; char pad38[0x4c]; void *manager; state_30_34_t *list; char cursor[0x2cc]; unsigned dirty:1, pending:1, rest:30; } Overlay;
extern Global data_ov010_021b9884;
extern Overlay data_ov010_021b9890;
extern char data_ov010_021b98a8[];
extern void func_ov005_021abb00(State *p);
extern int func_ov010_021b2630(Scroll *p,void *arg1,char **dst);
extern int func_ov010_021b238c(void *arg0);
extern void func_ov010_021b23f4(void *arg0,int arg1);
/* This caller also passes the list pointer in r0. */
extern int func_ov005_021ac9c8(void *obj);
/* Signed division returns quotient in r0 and remainder in r1. */
extern long long func_020b3870(int a,int b);
extern void func_ov005_021abc68(void *obj,int a,int b);
extern void func_ov005_021abe5c(void *p);
extern void func_ov005_021ac91c(Map *o);
extern int func_ov005_021ab858(void *p,int dt,void *anim,struct Entry **out);
extern void func_ov005_021abc74(state_30_34_t *p,int *out_a,int *out_b);
extern int func_ov005_021ac984(void *o);
extern int func_ov005_021ac9d0(void *obj,int idx);
extern void func_ov010_021b3a14(void *p,int v);
extern int func_ov005_021ab108(void *o,int a);
extern void func_ov010_021b3734(struct S575 *self,int a1,int a2);
extern int func_ov010_021b3774(struct S *p,int dt,void *anim,struct Entry **out);
int func_ov010_021b6c4c(struct Entry **out) {
    Overlay *p = &data_ov010_021b9890;
    int total, position, count;
    int x,y;
    func_ov005_021abb00(data_ov010_021b9884.bg);
    total = 0;
    total += func_ov010_021b2630(data_ov010_021b9884.scroll,data_ov010_021b98a8,(char **)out);
    position = func_ov010_021b238c(data_ov010_021b9884.scroll);
    if (data_ov010_021b9884.scroll->active != 0) p->dirty = 1;
    else if (*(int *)((char *)p->list + 0x54) == 0) {
        count = func_ov005_021ac9c8(p->list);
        if (count > 0) {
            int rem = (int)(func_020b3870(position,count) >> 32);
            if (rem >= (count >> 1)) {
                position += count;
                p->dirty = 1;
                position -= rem;
            } else if (rem > 0) {
                position -= rem;
                p->dirty = 1;
            }
            func_ov010_021b23f4(p->window,position);
        }
    }
    func_ov005_021abc68(p->list,0,position);
    if (p->dirty == 1) {
        p->dirty = 0;
        func_ov005_021abe5c(p->list);
        func_ov005_021ac91c((Map *)p->list);
    }
    {
        int result = func_ov005_021ab858(p->list,0x1000,p->anim,out);
        total += *(unsigned short *)((char *)p->list + 0x38);
        if (result == 1) {
            func_ov005_021abc74(p->list,&x,&y);
            func_ov010_021b23f4(p->window,y);
            p->dirty = 1;
        }
    }
    if (p->pending == 1 && p->dirty == 0) {
        count = func_ov005_021ac984(p->list);

        for (position=0; position<count; position++) {
            if (p->selected == func_ov005_021ac9d0(p->list,position)) {
                func_ov010_021b3a14(p->cursor,position);
                break;
            }
        }
        p->pending = 0;
    }
    func_ov010_021b3734((struct S575 *)p->cursor,0,func_ov005_021ab108(p->manager,2)-1);
    return total + func_ov010_021b3774((struct S *)p->cursor,0x1000,p->anim,out);
}



