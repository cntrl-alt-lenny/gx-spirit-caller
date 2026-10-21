typedef unsigned short u16;
typedef struct { u16 f_0; u16 f_2; } Self02210104;
struct Self { u16 f0; u16 side:1; u16 idx:5; u16 rest:10; u16 pad:6; u16 value:9; u16 pad2:1; };
struct Slot { unsigned int id:13; unsigned int low:1; unsigned int pad:8; unsigned int high:8; unsigned int rest:2; };
struct Global { char pad[0x484]; int count; char pad2[0x120]; int state; };
extern struct Global data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_ov002_021de910(int a, int b, int c);
extern int func_ov002_021de9d4(int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2bd4(void);
/* The original leaves the unused argument unset. */
extern void func_ov002_021e2c5c();
extern int func_ov002_02210104(Self02210104 *self, int unused1);
int func_ov002_0223a94c(struct Self *self, int unused1) {
 switch (data_ov002_022ce288.state) {
 case 0x80:
  func_ov002_02210104((Self02210104 *)self, unused1);
  return 0x7f;
 case 0x7f: {
  struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->idx * 0x14);
  if (self->value != slot->high * 2 + slot->low) return 0;
  if (data_ov002_022ce288.count == 0) return 0;
  func_ov002_021e2bd4();
  if (data_ov002_022ce288.count + 1 >= 4) {
   func_ov002_021de910((int)self, self->side, self->idx);
  } else {
   func_ov002_021de9d4((int)self, self->side, self->idx);
   func_ov002_021e286c(self->value & 1);
  }
  func_ov002_021e2c5c();
  return 0;
 }
 }
 return 0;
}

