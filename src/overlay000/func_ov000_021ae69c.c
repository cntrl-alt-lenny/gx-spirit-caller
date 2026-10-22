typedef struct { unsigned low:12, value:4, middle:8, high:8; } Selection;
typedef union {
 unsigned raw;
 struct { unsigned low:9, mode:2, bit11:1, confirm:1, mid:8, index:2, high:9; } bits;
} Flags;
typedef struct { char pad[0x2a4]; Flags flags; Selection selection; } Initial;
typedef struct { unsigned int f_0; char _pad_4[4]; unsigned int f_8; } state_2bit_t;
typedef struct { char pad[0x154]; state_2bit_t sub; char pad2[0x10c]; Flags flags; Selection selection; } State;
typedef struct { short x,y,w,h; } Entry;
typedef struct { Entry header; Entry entries[4]; } Table;
extern Initial data_ov000_021c758c;
extern State data_ov000_021c75c4;
extern Table data_ov000_021b56b4[];
extern unsigned short data_02104bac[];
extern unsigned int func_0200617c(void);
extern unsigned int func_02006164(void);
extern void func_02006110(int *,int *);
extern void func_ov000_021ae4d8(void);
extern void func_ov000_021ae654(void);
extern unsigned int func_ov000_021ac760(void *p);
extern void func_ov000_021ac770(state_2bit_t *p);
extern int func_02037208(int,int,int,int);
void func_ov000_021ae69c(void) {
 State *s;
 int mode = data_ov000_021c758c.flags.bits.index;
 Entry *entries = data_ov000_021b56b4[mode].entries;
 int selection = data_ov000_021c758c.selection.value;
 int count = mode + 2;
 s = &data_ov000_021c75c4;
 int x,y,i;
 if (func_0200617c() || func_02006164()) {
  func_02006110(&x,&y);
  for(i=0;i<count;i++) {
   if(y >= entries[i].y && y < entries[i].y+entries[i].h && x >= entries[i].x && x < entries[i].x+entries[i].w) {
    selection=i+1;
    s->flags.raw |= 0x800;
    func_ov000_021ae4d8();
    if(func_0200617c() && s->selection.value == (unsigned char)selection) {
     s->flags.raw |= 0x1000;
    } else {
     s->selection.value=(unsigned char)selection;
    }
   }
  }
  if(func_ov000_021ac760(&s->sub)) {
   s->selection.value=0;
   s->selection.middle=255;
   s->selection.high=6;
   func_ov000_021ac770(&s->sub);
   func_02037208(0x43,-1,0,1);
  }
 } else {
  unsigned keys=data_02104bac[0x2a];
  if(keys & 0x40) {
   if(selection--==1) selection=count;
   s->flags.raw |= 0x800;
   func_ov000_021ae4d8();
   func_ov000_021ae654();
  } else if(keys & 0x80) {
   selection++;
   if(selection==count+1) selection=1;
   s->flags.raw |= 0x800;
   func_ov000_021ae4d8();
   func_ov000_021ae654();
  } else if(keys & 1) {
   s->flags.raw |= 0x1000;
  } else if(keys & 2) {
   if(s->flags.bits.index==0 || s->flags.bits.mode!=0) {
    func_02037208(0x43,-1,0,1);
    s->selection.high=6;
    s->selection.middle=255;
    if(s->flags.bits.mode!=0) selection=0; else selection=2;
   }
  }
  s->selection.value=(unsigned char)selection;
 }
 if(s->flags.bits.confirm) {
  func_02037208(0x3a,-1,0,1);
  s->selection.middle=255;
  s->selection.high++;
 }
}



