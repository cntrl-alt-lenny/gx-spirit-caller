typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { u8 pad[0x3c]; u16 field3c; u8 tail[0x82]; } Record;
typedef struct { u8 mode; u8 value; u8 data[0x50]; } Options;
typedef struct {
 u8 pad0[0x2140];
 u8 record[0x2e];
 u16 flags;
 u16 resultFlags;
 u8 pad1[0x8e];
 u8 data[0x50];
 u8 mode;
 u8 value;
 u8 pad2[0xe];
 int state;
 u8 pad3[0x1c];
 u16 result;
} Context;
extern Context *data_021a088c;
extern int OS_DisableIrq(void);
/* The primitive returns the saved interrupt mask in r0. */
extern void OS_RestoreIrq(int mask);
extern void func_020945f4(void *dst, int value, unsigned int size);
extern void func_02094688(const void *src, void *dst, unsigned int size);
extern unsigned int func_0207b548(unsigned int flags);
extern void func_0207b038(int mode);
extern void func_0207ab68(void *event);
extern int func_020a06b0(int a, int b, int c, int d, unsigned short e);
int func_0207b9c0(Record *record, Options *options, unsigned int flags) {
 int mask = OS_DisableIrq();
 Context *ctx = data_021a088c;
 if (ctx == 0) { OS_RestoreIrq(mask); return 1; }
 switch (ctx->state) {
 case 3:
  if (record == 0) { OS_RestoreIrq(mask); return 1; }
  if (record->field3c != 0) { OS_RestoreIrq(mask); return 1; }
  if (options != 0) {
   if (options->mode >= 4 || options->value >= 4) { OS_RestoreIrq(mask); return 1; }
   data_021a088c->mode = options->mode;
   data_021a088c->value = options->value;
   if (data_021a088c->mode == 0) func_020945f4(data_021a088c->data, 0, 0x50);
   else func_02094688(options->data, data_021a088c->data, 0x50);
  } else func_020945f4(ctx->data, 0, 0x52);
  func_02094688(record, data_021a088c->record, 0xc0);
  data_021a088c->resultFlags = data_021a088c->flags | 3;
  func_0207b548(flags);
  break;
 case 8: OS_RestoreIrq(mask); return 2;
 case 9: OS_RestoreIrq(mask); return 0;
 default: OS_RestoreIrq(mask); return 1;
 }
 switch (func_020a06b0((int)func_0207ab68, 0xffff, 0x50, 0xffff, 0xffff)) {
 case 2: func_0207b038(8); data_021a088c->result = 5; break;
 case 8: OS_RestoreIrq(mask); return 4;
 case 3:
 default: func_0207b038(11); OS_RestoreIrq(mask); return 7;
 }
 OS_RestoreIrq(mask);
 return 3;
}

