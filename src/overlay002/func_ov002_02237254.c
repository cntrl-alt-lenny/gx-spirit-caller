typedef unsigned short u16;
typedef unsigned int u32;
struct Ov002Self { u16 f0; u16 b0:1; u16 pad:15; u16 unused[2]; u16 index; u16 count; };
struct State { char pad[0x5a8]; int state; };
struct Global { char pad[0xd44]; int count; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern int func_ov002_021ae484(int x);
extern void func_ov002_021af9d0(int a,int b,int c,int d);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021bae7c(int a,int b,int c);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bc618(int arg0);
/* Original caller supplies only r0 to the four-argument forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021de408(int a,int b);
/* Original calls omit the unused argument of these two helpers. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_021ee4c8(struct Ov002Self *self,int player,int idx);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern u32 func_ov002_02257750(void *ctx,int (*cb)(void *,int,int));
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_02237254(struct Ov002Self *p) {
    int n;
    switch(data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021de408((int)p,func_ov002_02257750(p,(void *)func_ov002_021ee4c8));
        return 0x7f;
    case 0x7f:
        if (func_ov002_021bc618(p->b0)==0) return 0;
        if (func_ov002_021ca2b8(p->b0)==0) return 0;
        if (func_ov002_0225368c(p->b0,p->f0,0)==0) return 0;
        if (func_ov002_021bb068(0x159d)==0 || func_ov002_021bae7c(p->b0,0x158b,-1)!=0) {
            func_ov002_021ae484(0x2f);
            return 0x7e;
        }
        return 0;
    case 0x7e:
        if (data_ov002_022d016c.count==0) return 0;
        n=func_ov002_021bc618(p->b0);
        if(n>=2) n=2;
        if(n>=0x20) n=0x20;
        func_ov002_021af9d0(p->b0,n+0x27,p->f0,0);
        return 0x7d;
    case 0x7d:
        p->index=0;
        p->count=data_ov002_022d016c.count;
        func_ov002_021e2b3c();
        return 0x7c;
    case 0x7c:
        if(p->index<p->count) {
            u32 *v=func_ov002_021b004c(p->index+1);
            func_ov002_0227adb8(p->b0,(int)v,1,p->f0<<16);
            p->index++;
            return 0x7c;
        }
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}


