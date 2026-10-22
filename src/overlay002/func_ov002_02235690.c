typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 f0; u16 player:1; u16 rest:15; };
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct State { char pad[0x5a8]; int phase; int count; };
extern struct State data_ov002_022ce288;
extern unsigned int func_0202b8c0(int id);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021d59cc(int a,int b,int c,int d,u16 e);
extern void func_ov002_021d6714(int a,int b,int c);
extern int func_ov002_021d8414(int a,int b,int c,int d,int e,int f,int g);
extern int func_ov002_021de480(int a,int b,int c,int d);
extern int func_ov002_021df708(int a,int b);
extern int func_ov002_021e286c(int a);
extern int func_ov002_021e2b1c(int a);
extern int func_ov002_0225368c(int a,int b,int c);
extern void func_ov002_0226b054(int a);
int func_ov002_02235690(struct Self *self) {
    switch(data_ov002_022ce288.phase) {
    case 128:
        if (!func_ov002_0225368c(self->player,self->f0,0)) {
            func_ov002_021ae400(self->player,13);
            return 120;
        } else {
            func_ov002_021ae400(self->player,94);
            return 127;
        }
    case 127:
        func_ov002_021af9d0(self->player,6,self->f0,0);
        return 126;
    case 126:
        {
            struct Key *key;
            if (func_0202b8c0(((struct Key *)func_ov002_021afb74())->id)==2) {
                func_ov002_021de480(self->player,10,0,0);
                data_ov002_022ce288.count=10;
            } else {
                data_ov002_022ce288.count=func_ov002_021bd030(self->player);
            }
            key=(struct Key *)func_ov002_021afb74();
            func_ov002_021d8414(self->player,13,((struct Key *)func_ov002_021afb74())->a*2+key->b,self->player,data_ov002_022ce288.count,0,0);
            return 125;
        }
    case 125:
        func_ov002_021d59cc(self->player,data_ov002_022ce288.count,self->f0,1,0);
        func_ov002_021d6714(self->player,data_ov002_022ce288.count,1);
        func_ov002_021df708(self->player,((struct Key *)func_ov002_021afb74())->id);
        func_ov002_021e2b1c(30);
        func_ov002_021d6714(self->player,data_ov002_022ce288.count,0);
        return 100;
    case 120:
        func_ov002_0226b054(1-self->player);
        return 100;
    case 100:
        func_ov002_021e286c(self->player);
        return 0;
    }
    return 0;
}
