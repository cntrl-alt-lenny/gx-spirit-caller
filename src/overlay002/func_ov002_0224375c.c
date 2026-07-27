/* func_ov002_0224375c ov002 shift-mask extract, asr byte, single guard */

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj0224375c {
    u8  pad[0x14];
    s32 field14;       /* [0x14] */
};

extern int  func_ov002_021b947c(int v);
extern void func_ov002_0223de04(void *obj, int a1, int a2, int a3);

int func_ov002_0224375c(struct Obj0224375c *obj)
{
    int x = obj->field14;
    int r = func_ov002_021b947c((unsigned)(x << 0x17) >> 0x17);   /* :9 zero-ext of field14 low bits */
    int hi = ((int)((unsigned)(r << 0x10) >> 0x10) >> 8) & 0xff;
    if (hi == 0xe) {
        func_ov002_0223de04(obj,
                            r & 0xff,
                            0xe,
                            (unsigned)(obj->field14 << 0x17) >> 0x17);
    }
    return 1;
}
