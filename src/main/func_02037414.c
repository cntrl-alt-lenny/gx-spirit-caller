typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct S0203624c;
typedef struct { char pad[0x68]; u16 flags; signed char state; char tail[0xd]; } ent_02037328_t;
typedef struct { char a[4]; short current; char b[6]; u16 status; char c[4]; u16 flags; } Manager;
extern Manager data_0219b2e0;
extern u8 *data_0219b344[];
extern u8 data_0219b760[];
extern unsigned int func_02034a84(unsigned int x);
extern void func_0203624c(struct S0203624c *p, int v);
extern void func_0203671c(u8 *, int, int);
extern void func_02036c68(void);
extern int func_0203724c(void);
extern u8 *func_02036d7c(int idArg, int slot, int value, int flagsArg);
extern int func_02037328(ent_02037328_t *self);
#define H(p,o) (*(u16 *)((p)+(o)))
#define W(p,o) (*(int *)((p)+(o)))
#define B(p,o) (*(signed char *)((p)+(o)))
u8 *func_02037414(int id, int flags, int value, int fade, int options) {
 int original;
 int i;
 int mask;
 int last;
 int slot;
 int count;
 int special;
 int key;
 int retried;
 u8 *p;
 data_0219b2e0.status=0;
 if (!(data_0219b2e0.flags & 0x4000)) return 0;
 if (options & 0x20) flags |= 0x600;
 original=id;
 if (id<0) id=-id;
 id=func_02034a84(id);
 if (fade<0) fade=30;
 if (value<0) {
  value=30;
  if (data_0219b2e0.current<0) value=0;
 }
 func_0203724c();
 key=id & ~0x1000000;
 retried=0;
 do {
  special=-1;
  count=0;
  last=special;
  slot=special;
  mask=count;
  for (i=0;i<4;i++) {
   u8 *entry=data_0219b344[i];
   if (!entry) slot=i;
   else {
    if (W(entry,0x34)==key && !(H(entry,0x68)&0x3403) && original>=0) {
     data_0219b2e0.status=0x80;
     return entry;
    }
    if (H(entry,0x68)&0x2000) special=i;
    else if (!(H(entry,0x68)&0x1003)) {
     mask |= 1<<i;
     last=i;
     count++;
    }
   }
  }
  if (!(options&0x20) && special>=0) slot=special;
  if (!retried && mask && !(flags&0x800) && !(options&0x80)) {
   i=0;
   while(mask&15) {
    if(mask&1) {
     func_0203624c((struct S0203624c *)data_0219b344[i],fade);
     if (!data_0219b344[i]) mask|=0x8000;
    }
    i++;
    mask >>= 1;
   }
   if (mask) { retried=1; continue; }
  }
  break;
 } while(1);
 if(count>=2) last=data_0219b2e0.current;
 if ((options&0x40) && slot>=0) goto create_slot;
 if(slot>=0 && last<0) goto load_slot;
select_slot:
 if(data_0219b2e0.current<0) slot=0;
 else {
  if(flags&0x2000) {
   if(slot>=0) goto load_slot;
   flags &= ~0x2000;
  }
  if(slot<0) return 0;
 }
create_slot: if(!(options&1)) return 0;
 p=data_0219b760+slot*0x78;
 func_0203671c(p,key,key);
 H(p,0x68)=0x2000;
 B(p,0x6d)=(signed char)slot;
 H(p,0x1c)=value;
 data_0219b2e0.current=slot;
 W(p,0x3c)=flags;
 p[0x6c]=slot;
 B(p,0x6a)=(signed char)slot;
 data_0219b344[slot]=p;
 func_02036c68();
 data_0219b2e0.status=2;
 return p;
load_slot:
 p=func_02036d7c(key,slot|0x8000,value,flags);
 if(!p) {
  if(!(flags&0x800)) {
   if(func_02037328(0)) {
    flags &= ~0x2000;
    goto select_slot;
   }
  }
  return 0;
 }
 data_0219b2e0.current=slot;
 data_0219b344[slot]=p;
 data_0219b2e0.status=1;
 return p;
}




