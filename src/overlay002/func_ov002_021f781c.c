typedef struct {
 unsigned short id;
 unsigned short side:1;
 unsigned short index:5;
 unsigned short rest:10;
 unsigned short pad6:6;
 unsigned short value:9;
 unsigned short top:1;
 unsigned short pad;
 unsigned short amount;
 unsigned short padA;
 unsigned short choice;
} Self;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { char pad[0xcec]; int side; int pad0[2]; unsigned int phase; char pad1[0x48]; int choice; } Command;
extern State data_ov002_022ce288;
extern Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[],data_ov002_022cf178[],data_ov002_022cf17c[];
extern int func_ov002_021fdc08(Self *);
extern void func_ov002_021ae400(int,int);
extern int func_ov002_022577dc(void *);
extern int func_ov002_022536e8(void *,int,int);
extern int func_ov002_021bc000(int,int (*)(int));
extern int func_0202f578(void *);
extern int func_ov002_021bbf50(int);
extern int func_ov002_02257ab8(int,int);
extern int func_ov002_021f4260(int,int);
extern void func_ov002_021ae514(int,int,int,int,int,int);
extern int func_ov002_0226b0d0(int,int,int);
extern void func_ov002_021df62c(int,int,int);
extern void func_ov002_021df780(int,int);
#define COUNT(sym,side) (*(int *)((sym)+((side)&1)*0x868))
int func_ov002_021f781c(Self *self) {
 int flags;
 int text;
 switch (data_ov002_022ce288.state) {
 case 0:
  if (func_ov002_021fdc08(self)) {
   func_ov002_021ae400(self->side,0x107);
   return -1;
  }
  flags=4;
  switch (self->id) {
  case 0x1388:
   if (func_ov002_022577dc(self)) {
    if (COUNT(data_ov002_022cf16c,self->side)>1000) flags|=1;
   }
   if (COUNT(data_ov002_022cf16c,self->side)>1) flags|=2;
   break;
  case 0x1532:
   if (COUNT(data_ov002_022cf178,1-self->side)) flags|=1;
   if (COUNT(data_ov002_022cf17c,1-self->side)) flags|=2;
   break;
  case 0x161e:
   if (func_ov002_022577dc(self)) flags|=1;
   if (COUNT(data_ov002_022cf17c,1-self->side)) flags|=2;
   break;
  case 0x1656:
   if (func_ov002_022577dc(self)) flags|=1;
   if (COUNT(data_ov002_022cf17c,1-self->side)) flags|=2;
   break;
  case 0x1685:
   if (func_ov002_022577dc(self)) flags|=1;
   if (COUNT(data_ov002_022cf17c,1-self->side)) flags|=2;
   break;
  case 0x1686:
   if (COUNT(data_ov002_022cf17c,self->side)) flags|=1;
   if (func_ov002_022536e8(self->side,self->id,0)) flags|=2;
   break;
  case 0x1a80:
   if (func_ov002_021bc000(self->side,(int (*)(int))func_0202f578)>1) {
    if (func_ov002_022577dc(self)) flags|=1;
   }
   if (COUNT(data_ov002_022cf17c,self->side)) flags|=2;
   break;
  }
  if (data_ov002_022cd744[self->side]==1) {
   data_ov002_022d016c.choice=2;
   switch (self->id) {
   case 0x1686:
    if (func_ov002_022536e8(self->side,self->id,1)) data_ov002_022d016c.choice=0;
    else if (flags&2) data_ov002_022d016c.choice=1;
    break;
   case 0x1532:
    if (flags&1) data_ov002_022d016c.choice=0;
    else if (flags&2) data_ov002_022d016c.choice=1;
    break;
   case 0x1388:
    if ((flags&2) && data_ov002_022d016c.side==self->side && data_ov002_022d016c.phase<=3 && func_ov002_021bbf50(1-self->side)==0) data_ov002_022d016c.choice=1;
    else if ((flags&1) && func_ov002_02257ab8((int)self,1-self->side)) data_ov002_022d016c.choice=0;
    break;
   case 0x161e: case 0x1685:
    if ((flags&1) && func_ov002_02257ab8((int)self,1-self->side)) data_ov002_022d016c.choice=0;
    else if (flags&2) data_ov002_022d016c.choice=1;
    break;
   case 0x1656:
    if (func_ov002_02257ab8((int)self,1-self->side)) data_ov002_022d016c.choice=0;
    break;
   case 0x1a80:
    if ((flags&2) && func_ov002_022536e8(self->side,self->id,0)) data_ov002_022d016c.choice=1;
    if ((flags&1) && func_ov002_02257ab8((int)self,1-self->side)) data_ov002_022d016c.choice=0;
    break;
   }
  } else {
   text=func_ov002_021f4260(self->id,0);
   func_ov002_021ae514(0x103,text,func_ov002_021f4260(self->id,1),0x1ac,0,flags);
  }
  data_ov002_022ce288.state++;
  return 0;
 case 1:
  self->choice=data_ov002_022d016c.choice+1;
  func_ov002_0226b0d0(1-self->side,self->id,data_ov002_022d016c.choice);
  data_ov002_022ce288.state++;
  return 0;
 case 2:
  if (self->choice==3) return -1;
  func_ov002_021df62c(self->side,self->index,self->value);
  if (self->id==0x1388) {
   if (self->choice==1) func_ov002_021df780(self->side,1000);
   if (self->choice==2) {
    self->amount=COUNT(data_ov002_022cf16c,self->side)-1;
    func_ov002_021df780(self->side,COUNT(data_ov002_022cf16c,self->side)-1);
   }
  }
  return 1;
 }
 return 0;
}

