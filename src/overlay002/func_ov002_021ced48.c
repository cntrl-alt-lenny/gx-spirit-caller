typedef unsigned short u16;
typedef struct Rec { unsigned int id:13; unsigned int flag13:1; unsigned int b14:3; unsigned int b17:1; unsigned int b18:1; unsigned int b19:1; unsigned int b20:1; unsigned int b21:1; unsigned int hi:8; unsigned int pad:2; } Rec;
typedef struct { u16 player:1; u16 kind:5; u16 extra:8; u16 flag14:1; u16 flag15:1; } Packed;
typedef struct { u16 flags, kind, dest, id; char pad[0x804]; int active, state, timer; Rec card; } State;
extern State data_ov002_022ce950;
extern int data_ov002_022cd73c[];
extern Rec data_ov002_022cf168;
extern char data_ov002_022cf288[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
extern int func_0202e2f8(int x);
extern int func_ov002_021b0c04(void *self, int arg1);
extern void func_ov002_021b1f20(int a0,int a1,int a2,int a3,int a4);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern unsigned int func_ov002_021b947c(int id);
extern void func_ov002_021baa04(int player,int kind,int extra);
extern void func_ov002_021bab38(int arg0,int kind,int v,struct Rec *p);
extern void func_ov002_021c2934(int player,int arg1,int arg2);
extern void func_ov002_021c29bc(int player,int arg);
extern void *func_ov002_021c93f0(int player,int kind,int extra);
extern int func_ov002_021c97f8(int player,int kind,int extra);
extern int func_ov002_021c988c(int player,int kind,int extra);
extern int func_ov002_0229ade0(int a,int b,int c,int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021ced48(void) {
    int player = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int kind = data_ov002_022ce950.kind;
    int dest = data_ov002_022ce950.dest;
    int id = data_ov002_022ce950.id;
    int extra = (u16)(func_ov002_021b947c(id) >> 16);
    Rec *p;
    Packed from, to;
    switch (data_ov002_022ce950.state) {
    case 0:
        if (func_ov002_0229c7f8(0x2a) != 0) return;
        data_ov002_022ce950.state++;
        break;
    case 1:
        func_ov002_0229ade0(0x2a,player,kind,id);
        data_ov002_022ce950.state++;
        data_ov002_022ce950.timer = 0;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x2a) != 0) return;
        data_ov002_022ce950.state++;
        break;
    case 3:
        p = func_ov002_021c93f0(player,kind,extra);
        p->b20 = 0;
        p->b17 = 0;
        p->b19 = 0;
        p->b18 = 0;
        if (dest == 15) p->b21 = 0;
        if (dest == 14 && func_0202e2f8(p->id) == 0) {
            if (kind < 5 && dest == 14 && func_0202e234(p->id) != 0) {
                if (player == p->flag13) *(unsigned int *)(data_ov002_022cf288 + (player & 1) * 0x868) |= 0x2000000;
                if ((int)func_0202b8a8(p->id) >= 8) func_ov002_021b1f20(player,11,1,0x165a,0);
                func_ov002_021c2934(0,0x14bf,1 << (p->flag13 << 3));
                func_ov002_021c2934(1,0x14bf,1 << (p->flag13 << 3));
            }
            func_ov002_021c2934(0,0x1361,1 << (p->flag13 << 3));
            func_ov002_021c2934(1,0x1361,1 << (p->flag13 << 3));
            if (func_0202e234(p->id) != 0) func_ov002_021c29bc(1-p->flag13,0x1574);
        }
        if (dest == 15 && func_0202e2f8(p->id) == 0) {
            func_ov002_021c2934(0,0x16da,1);
            func_ov002_021c2934(1,0x16da,1);
        }
        if (player == data_ov002_022cd73c[1]) func_ov002_021b0c04((void *)0x1e,1);
        func_ov002_021b91c4((int *)&data_ov002_022cf168,(const int *)p);
        from.player = (u16)player;
        from.kind = (u16)kind;
        from.extra = (u16)extra;
        from.flag15 = (u16)func_ov002_021c97f8(from.player,from.kind,from.extra);
        from.flag14 = (u16)func_ov002_021c988c(from.player,from.kind,from.extra);
        to.player = (u16)data_ov002_022ce950.card.flag13;
        to.kind = (u16)dest;
        to.extra = (u16)(dest != 13);
        func_ov002_021baa04(from.player,from.kind,from.extra);
        func_ov002_021bab38(to.player,to.kind,dest == 15 ? 0 : to.extra,&data_ov002_022cf168);
        to.flag15 = (u16)func_ov002_021c97f8(to.player,to.kind,to.extra);
        to.flag14 = (u16)func_ov002_021c988c(to.player,to.kind,to.extra);
        func_ov002_0229ade0(0x18,0x80000 | (u16)(data_ov002_022ce950.card.hi * 2 + data_ov002_022ce950.card.flag13),*(u16 *)&from,*(u16 *)&to);
        data_ov002_022ce950.state++;
        break;
    default:
        data_ov002_022ce950.active = 0;
        break;
    }
}



