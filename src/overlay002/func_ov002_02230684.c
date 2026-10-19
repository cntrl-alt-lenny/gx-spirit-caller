typedef unsigned char u8;
typedef unsigned short u16;
struct Ov002Self {
 u16 a;
 u16 side:1; u16 slot:5; u16 pad2:10;
 u16 pad4:6; u16 key:9; u16 pad5:1;
 u16 pad6:8; u16 count:8;
};
struct Row {
 unsigned int pad0:13; unsigned int low:1; unsigned int pad1:8;
 unsigned int high:8; unsigned int pad2:2;
 char rest[16];
};
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(void *ptr, int flag, void *outPtr);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
int func_ov002_02230684(struct Ov002Self *self) {
 unsigned int local;
 int i;
 struct Row *row = (struct Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30);
 if (self->key != row[self->slot].high * 2 + row[self->slot].low) return 0;
 for (i = 0; i < self->count; i++) {
  if (func_ov002_0223df38(self, i, &local) != 0) {
   int a = (int)local & 0xff;
   int b = ((unsigned short)local >> 8) & 0xff;
   if (func_ov002_0225764c((int)self, a, b) != 0) {
    func_ov002_021d5a08(self, a, b, (u16)((u8)self->side | ((u8)self->slot << 8)), 0x16, 0);
   }
  }
 }
 return 0;
}
