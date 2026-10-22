typedef struct { unsigned char field_0x0,field_0x1,field_0x2,field_0x3; } SrcObj020a5b44;
typedef struct { unsigned char field_0x0,field_0x1; unsigned short field_0x2; } DstObj020a5b44;
extern int func_020a5b44(SrcObj020a5b44 *,DstObj020a5b44 *,int);
extern void func_02094688(void *,void *,int);
extern int func_020a1bf8(int,int,int);
extern unsigned int func_020a09b8(unsigned int,unsigned int);
typedef struct { unsigned char low:4, high:4; unsigned char rest[21]; } Entry;
typedef struct {
 unsigned char pad0[0x1340]; Entry entries[15];
 unsigned short values[15]; unsigned int ids[15]; unsigned int callback; unsigned int states[15];
 unsigned char pad1524[2]; unsigned char slots[15]; unsigned char count; unsigned short mask;
 unsigned char pad1538[0x21c]; unsigned short status[15];
 unsigned char pad1772[0x5ce]; unsigned char *desc;
 unsigned int pad1d44; unsigned short f48,f4a,f4c,f4e,f50; unsigned char active;
} State;
extern State *data_021a98fc;
#define ROW(s) ((State *)((unsigned char *)data_021a98fc+(s)*0x5d4))
extern unsigned int data_021a9840;
#define U16(p,o) (*(unsigned short *)((p)+(o)))
#define U32(p,o) (*(unsigned int *)((p)+(o)))
#define PTR(p,o) (*(unsigned char **)((p)+(o)))
typedef struct { int id; unsigned char bytes[22]; unsigned short value; unsigned char extra; } Packet;
void func_020a11e4(unsigned char *a, unsigned int n) {
 unsigned char dst[20];
 Packet packet;
 unsigned int state,idx;
 unsigned char *p;
 unsigned char mode;
 unsigned int slot;
 if(n==0) return;
 if(n>15) return;
 p=(unsigned char *)func_020a5b44((SrcObj020a5b44 *)(a+10),(DstObj020a5b44 *)dst,n);
 mode=dst[0];
 idx=n-1;
 state=data_021a98fc->states[idx];
 switch(mode) {
 case 11: break;
 case 7:
  if(state==2) {
   if(p==0) return;
   int j;
   func_02094688(p,&packet,29);
   j=n-1;
   data_021a98fc->ids[j]=packet.id;
   data_021a98fc->values[j]=packet.value;
   func_02094688(packet.bytes,&data_021a98fc->entries[j],22);
   data_021a98fc->entries[j].high=(unsigned char)n;
   func_020a1bf8(n,10,(int)packet.bytes);
  }
  if(state==10) {
   unsigned char count=0;
   slot=p[28];
   if(slot>=16 || ROW(slot)->active==0 || data_021a98fc->ids[idx]!=U32(ROW(slot)->desc,20)) {
    data_021a98fc->status[idx]=4;
   } else {
    unsigned short bits=ROW(slot)->f4e;
    unsigned char i;
    for(i=0;i<16;i++) if((1<<i)&bits) count++;
    if(count>=ROW(slot)->desc[24]) {
     data_021a98fc->status[idx]=0;
     func_020a1bf8(n,11,0);
     return;
    }
   }
   switch(data_021a98fc->status[idx]) {
   case 3:
    if(data_021a98fc->mask&(1<<n)) return;
    data_021a98fc->count++;
    idx=n-1;
    data_021a98fc->mask|=1<<n;
    data_021a98fc->slots[idx]=slot;
    ROW(slot)->f4e|=1<<n;
    ROW(slot)->f50|=1<<n;
    data_021a98fc->status[idx]=0;
    func_020a1bf8(n,5,0);
    return;
   case 4:
    data_021a98fc->status[idx]=0;
    func_020a1bf8(n,4,0);
    return;
   }
  }
  return;
 case 8:
  if(state==5) { func_020a1bf8(n,14,0); return; }
  if(state==14) {
   if(data_021a98fc->status[idx]!=2) return;
   slot=data_021a98fc->slots[idx];
   ROW(slot)->f4c|=1<<n;
   ROW(slot)->f48=0;
   data_021a98fc->status[idx]=0;
   func_020a1bf8(n,6,0);
  }
  return;
 case 9: {
  unsigned char slot9;
  if(state!=6) return;
  slot9=data_021a98fc->slots[idx];
  if(slot9==255) return;
  ROW(slot9)->f4a=func_020a09b8(ROW(slot9)->f4a,U16(dst,2));
  data_021a9840|=1<<slot9;
  return;
 }
 case 10:
  if(state==6) {
   slot=data_021a98fc->slots[idx];
   if(slot==255) return;
   ROW(slot)->f4c&=~(1<<n);
   func_020a1bf8(n,7,0);
   return;
  }
  if(state==7) {
   if(data_021a98fc->status[idx]!=5) return;
   data_021a98fc->status[idx]=0;
   func_020a1bf8(n,8,0);
  }
 }
}






