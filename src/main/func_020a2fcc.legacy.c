typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
 u8 pad[0x4b2]; u8 flags; u8 kind; u8 unused; u8 mode; u8 pad2[2]; u32 value;
} Source;
typedef struct {
 u32 unk; Source *source; u8 *cursor; u8 state; u8 pad; u8 field_e; u8 index; u8 count; u8 serial;
} State;
typedef struct {
 u32 value; u8 flags:2; u8 mode:6; u8 kind; u8 field6; u8 serial; u16 checksum; u8 index; u8 count; u8 size;
} Packet;
extern State data_021a9850;
extern Packet data_021a9880;
extern u8 data_021a988e[];
extern u16 data_021a9888[];
extern void func_0209448c(int,int,int);
extern void func_020944a4(int,int,int);
extern u16 func_020a2c74(void *,int);
extern int func_020a078c(int,void *,unsigned int,int,unsigned short,unsigned char);
void func_020a2fcc(int a, unsigned short b, unsigned char c) {
 u8 *end=(u8 *)data_021a9850.source+0x358;
 if(data_021a9850.cursor+0x62 <= end) {
  data_021a9880.size=0x62;
 } else {
  data_021a9880.size=end-data_021a9850.cursor;
  func_0209448c(0,(int)(data_021a988e+data_021a9880.size),0x62-data_021a9880.size);
 }
 func_020944a4((int)data_021a9850.cursor,(int)data_021a988e,data_021a9880.size);
 data_021a9880.index=data_021a9850.index;
 data_021a9880.count=data_021a9850.count;
 data_021a9880.flags=data_021a9850.source->flags;
 data_021a9880.kind=data_021a9850.source->kind;
 data_021a9880.field6=data_021a9850.field_e;
 data_021a9880.value=data_021a9850.source->value;
 data_021a9880.mode=data_021a9850.source->mode;
 data_021a9880.serial=data_021a9850.serial++;
 data_021a9880.checksum=0;
 data_021a9880.checksum=func_020a2c74(data_021a9888,0x68);
 data_021a9850.index++;
 if(data_021a9850.index<data_021a9850.count) data_021a9850.cursor+=0x62;
 else data_021a9850.state=4;
 func_020a078c(0,&data_021a9880,0x70,a,b,c|3);
}
