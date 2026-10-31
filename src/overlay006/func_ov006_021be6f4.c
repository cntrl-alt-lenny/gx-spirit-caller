struct Entry { int a,b,c,d,e,f,g,h; unsigned unused:1; unsigned active:1; unsigned rest:30; };
struct Obj { char pad[0x50]; int index; char pad2[0x4c]; struct Entry entries[1]; };
struct Table { short v[5][4]; };
struct Global { int a,b,c,d,e; char pad[0x20]; short v[5][4]; };
extern struct Global data_ov000_021b1d4c;
extern struct Table data_ov006_021cb634;
extern struct Table data_ov006_021cb65c;
/* Original caller supplies this global pointer; the C callee ignores it. */
extern int func_ov005_021aa4b0(struct Global *g);
int func_ov006_021be6f4(struct Obj *obj) {
 struct Entry *entry = &obj->entries[obj->index];
 if (entry->active) {
  struct Global *g = &data_ov000_021b1d4c;
  struct Table a = data_ov006_021cb634;
  struct Table b = data_ov006_021cb65c;
  int i;
  func_ov005_021aa4b0(&data_ov000_021b1d4c);
  data_ov000_021b1d4c.a = 0;
  if (obj->index == 4) {
   for (i=0;i<5;i++) {
    g->v[i][0]=b.v[i][0]; g->v[i][1]=b.v[i][1];
    g->v[i][2]=b.v[i][2]; g->v[i][3]=b.v[i][3];
   }
   g->b=entry->c; g->c=entry->e-3; g->d=3; g->e=entry->b;
  } else {
   for (i=0;i<5;i++) {
    g->v[i][0]=a.v[i][0]; g->v[i][1]=a.v[i][1];
    g->v[i][2]=a.v[i][2]; g->v[i][3]=a.v[i][3];
   }
   g->b=entry->c; g->c=entry->e-4; g->d=4; g->e=entry->b;
  }
 }
 return 1;
}


