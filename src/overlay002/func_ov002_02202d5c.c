typedef unsigned short u16;
typedef unsigned char u8;
struct node { u16 id; u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 flip:1; u16 rest:1; u16 pad4; u16 count:8; u16 rest6:8; u16 arr8[5]; u16 f18; };
typedef struct { char _pad[6]; u16 field6:8; u16 pad6h:8; } S021b8ecc;
typedef struct { u16 id; u16 side:1; u16 rest:15; } Card;
extern int func_ov002_021b8ecc(S021b8ecc *p);
extern int func_0202e234(int x);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_022018cc(void *arg0, int player, int idx);
extern int data_ov002_022cd3f4[3];
int func_ov002_02202d5c(struct node *self, struct node *other) {
 int i; int pair; u8 kind;
 if (other && func_ov002_021b8ecc((S021b8ecc *)other) &&
     self->owner != (other->owner ^ other->flip) &&
     !func_0202e234(other->id) &&
     (u8)func_ov002_0223de94(other,0) == self->owner) {
  pair=func_ov002_0223de94(other,0);
  kind=(u16)pair >> 8;
  if (kind <= 4) {
  for (i=0; i<5; i++) {
   if (func_ov002_021c1ef0((Card *)self,self->owner,i)) {
    if (func_ov002_022018cc(other,self->owner,i)) return 2;
   }
  }
 }
 }
 if (self->category == 0x12 && data_ov002_022cd3f4[2] == 0 &&
     data_ov002_022cd3f4[0] != self->owner &&
     data_ov002_022cd3f4[1] == self->owner) return 1;
 return 0;
}

