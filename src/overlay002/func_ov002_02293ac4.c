typedef unsigned short u16;
typedef struct { u16 id; u16 side:1; } Node;
struct Entry { unsigned id:13; unsigned rest:19; u16 h34, h36; char pad[12]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_02259f74(int x);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021c8470(int a, int b);
extern void func_ov002_021c4c9c(int a, int b, int *out);
int func_ov002_02293ac4(Node *self) {
 int out[11];
 int limit;
 int i;
 if (func_ov002_02259f74(self->side)==0) return 0;
 if (func_ov002_021bbf50(1-self->side)>0) {
  limit=0;
  for(i=0;i<5;i++) {
   if (data_ov002_022cf16c[self->side & 1].cards[i].id && data_ov002_022cf16c[self->side & 1].cards[i].h36==0) {
    limit=limit>func_ov002_021c8470(self->side,i)?limit:func_ov002_021c8470(self->side,i);
   }
  }
  for(i=0;i<5;i++) {
   if (data_ov002_022cf16c[(1-self->side) & 1].cards[i].id && data_ov002_022cf16c[(1-self->side) & 1].cards[i].h36==0) {
    func_ov002_021c4c9c(1-self->side,i,out);
    if(out[5]>=limit && out[6]<limit) return 1;
   }
  }
 }
 return 0;
}
