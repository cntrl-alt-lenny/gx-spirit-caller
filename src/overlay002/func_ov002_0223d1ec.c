typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 side:1; u16 rest:1; };
struct Card { u32 id:13; u32 flag:1; u32 pad:8; u32 number:8; u32 rest:2; };
struct State { char p0[0x494]; u32 start; u16 ring[128]; char p1[0x10]; int state; int result; char p2[0xec]; int id; int number; u32 total; int sum; u32 count; int flag; int kinds[5]; };
struct Player { char pad[0x3a0]; struct Card cards[100]; char tail[0x338]; };
struct Count { u32 value; char pad[0x864]; };
struct Head { u16 value; char pad[18]; };
struct Heads { struct Head heads[100]; char pad[0x98]; };
struct Link { u16 id; u16 kind:4; u16 rest:12; u16 card; u16 next; };
struct Info { u16 id:13; u16 rest:3; u16 other; };
extern struct State data_ov002_022ce288;
extern u16 data_ov002_022ce720[];
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf184[], data_ov002_022cf17c[];
extern struct Heads data_ov002_022cf1a6[];
extern struct { char pad[0xd44]; u32 count; } data_ov002_022d016c;
extern struct Info data_ov002_022d0250[];
extern struct Link data_ov002_022d0650[];
extern int func_0202b8f0(int);
extern void func_ov002_021ae400(int,int);
extern void func_ov002_021af9d0(int,int,int,int);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021afffc(int);
extern int func_ov002_021b41a4(int,int,int);
extern int func_ov002_021ba310(int,int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021bc6c4(int);
extern void func_ov002_021d479c(u16,u16,u16,u16);
extern int func_ov002_021d59cc(int,int,int,int,u16);
extern void func_ov002_021e16a4(int,int,int,int);
extern void func_ov002_021e1870(int,int,int);
extern int func_ov002_021e286c(int);
/* Original calls omit the unused argument. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_021ff3bc(struct Self *,int);
extern int func_ov002_0223b468(int);
extern void func_ov002_0223b584(void);
extern int func_ov002_0223b5cc(int,int);
/* Original passes the player value as the opaque callback context. */
extern int func_ov002_022536e8(void *,int,int);
extern void func_ov002_0226b054(int);
extern int func_ov002_0226b0d0(int,int,int);
extern int func_ov002_0227adb8(int,int,int,int);
extern void func_ov002_0229cf10(char *,const char *,int);
int func_ov002_0223d1ec(struct Self *self,int arg1) {
 char text[256];
 int player=self->owner ^ self->side;
 if (self->mode==0) {
 switch (data_ov002_022ce288.state) {
 case 0x80:
 if (!data_ov002_022cf184[self->owner & 1].value) return 0;
 if (!data_ov002_022cf17c[self->owner & 1].value) return 0;
 if (func_ov002_022536e8((void *)player,self->id,0)==0) {
 func_ov002_021ae400(player,0x122); return 0x6e;
 }
 func_ov002_021ae400(self->owner,0x5b); return 0x7f;
 case 0x7f: func_ov002_021af9d0(player,6,self->id,0); return 0x7e;
 case 0x7e: {
 struct Card *p;
 data_ov002_022ce288.id=((struct Card *)func_ov002_021afb74())->id;
 p=(struct Card *)func_ov002_021afb74();
 data_ov002_022ce288.number=((struct Card *)func_ov002_021afb74())->number*2+p->flag;
 data_ov002_022ce288.total=func_ov002_0223b468(data_ov002_022ce288.id);
 data_ov002_022ce288.flag=1;
 data_ov002_022ce288.count=0;
 func_ov002_0223b584();
 func_ov002_0226b0d0(1-player,self->id,data_ov002_022ce288.id);
 return 0x7d;
 }
 case 0x7d:
 if (data_ov002_022ce288.id==0x1a4e) func_ov002_021ae400(player,0x5c);
 else {func_ov002_0229cf10(text,(const char *)0xc,data_ov002_022ce288.total);func_ov002_021ae400(player,(int)text);}
 return 0x7c;
 case 0x7c: {
 u32 left;
 int id=data_ov002_022ce288.id;
 if (id==0x1a4e && data_ov002_022ce288.count>=2) {func_ov002_021af9d0(player,0x48,self->id,id);return 0x7b;}
 if (id==0x157e) {func_ov002_021af9d0(player,0xb,self->id,id);return 0x7b;}
 left=data_ov002_022ce288.total-data_ov002_022ce288.count;
 if (left==func_ov002_022536e8((void *)player,self->id,id)) {
 if (left>=0x20) left=0x20;
 func_ov002_021af9d0(player,left+6,self->id,data_ov002_022ce288.id); return 0x7b;
 } else func_ov002_021af9d0(player,6,self->id,data_ov002_022ce288.id);
 return 0x7b;
 }
 case 0x7b: {
 u32 i=0,n=data_ov002_022d016c.count;
 for (;i<n;i++) {
 struct Card *p;
 func_ov002_021afffc(i+1);
 func_ov002_0223b5cc(((struct Card *)func_ov002_021afb74())->id,1);
 p=(struct Card *)func_ov002_021afb74();
 data_ov002_022ce288.ring[(data_ov002_022ce288.start+data_ov002_022ce288.count)&0x7f]=((struct Card *)func_ov002_021afb74())->number*2+p->flag;
 data_ov002_022ce288.count++;
 n=data_ov002_022d016c.count;
 }
 if (data_ov002_022ce288.count<data_ov002_022ce288.total) return 0x7c;
 if (data_ov002_022ce288.id==0x1a4e) {
 if (data_ov002_022ce288.count==2 && data_ov002_022ce288.count-n<2) {
 data_ov002_022ce288.kinds[1]=7;
 if (func_ov002_022536e8((void *)player,self->id,data_ov002_022ce288.id)) return 0x7c;
 }
 data_ov002_022ce288.total=data_ov002_022ce288.count;
 }
 return 0x7a;
 }
 case 0x7a:
 data_ov002_022ce288.total=data_ov002_022ce288.count;
 data_ov002_022ce288.count=0;
 func_ov002_021e2b3c();
 case 0x79:
 if (data_ov002_022ce288.count<data_ov002_022ce288.total) {
 int card=data_ov002_022ce720[(data_ov002_022ce288.start+data_ov002_022ce288.count)&0x7f];
 func_ov002_021e1870(player,card,0);
 func_ov002_021d59cc(self->owner,self->slot,self->id,3,card);
 data_ov002_022ce288.count++;
 return 0x79;
 }
 func_ov002_021e2c5c();
 func_ov002_021d59cc(self->owner,self->slot,self->id,0x41,(u16)data_ov002_022ce288.id);
 return 0x6d;
 case 0x6e: func_ov002_0226b054(1-player);return 0x6d;
 case 0x6d: func_ov002_021e286c(player);return 0;
 }
 } else {
 switch (data_ov002_022ce288.state) {
 case 0x80: {
 int idx;
 struct Card *card;
 u32 next;
 data_ov002_022ce288.id=func_ov002_021b41a4(self->owner,self->slot,self->id);
 idx=func_ov002_021ba310(player,data_ov002_022ce288.id);
 if (idx<0) return 0;
 card=&data_ov002_022cf16c[player&1].cards[idx];
 data_ov002_022ce288.number=card->number*2+card->flag;
 data_ov002_022ce288.total=0;
 data_ov002_022ce288.sum=0;
 if (!func_ov002_021ff3bc(self,arg1) || func_ov002_021bb068(0x197a)) {
 func_ov002_021e16a4(self->owner,data_ov002_022ce288.id,0,0);return 0;
 }
 next=data_ov002_022cf1a6[self->owner&1].heads[self->slot].value;
 while (next) {
 struct Link *p=&data_ov002_022d0650[next];
 int number;
 next=p->next;
 if (p->kind==3 && p->id==self->id) {
 number=p->card;
 if (data_ov002_022ce288.id==0x18fb) data_ov002_022ce288.sum+=func_0202b8f0(data_ov002_022d0250[number].id);
 data_ov002_022ce288.ring[(data_ov002_022ce288.start+data_ov002_022ce288.total)&0x7f]=number;
 func_ov002_021d479c((u16)((player?0x8000:0)|0x4c),0x10,(u16)data_ov002_022ce288.total,(u16)number);
 data_ov002_022ce288.total++;
 }
 }
 func_ov002_021d479c((u16)((player?0x8000:0)|0x4d),(u16)data_ov002_022ce288.id,(u16)data_ov002_022ce288.number,(u16)data_ov002_022ce288.total);
 data_ov002_022ce288.result=func_ov002_021bc6c4(player);
 func_ov002_0227adb8(player,(int)card,1,(self->id<<16)|1);
 return 0x7f;
 }
 case 0x7f:
 func_ov002_021d59cc(player,data_ov002_022ce288.result,(u16)((unsigned char)self->owner|((unsigned char)self->slot<<8)),7,0);
 return 0;
 }
 }
 return 0;
}

