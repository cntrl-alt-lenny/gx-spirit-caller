typedef struct { int key, prev, next, used, f10, f14, f18; } Entry;
typedef struct { int f0; int *info; Entry *entries; } State;
typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
typedef struct { int value, id; short link, depth, x, y; } Record;
typedef struct { Entry *first, *next; int reserved; } Frame;
typedef struct {
 State *state;
 char pad[0x58];
 unsigned short f0:3, side:1, f4:2, count:4, rest:6;
 unsigned short pad5e;
 Record *records;
 int f64, f68;
 int (*callback)(int, int *, int *);
} Obj;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern int func_ov005_021ab274(State *o, int idx, Entry **out);
extern int func_ov005_021ab2e0(int *o, int *p);
extern unsigned short func_ov005_021ab384(state_hw_t *p, int idx, unsigned int mask);
extern int func_ov005_021ab260(void *obj, int idx);
extern void func_ov005_021abc88(int *o, int idx);
void func_ov005_021ab6ac(Obj *o) {
 int depth = 0;
 Frame *stack;
 int *ids;
 Record *record;
 int x,y;
 record = o->records;
 stack = (Frame *)Task_PostLocked((void *)(o->count * 12),4,0);
 ids = (int *)Task_PostLocked((void *)(o->count * 4),4,0);
 ids[0] = func_ov005_021ab274(o->state,0,(Entry **)stack);
 while(ids[depth] != 0 || depth > 0) {
  if(func_ov005_021ab384((state_hw_t *)o->state,ids[depth],1)) {
   record->value = o->callback(ids[depth],&x,&y);
   record->id = ids[depth];
   record->x = x;
   record->y = y;
   record->depth = depth;
   record->link = -1;
   record++;
   if(func_ov005_021ab260(o->state,ids[depth]) && func_ov005_021ab384((state_hw_t *)o->state,ids[depth],2)) {
    depth++;
    ids[depth] = func_ov005_021ab274(o->state,ids[depth-1],(Entry **)(stack+depth));
    continue;
   }
  }
  {
   Frame *cursor = stack+depth;
   ids[depth] = func_ov005_021ab2e0((int *)o->state,(int *)cursor);
   if(ids[depth] == 0) {
    do {
     if(depth <= 0) break;
     cursor--;
     depth--;
     ids[depth] = func_ov005_021ab2e0((int *)o->state,(int *)cursor);
    } while(ids[depth] == 0);
   }
  }
 }
 record->id = 0;
 record->depth = 0;
 record->value = 0;
 func_ov005_021abc88((int *)o,o->side);
 Task_InvokeLocked(ids);
 Task_InvokeLocked(stack);
}
