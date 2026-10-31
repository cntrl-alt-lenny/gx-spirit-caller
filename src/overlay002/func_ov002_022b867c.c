typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
typedef union { Card b; unsigned short raw; } CardValue;
typedef struct { int x,y,z; } Vec;
typedef struct { char pad[0xa4]; int count,start; char tail[0x20]; } Player;
typedef struct { char pad[0x2a]; short count; } Entry;
extern struct { char pad[0xc2]; short x,y,z; } data_ov002_022ccbdc;
extern short data_ov002_022ccc5c[][3];
extern int data_ov002_022cd73c[];
extern Player data_ov002_022d17f0[];
extern char data_ov002_022d1910[];
extern char data_ov002_022d1410[];
/* Copy32's assembly definition has no C parameters; this call passes r0-r2. */
extern void Copy32(const void *src, void *dst, unsigned size);
int func_ov002_022b867c(char *self, int side, int slot, int index, Vec *out)
{
 int v[3];
 CardValue c;
 if (slot < 0 || slot >= 16) {
  v[0]=data_ov002_022ccbdc.x;
  v[1]=data_ov002_022ccbdc.y;
  v[2]=data_ov002_022ccbdc.z;
  Copy32(&v,out,12);
  return 1;
 }
 v[0]=data_ov002_022ccc5c[slot][0];
 v[1]=data_ov002_022ccc5c[slot][1];
 v[2]=data_ov002_022ccc5c[slot][2];
 if (slot==11) {
  Player *p=&data_ov002_022d17f0[side];
  int count=p->count;
  c.raw=*(unsigned short *)(data_ov002_022d1910+0x90);
  if (count>=8) count=8;
  index-=p->start;
  if (count>0) v[0]+=(index*2-(count-1))*30;
  if (c.b.slot==11 && side==c.b.side) {
   c.b.index-=p->start;
   if (*(int *)(self+0xd00+(c.b.index%3)*4)) {
    if (index<c.b.index) v[0]-=8;
    else if (index>c.b.index) v[0]+=8;
   }
  }
 } else if ((unsigned)(slot-12)<=3) {
  Entry *p;
  char *base=data_ov002_022d1410;
  int n;
  if (slot<12) p=0;
  else p=(Entry *)(base+0x280+side*0xb0+(slot-12)*0x2c);
  n=p->count;
  if (n>40) n=40;
  v[1]+=n*20/40;
 }
 if (side==(data_ov002_022cd73c[1]^1)) {
  v[0]=-v[0];
  v[2]=-v[2];
 }
 Copy32(&v,out,12);
 return 1;
}


