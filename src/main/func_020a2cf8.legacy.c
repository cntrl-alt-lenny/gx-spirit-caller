typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
 u8 pad[0x358]; u8 field358; u8 pad359; u16 bits; u16 field35c; u8 entries[15][0x16]; u8 pad4a8[8]; u16 sent; u8 pad4b2; u8 kind; u8 version; u8 mode; u8 pad4b6[2]; u32 value;
} Source;
typedef struct {
 u32 unk; Source *source; u8 *cursor; u8 state; u8 pad; u8 field_e; u8 index; u8 count; u8 serial;
} State;
typedef struct {
 u32 value; u8 flags:2; u8 mode:6; u8 kind; u8 field6; u8 serial; u16 checksum; u8 index; u8 padb; u16 fieldc; u16 fielde; u8 pad10[0x58]; u8 tail[8];
} Packet;
extern State data_021a9850;
extern Packet data_021a9880;
extern int data_021a9848;
extern void (*data_021a984c)(u32);
extern u8 data_021a9890[];
extern u16 data_021a9888[];
extern void func_0209448c(int,int,int);
extern void func_020944a4(int,int,int);
extern u16 func_020a2c74(void *,int);
extern int func_020a078c(int,void *,unsigned int,int,unsigned short,unsigned char);
extern void func_020a2f9c(void);
void func_020a2cf8(int a, unsigned short b, unsigned char c) {
 int i; unsigned int count; u8 *dst; int offset; u32 changed; int mask;
 if(data_021a9850.field_e != data_021a9850.source->version) func_020a2f9c();
 data_021a9880.flags=2;
 data_021a9880.kind=data_021a9850.source->kind;
 data_021a9880.field6=data_021a9850.field_e;
 data_021a9880.value=data_021a9850.source->value;
 data_021a9880.mode=data_021a9850.source->mode;
 data_021a9880.serial=data_021a9850.serial++;
 data_021a9880.index=data_021a9850.source->field358;
 data_021a9880.fieldc=data_021a9850.source->bits;
 data_021a9880.fielde=data_021a9850.source->field35c;
 if(data_021a9848==0 && data_021a984c) data_021a984c(data_021a9850.source->value);
 for(i=0;i<8;i++) data_021a9880.tail[i]=data_021a9850.source->pad4a8[i];
 func_0209448c(0,(int)data_021a9890,0x58);
 count=0;
 dst=data_021a9890;
 changed=(u16)(data_021a9850.source->sent ^ data_021a9850.source->bits);
 for(i=0,offset=0;i<15;i++,offset+=0x16) {
  mask=2<<i;
  if(changed & mask) {
   func_020944a4((int)((u8 *)data_021a9850.source->entries+offset),(int)dst,0x16);
   dst+=0x16;
   count++;
   data_021a9850.source->sent |= mask;
   if(count==4) break;
  }
 }
 if(count<4) data_021a9890[count*0x16] &= ~0xf0;
 data_021a9880.checksum=0;
 data_021a9880.checksum=func_020a2c74(data_021a9888,0x68);
 if(data_021a9850.source->sent==data_021a9850.source->bits) data_021a9850.state=1;
 func_020a078c(0,&data_021a9880,0x70,a,b,c|3);
 if(data_021a9848==1 && data_021a984c) data_021a984c(data_021a9850.source->value);
}



