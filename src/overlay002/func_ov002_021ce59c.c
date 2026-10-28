typedef unsigned short u16;
typedef struct Rec { unsigned int id:13; unsigned int flag13:1; unsigned int b14:3; unsigned int b17:1; unsigned int b18:1; unsigned int b19:1; unsigned int b20:1; unsigned int b21:1; unsigned int hi:8; unsigned int pad:2; unsigned int rest[3]; unsigned int low:25; unsigned int marker:1; unsigned int upper:6; } Rec;
typedef struct { u16 player:1; u16 kind:5; u16 extra:8; u16 flag14:1; u16 flag15:1; } Packed;
typedef struct { u16 flags, kind, dest, opt; char pad[0x804]; int active, state, timer; Rec card; } State;
typedef struct { int a,b; char pad[0x14]; int c,d; char pad2[0x34]; int e; char pad3[0x34]; int f; } Info;
extern State data_ov002_022ce950;
extern Info data_ov002_022cd3f4;
extern Rec data_ov002_022cd4b8, data_ov002_022cd4cc, data_ov002_022cf168;
extern char data_ov002_022cf288[], data_ov002_022cf282[], data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202de9c(int unused0), func_0202e234(int x), func_0202e2f8(int unused0), func_0202eac8(int id), func_0202effc(int x);
extern int func_ov002_021b0c04(int self,int arg1);
extern void func_ov002_021b1f20(int a0,int a1,int a2,int a3,int a4);
extern void func_ov002_021b212c(int idx,int val,int flag);
extern int func_ov002_021b9128(int a,int b);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern void func_ov002_021baa04(int player,int kind,int extra);
extern void func_ov002_021bab38(int arg0,int kind,int v,struct Rec *p);
extern int func_ov002_021baca8(int a0,int a1,int a2);
extern void func_ov002_021c2934(int player,int arg1,int arg2), func_ov002_021c29bc(int player,int arg);
extern int func_ov002_021c97f8(int player,int kind,int extra), func_ov002_021c988c(int player,int kind,int extra);
extern int func_ov002_0229ade0(int a,int b,int c,int d), func_ov002_0229c7f8(int arg);
void func_ov002_021ce59c(void) {
    int player = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int kind = data_ov002_022ce950.kind;
    int dest = data_ov002_022ce950.dest;
    int opt = (data_ov002_022ce950.opt & 1) ? 1 : 0;
    Rec *p = player == data_ov002_022cd3f4.a && kind == data_ov002_022cd3f4.c ? &data_ov002_022cd4b8 : &data_ov002_022cd4cc;
    int id = p->id;
    int i;
    Packed from,to;
    switch (data_ov002_022ce950.state) {
    case 0:
        func_ov002_0229ade0(0x1e,player,kind,p->hi * 2 + p->flag13);
        data_ov002_022ce950.state++; data_ov002_022ce950.timer=0; return;
    case 1:
        if (func_ov002_0229c7f8(0x1e)) return;
        data_ov002_022ce950.state++; return;
    case 2:
        p->b18=opt; p->b19=1; p->b17=1; p->b20=0;
        if (dest==15) p->b21=0;
        if (dest==14 && func_0202e2f8(p->id)==0) {
            if (kind<5 && dest==14 && func_0202e234(p->id)!=0) {
                if (player==p->flag13) *(unsigned int *)(data_ov002_022cf288+(player&1)*0x868)|=0x2000000;
                if ((int)func_0202b8a8(p->id)>=8) func_ov002_021b1f20(player,11,1,0x165a,0);
                func_ov002_021c2934(0,0x14bf,1<<(p->flag13<<3));
                func_ov002_021c2934(1,0x14bf,1<<(p->flag13<<3));
                if (func_ov002_021b9128(p->id,4)) func_ov002_021c29bc(player,0x1762);
                if (func_0202effc(p->id)) for (i=5;i<10;i++) if (func_ov002_021baca8(player,i,0x1972)) func_ov002_021b1f20(player,i,1,0x1972,0);
                if ((*(unsigned int *)((char *)p+0x10) >> 25) & 1) func_ov002_021b212c(*(u16 *)(data_ov002_022cf282+(player&1)*0x868),0x197d,0);
            }
            func_ov002_021c2934(0,0x1361,1<<(p->flag13<<3));
            func_ov002_021c2934(1,0x1361,1<<(p->flag13<<3));
            if (func_0202e234(p->id)) func_ov002_021c29bc(1-p->flag13,0x1574);
        }
        if (dest==15 && func_0202e2f8(p->id)==0) { func_ov002_021c2934(0,0x16da,1); func_ov002_021c2934(1,0x16da,1); }
        if (func_0202e234(id) && (int)func_0202b8a8(id)<=2 && !func_0202de9c(id)) func_ov002_021b1f20(player,11,1,0x17b2,0);
        if (func_0202eac8(id)) func_ov002_021b1f20(player,11,2,0x19b8,0);
        func_ov002_021b91c4((int *)&data_ov002_022cf168,(const int *)p);
        if (player==(data_ov002_022cd73c[1]^1) && opt) {
            func_ov002_021b0c04(15,1);
            if (*(int *)(data_ov002_022d016c+0xcec)==player) func_ov002_021b0c04(16,1);
            if (dest==15 && !func_0202e2f8(id)) { func_ov002_021b0c04(0x26,1); if (func_0202e234(data_ov002_022ce950.card.id)) func_ov002_021b0c04(0x27,1); }
            if (dest==13 && !func_0202e2f8(id)) { func_ov002_021b0c04(0x2c,1); func_ov002_021b0c04(0x2a,1); }
        }
        if (player==data_ov002_022cd3f4.a && kind==data_ov002_022cd3f4.c) data_ov002_022cd3f4.e=0;
        else if (player==data_ov002_022cd3f4.b && kind==data_ov002_022cd3f4.d) data_ov002_022cd3f4.f=0;
        from.player=(u16)player; from.kind=(u16)kind; from.extra=0xff; from.flag15=*(u16 *)((char *)p+6); from.flag14=*(u16 *)((char *)p+8);
        to.player=(u16)data_ov002_022ce950.card.flag13; to.kind=(u16)dest; to.extra=(u16)(dest!=13);
        func_ov002_021baa04(from.player,from.kind,from.extra);
        func_ov002_021bab38(to.player,to.kind,to.extra,&data_ov002_022cf168);
        to.flag15=(u16)func_ov002_021c97f8(to.player,to.kind,to.extra);
        to.flag14=(u16)func_ov002_021c988c(to.player,to.kind,to.extra);
        func_ov002_0229ade0(0x18,0x70000 | (u16)(data_ov002_022ce950.card.hi*2+data_ov002_022ce950.card.flag13),*(u16 *)&from,*(u16 *)&to);
        data_ov002_022ce950.state++; return;
    case 3:
        func_ov002_0229ade0(0x4a,player,data_ov002_022ce950.card.hi*2+data_ov002_022ce950.card.flag13,0);
        data_ov002_022ce950.state++; return;
    case 4:
        if (!func_ov002_0229c7f8(0x4a)) data_ov002_022ce950.active=0;
    }
}




