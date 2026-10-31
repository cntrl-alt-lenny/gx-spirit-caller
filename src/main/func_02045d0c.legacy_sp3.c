typedef struct Obj { char pad[0x40]; int field_40; } Obj;
typedef struct Mgr Mgr;
typedef struct State {
 char p0[0x24]; int f24; char p28[5]; unsigned char f2d;
 char p2e[0x62]; void (*callback)(int,int,int,int,int,int); int userdata;
 char p98[0x2c9]; unsigned char count; char p362[2]; Mgr *mgr;
 unsigned char remaining; volatile unsigned char mode; unsigned char saved; char p36b[0xdd];
 int entries[32]; char p4c8[0x15c]; unsigned char tags[32]; unsigned int mask;
} State;
extern State *data_0219daec;
extern int data_0219daf4[];
extern char data_020ff908[];
extern void func_0204525c(int,int);
extern int func_02046694(int);
extern void func_020466f4(int);
extern int func_02049038(int,char *,char *);
extern int func_02049120(int);
extern int func_0204f778(int);
extern int func_0204f820(void);
extern int func_0204fa7c(int,int);
extern int func_0204fc9c(void *);
/* The original caller also passes the removed entry in r2. */
extern int func_0204fcc0(int,int,int);
extern void func_0205000c(void);
extern void func_02052398(int);
extern int func_02062498(Obj *);
extern void func_02065e40(void);
extern void func_020673dc(Mgr *);
void func_02045d0c(Obj *obj, int mode) {
 int index;
 int entry = 0;
 int code;
 int enabled;
 int action;
 int special = 0;
 unsigned char *rec;
 State *s;
 if (func_0204f778((int)obj)) return;
 switch(mode) {
 case 0: case 1: action = 0; break;
 case 2: case 3: action = 6; code = -7600; break;
 case 4: action = 9; code = -7601; break;
 }
 if (action == 0) {
  rec = (unsigned char *)func_02062498(obj);
  if (!rec) return;
  index = rec[1];
  enabled = 1;
  if (!(data_0219daec->mask & (1 << index))) enabled = 0;
  func_02052398(index);
  if ((data_0219daec->mode == 2 && mode == 0) || (data_0219daec->mode == 3 && index == 0)) special = 1;
  entry = func_02046694(index);
  data_0219daf4[rec[0]] = 0;
  data_0219daec->count--;
  data_0219daec->remaining--;
 }
 if (data_0219daec->f2d == 0 && data_0219daec->f24 == 6 && enabled == 0) {
  if (data_0219daec->mode != 2) return;
  if (action != 0) return;
  func_0204f820();
  func_0204fc9c((void *)entry);
  return;
 }
 if (func_0204fcc0(action, code, entry)) return;
 if (action != 0) { func_0204525c(action,code); return; }
 if (data_0219daec->f2d == 0 && (data_0219daec->mode == 2 || data_0219daec->mode == 3)) {
  int i = data_0219daec->count + 2;
  if (data_0219daec->entries[i] != 0) {
   data_0219daec->tags[data_0219daec->count + 1] = data_0219daec->tags[i];
   func_0204fa7c(data_0219daec->count + 1, data_0219daec->count + 3);
  }
 }
 if (data_0219daec->mode == 2) {
  if (data_0219daec->f2d == 0) func_0204f820();
  else if (data_0219daec->count == 0) func_02049038(1,data_020ff908,0);
 } else if (data_0219daec->count == 0) func_02049038(1,data_020ff908,0);
 if (data_0219daec->mode == 0 || data_0219daec->mode == 1) {
  data_0219daec->saved = data_0219daec->remaining;
  func_020673dc(data_0219daec->mgr);
 }
 s = data_0219daec;
 if (s->callback != 0 && enabled != 0) {
  enabled = mode == 0 ? 1 : 0;
  { int result = func_02049120(entry); int userdata = s->userdata; data_0219daec->callback(action,enabled,special,index,result,userdata); }
 }
 if (data_0219daec->f2d == 0 && data_0219daec->mode == 2) return;
 if (data_0219daec->count != 0) return;
 func_02065e40();
 func_0205000c();
 func_020466f4(3);
}




