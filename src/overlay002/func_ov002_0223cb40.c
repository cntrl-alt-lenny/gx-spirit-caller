typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; } Card;
typedef struct { u16 id; u16 side:1; u16 pad:13; u16 flip:1; u16 top:1; } Self;
struct State { char pad0[0x494]; u32 start; u16 entries[128]; char pad1[0x10]; int state; char pad2[0xf0]; int key; int value; u32 max; int unk; u32 count; int flag; int slots[5]; };
struct Other { char pad[0xd44]; u32 count; };
extern struct State data_ov002_022ce288;
extern struct Other data_ov002_022d016c;
extern int func_02031684(int x);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021afba0(void);
extern void func_ov002_021afffc(int id);
extern int func_ov002_021bc618(int a);
extern int func_ov002_0223b468(int key);
extern void func_ov002_0223b584(void);
extern int func_ov002_0223b5cc(int a,int b);
extern int func_ov002_0223b6ec(int a,int b,int c);
extern int func_ov002_0223be40(Self *self);
/* The original final call supplies only two arguments. */
extern int func_ov002_022536e8();
/* The original forwards the incoming argument registers unchanged. */
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_0229cf10(char *dst,const char *fmt,int val);
int func_ov002_0223cb40(Self *self, void *other)
{
    char buf[256];
    u32 side = self->side ^ self->flip;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_02257b48(self, other) == 0) return 0;
        func_ov002_021ae400(side,0x5b);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(side,6,self->id,0);
        return 0x7e;
    case 0x7e:
    {
        Card *p;
        data_ov002_022ce288.key = ((Card *)func_ov002_021afb74())->id;
        p = (Card *)func_ov002_021afb74();
        data_ov002_022ce288.value = ((Card *)func_ov002_021afb74())->value * 2 + p->bit;
        data_ov002_022ce288.max = func_ov002_0223b468(data_ov002_022ce288.key);
        data_ov002_022ce288.flag = func_02031684(data_ov002_022ce288.key) == 0;
        data_ov002_022ce288.count = 0;
        func_ov002_0223b584();
        if (data_ov002_022ce288.key == 0x1a4e) func_ov002_021ae400(side,0x5c);
        else {
            func_ov002_0229cf10(buf,(const char *)12,data_ov002_022ce288.max);
            func_ov002_021ae400(side,(int)buf);
        }
        return 0x7d;
    }
    case 0x7d:
        if (data_ov002_022ce288.key == 0x1a4e) {
            if (data_ov002_022ce288.count >= 2) {
                func_ov002_021af9d0(side,0x48,self->id,data_ov002_022ce288.key);
                return 0x7c;
            }
        } else if (func_ov002_021bc618(side) != 0 || data_ov002_022ce288.count != 0) {
            if (data_ov002_022ce288.key == 0x157e) {
                u32 n = 5 - data_ov002_022ce288.count;
                if (n >= 32) n = 32;
                func_ov002_021af9d0(side,n+6,self->id,data_ov002_022ce288.key);
                return 0x7c;
            } else {
                u32 n = data_ov002_022ce288.max - data_ov002_022ce288.count;
                if (n == func_ov002_022536e8((void *)side,self->id,data_ov002_022ce288.key)) {
                    if (n >= 32) n = 32;
                    func_ov002_021af9d0(side,n+6,self->id,data_ov002_022ce288.key);
                    return 0x7c;
                }
            }
        }
        func_ov002_021af9d0(side,6,self->id,data_ov002_022ce288.key);
        return 0x7c;
    case 0x7c:
    {
        u32 i, n;
        Card *p;
        u32 id;
        for (i=0; i < (n=data_ov002_022d016c.count); i++) {
            func_ov002_021afffc(i+1);
            id = ((Card *)func_ov002_021afb74())->id;
            if (func_ov002_021afba0() == 14) func_ov002_0223b5cc(id,1);
            else func_ov002_0223b6ec(side,func_ov002_021afba0(),1);
            p = (Card *)func_ov002_021afb74();
            data_ov002_022ce288.entries[(data_ov002_022ce288.start + data_ov002_022ce288.count)&127] = ((Card *)func_ov002_021afb74())->value * 2 + p->bit;
            data_ov002_022ce288.count++;
        }
        if (data_ov002_022ce288.count < data_ov002_022ce288.max) return 0x7d;
        if (data_ov002_022ce288.key == 0x1a4e) {
            if (data_ov002_022ce288.count == 2 && data_ov002_022ce288.count - n < 2) {
                data_ov002_022ce288.slots[1] = 7;
                if (func_ov002_022536e8((void *)side,self->id) != 0) return 0x7d;
            }
            data_ov002_022ce288.max = data_ov002_022ce288.count;
        }
        data_ov002_022ce288.count = 0;
        return 0x64;
    }
    default: return func_ov002_0223be40(self);
    }
}









