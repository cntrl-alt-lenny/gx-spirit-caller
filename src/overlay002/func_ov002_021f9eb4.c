typedef unsigned short u16;
struct St { u16 f0; u16 bit:1; u16 field:5; u16 rest:10; u16 pad[2]; u16 id; u16 mask; u16 count; };
struct State { char pad[0x5b4]; int step; };
struct Result { char pad[0xd70]; int player; int base; int idx; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int a,int b,int c,int d);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021deb28(int a,int b);
/* Original calls these helpers without supplying their unused argument. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_0223b430(int a,int b,int c);
extern int func_ov002_0223b468(int key);
extern int func_ov002_0223b4c4(int key,int idx);
extern int func_ov002_022575c8(int a0,int a1,int a2);
extern int func_ov002_022593a8(int a,int b,int c);
extern int func_ov002_022593f4(void);
int func_ov002_021f9eb4(struct St *p) {
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021ae400(p->bit,0x1a);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        func_ov002_021af9d0(p->bit,6,p->f0,0);
        func_ov002_021e2b3c();
        data_ov002_022ce288.step++;
        return 0;
    case 2:
        p->id = (unsigned)(*func_ov002_021afb74() << 19) >> 19;
        p->mask=0;
        p->count=0;
        func_ov002_021ae400(p->bit,0x12);
        data_ov002_022ce288.step++;
        return 0;
    case 3:
        func_ov002_022593a8(p->bit,1,(int)func_ov002_022575c8);
        data_ov002_022ce288.step++;
        return 0;
    case 4:
        if (func_ov002_022593f4()!=0) {
            int idx, base, i, player, id, n;
            id=p->id;
            player=data_ov002_022d016c.player;
            base=data_ov002_022d016c.base;
            idx=data_ov002_022d016c.idx;
            n=func_ov002_0223b468(id);

            for (i=0;i<n;i++) {
                if (!(p->mask & (1<<i))) {
                    if (func_ov002_0223b430(func_ov002_0223b4c4(id,i),player,base+idx)!=0) {
                        p->mask |= 1<<i;
                        break;
                    }
                }
            }
            func_ov002_021deb28(player,base+idx);
            p->count++;
            if (p->count >= n-1) {
                data_ov002_022ce288.step++;
                return 0;
            }
        }
        data_ov002_022ce288.step--;
        return 0;
    case 5:
        func_ov002_021deb28(p->bit,p->field);
        func_ov002_021e2c5c();
        data_ov002_022ce288.step++;
        return 0;
    default: return 1;
    }
}


