/* func_ov002_02220250: guard func_ov002_0223de48(self,0,0)!=0; decode
 * func_ov002_0223dda4(self,0)'s result into (flag=byte0, field=byte1);
 * guard func_ov002_02257564(self,flag,field)!=0; if self->f0==0x1485,
 * also fire func_ov002_021e2ca4(flag,field,0x15,1); finally always
 * fire func_ov002_021d6718(self,flag,field,0,0) and return 0.
 *
 * NOTE: deliberately does NOT include ov002_core.h — that header types
 * func_ov002_0223dda4's return as u16, which lets mwcc prove the value
 * already fits 16 bits and skip the lsl16/lsr16 truncation the original
 * performs; declaring it `int` here reproduces the real instruction
 * count. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_0223de48(void *self, int a, int b);
extern int func_ov002_0223dda4(void *self, int idx);
extern int func_ov002_02257564(void *self, int a, int b);
extern void func_ov002_021e2ca4(int b0, int idx, int a, int b);
extern int func_ov002_021d6718(void *self, int player, int idx, int arg3, int arg4);

int func_ov002_02220250(struct Self *self) {
    if (func_ov002_0223de48(self, 0, 0) == 0)
        goto ret0;
    {
        int result = func_ov002_0223dda4(self, 0);
        int flag = result & 0xff;
        int field = ((int)(u16)result >> 8) & 0xff;
        if (func_ov002_02257564(self, flag, field) == 0)
            goto ret0;
        if (self->f0 == 0x1485)
            func_ov002_021e2ca4(flag, field, 0x15, 1);
        func_ov002_021d6718(self, flag, field, 0, 0);
    }
ret0:
    return 0;
}
