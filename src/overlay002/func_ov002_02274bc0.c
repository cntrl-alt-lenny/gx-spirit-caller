typedef unsigned int u32;
typedef unsigned short u16;
struct State { u32 side:1; u32 spare:7; u32 id:15; u32 rest:9; char pad[0x14]; u32 phase:8; u32 mask:8; u32 rem:16; };
extern struct State data_ov002_022cd300;
extern struct { u32 phase:8; u32 mask:8; u32 rest:16; } data_ov002_022cd318;
struct Work { char pad[0x494]; int start; u16 cards[128]; char pad2[0x10c]; int count; int unused; u32 done; int unused2; int list[3]; };
extern struct Work data_ov002_022ce288;
extern u16 data_ov002_022ce720[];
extern int data_ov002_022cd744[];
struct Duel { char pad[0xcec]; int side; char pad2[0x80]; int player; int a; int b; };
extern struct Duel data_ov002_022d016c;
struct Card { u32 id:13; u32 flag:1; u32 spare:8; u32 num:8; u32 rest:2; int other[4]; };
struct Player { char pad[0x30]; struct Card card[11]; char pad2[0x75c]; };
extern struct Player data_ov002_022cf16c[];
extern int func_0202ed04(int id);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021b947c(int a);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021de5d4(int a, int b, int c);
extern int func_ov002_021dea48(int p, int slot, int q, u16 val);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_02274ae0(int a, int b, int c);
extern void func_ov002_02290500(int a, int b, int callback);
int func_ov002_02274bc0(void) {
 int i, j, value, player, slot, card, packed;
 switch(data_ov002_022cd300.phase) {
 case 0:
 data_ov002_022cd300.mask=0;
 data_ov002_022ce288.count=2;
 switch(data_ov002_022cd300.id) {
 case 0x15b1: data_ov002_022ce288.list[0]=0x1580; data_ov002_022ce288.list[1]=0x15b0; break;
 case 0x15b4: data_ov002_022ce288.list[0]=0x1580; data_ov002_022ce288.list[1]=0x15b0; data_ov002_022ce288.list[2]=0x15b3; data_ov002_022ce288.count=3; break;
 case 0x15f9: data_ov002_022ce288.list[0]=0x1580; data_ov002_022ce288.list[1]=0x15b3; break;
 case 0x15fa: data_ov002_022ce288.list[0]=0x15b0; data_ov002_022ce288.list[1]=0x15b3; break;
 case 0x1953: data_ov002_022ce288.list[0]=0x1947; data_ov002_022ce288.list[1]=0x194b; break;
 case 0x1954: data_ov002_022ce288.list[0]=0x1953; data_ov002_022ce288.list[1]=0x15b4; break;
 case 0x1a6d: data_ov002_022ce288.list[0]=0x19fd; data_ov002_022ce288.list[1]=0x1a74; break;
 case 0x1a6e: data_ov002_022ce288.list[0]=0x19fd; data_ov002_022ce288.list[1]=0x1a70; break;
 case 0x1a6f: data_ov002_022ce288.list[0]=0x19fd; data_ov002_022ce288.list[1]=0x1a75; break;
 case 0x1b4c: data_ov002_022ce288.list[0]=0x19fd; data_ov002_022ce288.list[1]=0x1a73; break;
 case 0x1b4d: data_ov002_022ce288.list[0]=0x19fd; data_ov002_022ce288.list[1]=0x1a71; break;
 case 0x1b4e: data_ov002_022ce288.list[0]=0x19fd; data_ov002_022ce288.list[1]=0x1a72; break;
 }
 data_ov002_022ce288.done=0;
 if(func_0202ed04(data_ov002_022cd300.id)) func_ov002_021ae400(data_ov002_022cd300.side,0x4c);
 else func_ov002_021ae400(data_ov002_022cd300.side,0x46);
 data_ov002_022cd318.phase++;
 return 0;
 case 1:
 if(data_ov002_022cd744[data_ov002_022cd300.side]==1) func_ov002_02290500(data_ov002_022cd300.side,data_ov002_022cd300.id,(int)func_ov002_02274ae0);
 else func_ov002_022592ec((int)func_ov002_02274ae0);
 data_ov002_022cd318.phase++;
 return 0;
 case 2:
 if(func_ov002_022593f4()) {
 player=data_ov002_022d016c.player;
 slot=data_ov002_022d016c.a+data_ov002_022d016c.b;
 card=func_ov002_021b9ecc(player,slot);
 value=data_ov002_022cf16c[player & 1].card[slot].num*2+data_ov002_022cf16c[player & 1].card[slot].flag;
 for(i=0;i<data_ov002_022ce288.count;i++) if(card==data_ov002_022ce288.list[i]) data_ov002_022ce288.list[i]=0;
 data_ov002_022ce720[(data_ov002_022ce288.start+*(volatile u32 *)&data_ov002_022ce288.done)&127]=value;
 data_ov002_022ce288.done++;
 if(data_ov002_022ce288.done<data_ov002_022ce288.count) data_ov002_022cd318.phase--;
 else data_ov002_022cd318.phase++;
 return 0;
 }
 data_ov002_022cd300.phase=0;
 return 0;
 case 3:
 if(data_ov002_022ce288.done==data_ov002_022ce288.count) {
 for(i=0;i<data_ov002_022ce288.count-1;i++) {
 packed=func_ov002_021b947c(data_ov002_022ce288.cards[(data_ov002_022ce288.start+i)&127]);
 for(j=1;j<data_ov002_022ce288.count;j++) {
 value=func_ov002_021b947c(data_ov002_022ce288.cards[(data_ov002_022ce288.start+j)&127]);
 if((u32)((u16)packed>>8 &255)>(u32)((u16)value>>8 &255)) {
 u16 temp;
 packed=value;
 temp=data_ov002_022ce288.cards[(data_ov002_022ce288.start+i)&127];
 data_ov002_022ce288.cards[(data_ov002_022ce288.start+i)&127]=data_ov002_022ce288.cards[(data_ov002_022ce288.start+j)&127];
 data_ov002_022ce288.cards[(data_ov002_022ce288.start+j)&127]=temp;
 }
 }
 }
 }
 data_ov002_022ce288.done--;
 value=func_ov002_021b947c(data_ov002_022ce720[(data_ov002_022ce288.start+data_ov002_022ce288.done)&127]);
 slot=((u16)value>>8 &255)+(u16)((u32)value>>16);
 if(slot<=10) {
 if(func_0202ed04(data_ov002_022cd300.id)) {
 player=data_ov002_022cd300.side;
 data_ov002_022cd318.mask |= 1<<data_ov002_022cf16c[player & 1].card[slot].flag;
 func_ov002_021dea48(player,slot,0,0);
 } else func_ov002_021de5d4(data_ov002_022cd300.side,slot,0);
 }
 if(data_ov002_022ce288.done==0) {
 for(i=0;i<2;i++) {
 player=data_ov002_022d016c.side ^ i;
 if((data_ov002_022cd300.mask>>player)&1) func_ov002_021e286c(player);
 }
 data_ov002_022cd318.phase++;
 }
 return 0;
 }
 return 1;
}


