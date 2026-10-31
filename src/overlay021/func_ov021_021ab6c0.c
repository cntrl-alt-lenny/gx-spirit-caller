typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct {
 Obj *handle; char pad04[0x38]; int state, timer, column, row, count;
 char pad50[0x24]; int tiles[10]; int clear[10]; char padc4[0xc0];
 int selected[2]; int nselected, pairs, equal;
} State;
extern int func_02021660(Obj *, int, int);
extern void func_020216b0(void *, int, int);
/* The forwarding thunk returns the value read by this caller. */
extern int func_020216bc(void *, int);
extern int func_02037208(int, int, int, int);
extern int func_ov021_021ab150(int *);
extern int func_ov021_021abcac(void *);
extern int func_ov021_021abd78(void *);
int func_ov021_021ab6c0(State *o) {
 void *p;
 int i;
 int flags;
 if (o->timer == 15) {
  func_02037208(0x35, -1, 0, 1);
 } else if (o->timer == 30) {
  int index = o->column + o->row * 5;
  o->clear[index] = 1;
  o->selected[o->nselected] = index;
  o->nselected++;
  if (o->nselected < 2) {
   func_020216b0((void *)func_02021660(o->handle,3,2),11,31);
   o->state = 1;
  } else {
   o->equal = o->tiles[o->selected[0]] == o->tiles[o->selected[1]];
  }
 } else if (o->timer == 45 && o->equal != 0) {
  for (i=0; i<2; i++) {
   p = (void *)func_02021660(o->handle,3,i+3);
   func_020216b0(p,3,(o->selected[i] % 5 - 2) * 72);
   func_020216b0(p,4,o->selected[i] / 5 == 0 ? 56 : -56);
   func_020216b0(p,5,2);
   func_020216b0(p,0,1);
  }
  o->count++;
  o->pairs++;
  func_02037208(0x4a,-1,0,1);
  func_ov021_021abd78(o);
 } else if (o->timer == 60 && o->equal == 0) {
  for (i=0; i<2; i++) {
   p = (void *)func_02021660(o->handle,3,o->selected[i]+5);
   func_020216b0(p,0,(func_020216bc(p,0) & ~2) | 0x80);
  }
 } else if (o->timer == 90) {
  if (o->pairs >= 5) {
   for (i=0; i<10; i++) {
    p = (void *)func_02021660(o->handle,3,i+5);
    flags = func_020216bc(p,0) | 8;
    func_020216b0(p,0,flags);
   }
  } else {
   if (o->tiles[o->selected[0]] != o->tiles[o->selected[1]]) {
    o->clear[o->selected[0]] = 0;
    o->clear[o->selected[1]] = 0;
   }
   func_020216b0((void *)func_02021660(o->handle,3,2),11,31);
   o->nselected = 0;
   o->state = 1;
  }
 } else if (o->timer == 165) {
  func_ov021_021ab150((int *)o);
  o->state = 1;
 }
 func_ov021_021abcac(o);
 return 1;
}

