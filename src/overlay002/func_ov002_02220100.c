typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u16 id; u16 side:1; u16 idx:5; u16 pad:10; } S;
typedef struct { char pad[0x5a8]; int state; } State;
extern State data_ov002_022ce288;
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int a,int b,int c,int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int a);
extern int func_ov002_021bcd80(int a,int b);
/* Original caller supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_0225368c(int a,int b,int c);
extern void func_ov002_0226aff0(int a,int b,int c);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_02220100(S *p) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(p->side)==0) return 0;
        if (func_ov002_0225368c(p->side,p->id,0)==0) return 0;
        if (p->id==0x1481) {
            if (func_ov002_021bcd80(p->side,(u16)((u8)p->side | ((u8)p->idx<<8)))==0) return 0;
            func_ov002_0226aff0(p->side,(u16)((u8)p->side | ((u8)p->idx<<8)),1);
        }
        return 0x7f;
    case 0x7f:
        if (func_ov002_021bc618(p->side)==0) return 0;
        func_ov002_021ae400(p->side,0x1a);
        return 0x7e;
    case 0x7e:
        func_ov002_021af9d0(p->side,6,p->id,0);
        return 0x7d;
    case 0x7d:
        {
            int *q=func_ov002_021afb74();
            func_ov002_0227adb8(p->side,(int)q,1,p->id<<16);
            return 0;
        }
    }
    return 0;
}

