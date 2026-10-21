typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 f0; u16 player:1; u16 rest:15; u16 f4,f6,value,count; };
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct State { char pad[0x5a8]; int phase; };
struct Command { char pad[0xd78]; int index; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_022107b4(int a,int b,int c);
extern void func_ov002_02290500(int a,int b,int (*cb)(int,int,int));
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021c38c4(int a,int b);
extern int func_ov002_021e278c(int arg0,int arg1);
/* Original passes no argument to the unused parameter. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021af9d0(int a,int b,int c,u32 d);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021d8128(int arg0,void *arg1,int arg2);
extern unsigned int func_0202b8a8(int id);
extern void func_ov002_021e276c(int self,int a,int b,int c);
/* Original passes no argument to the unused parameter. */
extern void func_ov002_021e2c5c();
int func_ov002_02235480(struct Self *self,void *q) {
    switch(data_ov002_022ce288.phase) {
    case 128:
        if (!func_ov002_02257b48(self,q)) return 0;
        func_ov002_021ae400(self->player,0x49);
        return 127;
    case 127:
        if (data_ov002_022cd744[self->player]==1) {
            func_ov002_02290500(self->player,self->f0,func_ov002_022107b4);
        } else {
            func_ov002_022592ec((int)func_ov002_022107b4);
        }
        return 126;
    case 126:
        {
            struct Key *key;
            if (!func_ov002_022593f4()) return 128;
            key=(struct Key *)(data_ov002_022cf16c+(self->player&1)*0x868+0x120);
            key+=data_ov002_022d016c.index;
            self->value=key->a*2+key->b;
            self->count=func_ov002_021c38c4(self->player,self->value)*2;
            func_ov002_021e278c(self->player,self->value);
            return 125;
        }
    case 125:
        func_ov002_021ae400(self->player,0x56);
        func_ov002_021e2b3c();
        return 124;
    case 124:
        func_ov002_021af9d0(self->player,6,self->f0,self->count<<16);
        return 123;
    case 123:
        func_ov002_021d8128(self->player,func_ov002_021afb74(),0);
        self->count-=func_0202b8a8(((struct Key *)func_ov002_021afb74())->id);
        return self->count ? 124 : 122;
    case 122:
        func_ov002_021e276c(self->player,self->f0,1,self->value);
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}
