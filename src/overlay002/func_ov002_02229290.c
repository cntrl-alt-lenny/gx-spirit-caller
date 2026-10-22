typedef unsigned short u16;
struct Self { u16 f0; u16 b0:1; u16 rest:15; };
typedef struct { char pad0[2]; unsigned short bit0:1; unsigned short pad1:15; } S021ef92c;
struct State { char pad[0x5a8]; int state; int index; };
struct Command { char pad[0xd44]; int ready; char pad2[0x28]; int a; int b; int c; };
struct Row { char pad[12]; unsigned int count; char rest[0x858]; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern struct Row data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf178[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
/* These thunks are called with fewer arguments than their C definitions. */
extern int func_ov002_021ca2b8();
extern int func_ov002_02257878();
extern int func_ov002_021de4b0(int arg0,int arg1,int arg2);
extern int func_ov002_021debe0(int a,int b,int c);
extern int func_ov002_021e961c(void *self,int player,int idx);
extern int func_ov002_021ef92c(S021ef92c *p,int arg1,int arg2);
extern int func_ov002_022107b4(int a,int b,int c);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593a8(int a,int b,int c);
extern int func_ov002_022593f4(void);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
extern void func_ov002_02290500(int a,int b,int (*c)(int,int,int));
int func_ov002_02229290(struct Self *self) {
    unsigned int i;
    unsigned int count;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(self->b0) == 0) return 0;
        if (func_ov002_022577dc(self) == 0) return 0;
        count = *(unsigned int *)((char *)data_ov002_022cf178 + (self->b0 & 1) * 0x868);
        for (i = 0; i < count; i++) {
            if (func_ov002_0225368c(self->b0,self->f0,i) != 0) return 0x7f;
            count = data_ov002_022cf16c[self->b0 & 1].count;
        }
        return 0;
    case 0x7f:
        func_ov002_021ae400(self->b0,0x12);
        func_ov002_022593a8(self->b0,1,(int)func_ov002_021ef92c);
        return 0x7e;
    case 0x7e:
        if (func_ov002_022593f4() == 0) return 0x7f;
        func_ov002_021debe0((int)self,data_ov002_022d016c.a,data_ov002_022d016c.b + data_ov002_022d016c.c);
        return 0x7d;
    case 0x7d:
        if (data_ov002_022cd744[self->b0] == 1) {
            func_ov002_02290500(self->b0,self->f0,func_ov002_022107b4);
        } else {
            func_ov002_021ae400(self->b0,0x11e);
            func_ov002_022592ec((int)func_ov002_022107b4);
        }
        return 0x7c;
    case 0x7c:
        if (func_ov002_022593f4() == 0) return 0x7d;
        data_ov002_022ce288.index = data_ov002_022d016c.c;
        return 0x7b;
    case 0x7b:
        func_ov002_0227adb8(self->b0,(int)((char *)&data_ov002_022cf16c[self->b0 & 1] + 0x120 + data_ov002_022ce288.index * 4),1,self->f0 << 16);
        return 0x7a;
    case 0x7a:
        if (func_ov002_02257878((int)self,(int)func_ov002_021e961c) == 0) return 0;
        if (data_ov002_022cd744[self->b0] == 1) data_ov002_022d016c.ready = 1;
        else func_ov002_021ae484(0x68);
        return 0x79;
    case 0x79:
        if (data_ov002_022d016c.ready == 0) return 0;
        func_ov002_022593a8(self->b0,self->f0,(int)func_ov002_021e961c);
        return 0x78;
    case 0x78:
        if (func_ov002_022593f4() == 0) return 0x7a;
        func_ov002_021de4b0((int)self,data_ov002_022d016c.a,data_ov002_022d016c.b + data_ov002_022d016c.c);
        return 0;
    default: return 0;
    }
}


