typedef unsigned char u8;
typedef struct { int f0; unsigned short f4,f6,f8; unsigned char bytes[6]; unsigned short mode,len; unsigned char data[32]; unsigned short extra; } Msg;
typedef struct { u8 pad[0x2260]; int state; u8 pad2[0x1c]; unsigned short result; u8 pad3[2]; int count; Msg msg; } Context;
typedef struct { unsigned short pad0,state,pad4,pad6,kind,mask,padc,count; char *items[16]; unsigned short ids[16]; } Event;
extern Context *data_021a088c;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_0207b250(void *a, void *b, unsigned int c);
extern void func_020928cc(void *p, unsigned int size);
extern void func_0207b038(int a0);
extern void func_0207a868(Event *self);
extern int func_0209eb48(int a0, Msg *msg);
int func_0207bcd8(void *a, void *b, unsigned int c) {
 int mask = OS_DisableIrq();
 Context *ctx = data_021a088c;
 if (ctx == 0) { OS_RestoreIrq(mask); return 1; }
 switch (ctx->state) {
 case 5: func_0207b250(a,b,c); OS_RestoreIrq(mask); return 2;
 case 6: func_0207b250(a,b,c); OS_RestoreIrq(mask); return 0;
 default: OS_RestoreIrq(mask); return 1;
 case 3: func_0207b250(a,b,c); break;
 }
 func_020928cc((void *)data_021a088c->msg.f0, data_021a088c->msg.f4);
 data_021a088c->count++;
 switch (func_0209eb48((int)func_0207a868, &data_021a088c->msg)) {
 case 2: func_0207b038(5); data_021a088c->result=3; break;
 case 8: OS_RestoreIrq(mask); return 4;
 case 3: default: func_0207b038(11); OS_RestoreIrq(mask); return 7;
 }
 OS_RestoreIrq(mask); return 3;
}


