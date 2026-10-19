typedef struct {
 unsigned short f0;
 unsigned short side:1, pad1:13, flip:1, pad2:1;
 unsigned short f4,f6; volatile unsigned short result;
} Self;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { unsigned int pad0:13, bit:1, pad1:8, id:8, pad2:2; } Entry;
typedef struct { int value; char pad[8]; unsigned int count; char pad2[0x110]; Entry entries[466]; } Player;
typedef struct { char pad[0xd44]; int result; } Result;
extern State data_ov002_022ce288;
extern Player data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern Result data_ov002_022d016c;
/* The assembly implementation consumes r0-r3 and a fifth stack argument. */
extern void func_ov002_021ae70c(int a,int b,int c,int d,int e);
extern void func_ov002_021df780(int arg0,int arg1);
extern int func_ov002_0226eb5c(int a,int b,int c,int d);
int func_ov002_021fba08(Self *p) {
 int side = p->side ^ p->flip;
 unsigned int i;
 int level, mask, first, last, threshold;
 Player *player;
 Entry *entry;
 switch(data_ov002_022ce288.state) {
 case 0:
  threshold=1000;
  player=&data_ov002_022cf16c[side & 1];
  mask=0; first=0; last=0;
  for(level=1;level<=3;level++) {
   if(player->value <= threshold) break;
   i=0;
   if(i<player->count) {
   entry=player->entries;
   do {
    if(func_ov002_0226eb5c(side,entry->bit + entry->id * 2,1,level)) {
     mask |= 1 << level;
     if(first==0) first=level;
     last=level;
    }
    i++; entry++;
   } while(i<player->count);
   }
   threshold+=1000;
  }
  if(mask!=0) {
   if(last==first || data_ov002_022cd744[side]==1) data_ov002_022d016c.result=last;
   else func_ov002_021ae70c(0x12d,0x12e,first,last,(mask==10)+1);
   data_ov002_022ce288.state++;
   return 0;
  }
  break;
 case 1:
  p->result=data_ov002_022d016c.result;
  func_ov002_021df780(side,p->result*1000);
  break;
 }
 return 1;
}


