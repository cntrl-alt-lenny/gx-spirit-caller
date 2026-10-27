typedef struct {
 unsigned int on:1, b1:1, b2:1, b3:1, b4:1, flag:1, b6:1, rest:25;
 signed int index:10; unsigned int middle:10, value:10, rest2:2;
} Entry;
typedef struct { char pad[4]; unsigned short count; char pad6[6]; unsigned short *times; } Group;
typedef struct { unsigned int count; Group **groups; } Data;
typedef struct { char pad[0xa4]; Data *data; Entry *entries; } Obj;
int func_0200f684(Obj *o, unsigned int mode, int val, int flag) {
 if (o != 0 && o->data != 0) {
  unsigned int i; int j; unsigned int count; Group *g; Entry *e; count = o->data->count;
  for (i = 0; i < count; i++) {
   g = o->data->groups[i];
   e = &o->entries[i];
   e->on = 1;
   if (flag >= 0) e->flag = flag;
   switch (mode) {
   case 0: val = 0;
   case 6: {

    e->index = 0;
    for (j = 0; j < g->count - 1; j++) {
     if (g->times[j+1] > val) break;
     e->index++;
    }
    e->middle = 0; e->value = val;
   }
   case 5: e->b1 = 0; e->b2 = 0; e->b3 = 0; e->b4 = 0; break;
   case 7: e->b6 = 0; break;
   case 1: e->b1 = 1; e->b2 = 0; e->b4 = 0; break;
   case 2: e->b2 = 1; e->b1 = 0; e->b3 = 0; break;
   case 3: e->b3 = 1; e->b2 = 0; break;
   case 4: e->b4 = 1; e->b1 = 0; break;
   }
  }
  return 1;
 }
 return 0;
}









