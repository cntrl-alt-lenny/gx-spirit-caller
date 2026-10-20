typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int field_0; int field_4; } A1_t;
struct s_020a5f10 { int f0; int f4; };
extern unsigned int func_0209065c(unsigned int value);
extern void func_020a5e90(void *a0, A1_t *a1);
extern void func_020a5e68(int a0, int *a1);
extern int func_020a5f10(struct s_020a5f10 *self);
extern void func_020a5f44(int *out);
extern int func_020a5f8c(void);
extern void func_020a5e04(int arg);
extern void func_020928cc(void *, int);
extern void func_02092898(void);
extern void func_02093fb8(int, const void *, void *, int);
/* Assembly thunks consume the argument registers shown at their call sites. */
extern void Copy32(const void *, void *, int);
extern void WaitByLoop(int);
extern int data_021a993c;
extern u16 data_021a9938[];
typedef struct { u8 pad[0x80]; u8 payload[0x2c]; u32 code; u16 fB0; u8 padB2[3]; u8 bytes[3]; u8 padB8[6]; u16 id; } RomInfo;
typedef struct { u16 id; u8 bytes[3]; u8 pad; u16 f6; u32 code; } Shared;
extern RomInfo data_021a9960;
extern u8 data_021a9964[];
void func_020a622c(void) {
 A1_t irq;
 struct s_020a5f10 saved;
 u32 old;
 int bit;
 u32 ime;
 int i;

 if (data_021a993c != 0) return;
 data_021a993c = 1;
 if ((*(volatile u16 *)0x04000300 & 1) == 0) return;
 old = func_0209065c(0x40000);
 ime = *(volatile u16 *)0x04000208;
 *(volatile u16 *)0x04000208 = 1;
 func_020a5e90((void *)data_021a9938[1], &irq);
 bit = (*(volatile u16 *)0x04000204 & 0x8000) >> 15;
 func_020a5f44((int *)&saved);
 *(volatile u16 *)0x04000204 &= ~0x8000;
 func_020928cc((void *)((int)&data_021a9960 + 0x80), 0x40);
 func_02093fb8(1, (void *)0x08000080, (u8 *)&data_021a9960 + 0x80, 0x40);
 *(volatile u16 *)0x04000204 = (*(volatile u16 *)0x04000204 & ~0x8000) | (bit << 15);
 func_020a5f10(&saved);
 func_020a5e68(data_021a9938[1], (int *)&irq);
 if (*(u8 *)0x027fff9b != 0 || *(u8 *)0x027fff9a == 0) {
  RomInfo *rom = &data_021a9960;
  Shared *shared = (Shared *)0x027ffc30;
  shared->id = rom->id;
  for (i=0; i<3; i++) shared->bytes[i] = ((u8 *)((u32)rom + i))[0xb5];
  shared->f6 = rom->fB0;
  shared->code = rom->code;
  *(u8 *)0x027fff9b = func_020a5f8c() != 0;
  *(u8 *)0x027fff9a = 1;
 }
 Copy32((const void *)0xffff0020, data_021a9964, 0x9c);
 func_02092898();
 func_020a5e04((((u32)&data_021a9960 - 0x02000000) >> 5 << 6) | 1);
 while(data_021a9938[0] != 1) WaitByLoop(1);
 *(volatile u16 *)0x04000208;
 *(volatile u16 *)0x04000208 = ime;
 func_0209065c(old);
}










