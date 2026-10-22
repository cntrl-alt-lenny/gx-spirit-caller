typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 player:1, kind:5, extra:8, a:1, b:1; } Packed;
typedef struct { u16 f0,f2; Packed f4; u16 f6; char pad[0x804]; int active,state; } State;
extern State data_ov002_022ce950;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cf168;
extern char data_ov002_022cf288[];
extern char data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021b0c04(int self,int arg1);
extern void func_ov002_021b1f20(int,int,int,int,int);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern void func_ov002_021b9368(int,int,int *,int);
extern int func_ov002_021b9aa8(u32 a,u32 b);
extern void func_ov002_021baa04(int player,int kind,int extra);
extern int func_ov002_021baca8(int,int,int);
extern void func_ov002_021c9b80(int,int,int,int);
extern int func_ov002_0229ade0(int,int,int,int);
extern int func_ov002_0229c7f8(int);
static inline u16 pair(int lo,int hi) { return (unsigned char)lo | ((unsigned char)hi << 8); }
static inline int word(u16 hi,u16 lo) { return lo | (hi << 16); }
void func_ov002_021d264c(void) {
    int player,card,kind,id,flag,index;
    Packed input,p,q;
    int i,j;
    player = (data_ov002_022ce950.f0 & 0x8000) ? 1:0;
    input = data_ov002_022ce950.f4;
    id = data_ov002_022ce950.f6;
    card = data_ov002_022ce950.f2;
    kind = input.kind;
    flag = input.a;
    index = func_ov002_021b9aa8(player,id);
    switch(data_ov002_022ce950.state) {
    case 0:
        func_ov002_0229ade0(0x44,player,card,flag);
        data_ov002_022ce950.state++;
        break;
    case 1:
        if(func_ov002_0229c7f8(0x44)) return;
        func_ov002_021b91c4(&data_ov002_022cf168,(int *)(data_ov002_022cf16c+(player&1)*0x868+0x120+index*4));
        p.player = (u16)player;
        p.kind = 11;
        p.extra = (u16)index;
        p.b = 0;
        p.a = (u16)flag;
        q.player = (u16)player;
        q.kind = (u16)kind;
        q.extra = 0;
        q.b = 0;
        q.a = (u16)flag;
        func_ov002_021baa04(p.player,p.kind,p.extra);
        func_ov002_021b9368(player,kind,&data_ov002_022cf168,flag);
        if(flag) func_ov002_021c9b80(player,kind,1,1);
        func_ov002_0229ade0(0x18,word((u16)(flag ? 3:4),(u16)id),*(u16 *)&p,*(u16 *)&q);
        data_ov002_022ce950.state++;
        break;
    case 2:
        if(!flag) {
            if(*(int *)(data_ov002_022d016c+0xcf8)==2)
                *(int *)(data_ov002_022cf288+(*(int *)(data_ov002_022d016c+0xcec)&1)*0x868) |= 0x100000;
            if(func_0202b878(card)==0x16) {
                for(i=0;i<2;i++) {
                    for(j=5;j<10;j++) {
                        if(func_ov002_021baca8(i,j,0x1390))
                            func_ov002_021b1f20(player,kind,8,pair(i,j),0);
                    }
                }
            }
            func_ov002_0229ade0(0x1c,player,kind,0);
            if(player==data_ov002_022cd73c[1]) func_ov002_021b0c04(0x1d,1);
        } else {
            if(func_0202b878(card)==0x17) func_ov002_021b1f20(player,11,1,0x198a,1);
            func_ov002_0229ade0(0x43,player,card,2);
        }
        data_ov002_022ce950.state++;
        break;
    case 3:
        if(func_ov002_0229c7f8(0x1c)) return;
        if(func_ov002_0229c7f8(0x43)) return;
        data_ov002_022ce950.active=0;
        return;
    }
}


