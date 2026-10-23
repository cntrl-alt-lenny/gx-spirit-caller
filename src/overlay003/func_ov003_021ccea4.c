typedef struct { int f0, f4, f8, fc; } Req;
extern void func_0201e7e0();
extern int OS_SPrintf(signed char *, const signed char *, ...);
extern void func_ov003_021cd358(char *, int, int, Req *);
extern int func_ov003_021cce58(int, int);
extern struct { char pad[0xba8]; unsigned value; char pad2[0x90]; int selector; } data_021040ac;
extern int data_02104c68[];
extern struct { int w0; unsigned chan:3; } data_02104f4c;
extern signed char data_ov003_021cf388[];
extern signed char data_ov003_021cf3a8[];
extern signed char data_ov003_021cf3c8[];
extern signed char data_ov003_021cf3e8[];
extern signed char data_ov003_021cf408[];
extern signed char data_ov003_021cf428[];
extern signed char data_ov003_021cf448[];
extern signed char data_ov003_021cf468[];
extern signed char data_ov003_021cf488[];
extern signed char data_ov003_021cf4a8[];
extern signed char data_ov003_021cf4c8[];
extern signed char data_ov003_021cf4e8[];
extern signed char data_ov003_021cf508[];
extern signed char data_ov003_021cf528[];
extern signed char data_ov003_021cf548[];
extern signed char data_ov003_021cf568[];
extern signed char data_ov003_021cf588[];
extern signed char data_ov003_021cf5a0[];
extern signed char data_ov003_021cf5b8[];
extern signed char data_ov003_021cf5d0[];
extern signed char data_ov003_021cf5e8[];
extern signed char data_ov003_021cf600[];
extern signed char data_ov003_021cf618[];
extern signed char data_ov003_021cf630[];
extern signed char data_ov003_021cf648[];
extern signed char data_ov003_021cf660[];
extern signed char data_ov003_021cf678[];
extern signed char data_ov003_021cf690[];
void func_ov003_021ccea4(char *base, int side) {
 signed char buffers[4][64];
 signed char *paths[4];
 unsigned value;
 int index;
 unsigned part;


 index = data_021040ac.selector ^ side;
 paths[0]=buffers[0];
 paths[1]=buffers[1]; paths[2]=buffers[2]; paths[3]=buffers[3];
 func_0201e7e0();
 if (data_02104c68[index] == 0) {
 if (side != 0) value=data_021040ac.value; else value=*(unsigned *)((char *)&data_02104f4c+0xa64);
 part=(value & 0x1f) >> 0;
 OS_SPrintf(paths[0], data_ov003_021cf388, part);
 OS_SPrintf(paths[1], data_ov003_021cf3a8, part);
 OS_SPrintf(paths[2], data_ov003_021cf3c8, part);
 OS_SPrintf(paths[3], data_ov003_021cf3e8, part);
 func_ov003_021cd358(base,side,0,(Req *)paths);
 part=(value & 0x3e0) >> 5;
 OS_SPrintf(paths[0], data_ov003_021cf408, part);
 OS_SPrintf(paths[1], data_ov003_021cf428, part);
 OS_SPrintf(paths[2], data_ov003_021cf448, part);
 OS_SPrintf(paths[3], data_ov003_021cf468, part);
 func_ov003_021cd358(base,side,1,(Req *)paths);
 part=(value & 0x7c00) >> 10;
 OS_SPrintf(paths[0], data_ov003_021cf488, part);
 OS_SPrintf(paths[1], data_ov003_021cf4a8, part);
 OS_SPrintf(paths[2], data_ov003_021cf4c8, part);
 OS_SPrintf(paths[3], data_ov003_021cf4e8, part);
 func_ov003_021cd358(base,side,2,(Req *)paths);
 if (part != 6 && part != 11) {
 part=(value & 0xf8000) >> 15;
 OS_SPrintf(paths[0], data_ov003_021cf508, part);
 OS_SPrintf(paths[1], data_ov003_021cf528, part);
 OS_SPrintf(paths[2], data_ov003_021cf548, part);
 OS_SPrintf(paths[3], data_ov003_021cf568, part);
 func_ov003_021cd358(base,side,3,(Req *)paths);
 }
 part=(value & 0x1f00000) >> 20;
 if (part == 0) return;
 OS_SPrintf(paths[0], data_ov003_021cf588, part+0x4b);
 OS_SPrintf(paths[1], data_ov003_021cf5a0, part+0x4b);
 OS_SPrintf(paths[2], data_ov003_021cf5b8, part+0x4b);
 OS_SPrintf(paths[3], data_ov003_021cf5d0, part+0x4b);
 func_ov003_021cd358(base,side,4,(Req *)paths);
 } else {
 if (data_02104c68[index] == 0x37) {
 if (data_02104f4c.chan == 0) {
 OS_SPrintf(paths[0], data_ov003_021cf5e8, 0x37);
 OS_SPrintf(paths[1], data_ov003_021cf600, 0x37);
 OS_SPrintf(paths[2], data_ov003_021cf618, 0x37);
 OS_SPrintf(paths[3], data_ov003_021cf630, 0x37);
 } else {
 OS_SPrintf(paths[0], data_ov003_021cf648, 0x37);
 OS_SPrintf(paths[1], data_ov003_021cf660, 0x37);
 OS_SPrintf(paths[2], data_ov003_021cf678, 0x37);
 OS_SPrintf(paths[3], data_ov003_021cf690, 0x37);
 }
 } else {
 OS_SPrintf(paths[0], data_ov003_021cf588, data_02104c68[index]);
 OS_SPrintf(paths[1], data_ov003_021cf5a0, data_02104c68[index]);
 OS_SPrintf(paths[2], data_ov003_021cf5b8, data_02104c68[index]);
 OS_SPrintf(paths[3], data_ov003_021cf5d0, data_02104c68[index]);
 }
 func_ov003_021cd358(base,side,0,(Req *)paths);
 if (!func_ov003_021cce58((int)base,data_02104c68[index])) return;
 switch (data_02104c68[index]) {
 case 1:
 OS_SPrintf(paths[0], data_ov003_021cf588, 0x5c);
 OS_SPrintf(paths[1], data_ov003_021cf5a0, 0x5c);
 OS_SPrintf(paths[2], data_ov003_021cf5b8, 0x5c);
 OS_SPrintf(paths[3], data_ov003_021cf5d0, 0x5c);
 func_ov003_021cd358(base,side,4,(Req *)paths);
 break;
 case 0x4b:
 OS_SPrintf(paths[0], data_ov003_021cf588, 0x5d);
 OS_SPrintf(paths[1], data_ov003_021cf5a0, 0x5d);
 OS_SPrintf(paths[2], data_ov003_021cf5b8, 0x5d);
 OS_SPrintf(paths[3], data_ov003_021cf5d0, 0x5d);
 func_ov003_021cd358(base,side,4,(Req *)paths);
 break;
 }
 }
}











