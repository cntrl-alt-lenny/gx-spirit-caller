typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
    u16 id;
    u16 bit0:1;
    u16 field:5;
    u16 rest:8;
    u16 bit14:1;
    u16 bit15:1;
    u16 pad[2];
    u16 count;
    u16 total;
} Obj;
struct Global { char pad[0x5a8]; int state; int value; };
extern struct Global data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021d59cc(int arg0,int arg1,int arg2,int arg3,u16 arg4);
extern void func_ov002_021e2b3c(int unused0);
/* The original leaves the unused incoming argument untouched. */
extern void func_ov002_021e2c5c();
/* The original passes only the object, leaving the unused r1 untouched. */
extern int func_ov002_021ff400(Obj *p, int unused1);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_0223838c(Obj *p, int arg1) {
    u32 side = p->bit0 ^ p->bit14;
    u32 bit = p->bit0;
    switch(data_ov002_022ce288.state) {
    case 0x80: {
        int n;
        if (func_ov002_021ff400(p, arg1) == 0) return 0;
        n = func_ov002_021bc618(side);
        if (n < func_ov002_0225368c(side,p->id,0))
            p->total = func_ov002_021bc618(side);
        else
            p->total = func_ov002_0225368c(side,p->id,0);
        if (p->total == 0) return 0;
        func_ov002_021ae400(side,0x11d);
        return 0x7e;
    }
    case 0x7e: {
        u32 n = p->total;
        if (n >= 0x20) n = 0x20;
        func_ov002_021af9d0(side,n+6,p->id,0);
        p->count = 0;
        func_ov002_021e2b3c(0);
        return 0x7d;
    }
    case 0x7d:
        if (p->count < p->total) {
            data_ov002_022ce288.value = func_ov002_021bc6c4(side);
            func_ov002_0227adb8(side,(int)func_ov002_021b004c(p->count+1),1,p->id<<16);
            return 0x7c;
        }
        func_ov002_021e2c5c();
        return 0;
    case 0x7c:
        func_ov002_021d59cc(side,data_ov002_022ce288.value,(u16)((u8)bit | ((u8)p->field<<8)),6,0);
        p->count++;
        return 0x7d;
    }
    return 0;
}



