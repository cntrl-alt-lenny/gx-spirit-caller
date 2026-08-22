/* func_0206b670: look up an item, invoke r6's stored callback
 * (field_0x488) with it and field_0x494, then run two follow-up
 * handlers. */

extern void *func_020540d0(void *a0, int a1);
extern void func_02053e58(void *a0, int a1);
extern void func_0206b6bc(void *a0, int a1);

struct S0206b670_Obj;
typedef void (*Cb0206b670)(struct S0206b670_Obj *, int, int, int);

struct S0206b670_Obj {
    unsigned char _pad_00[0x4];
    void *f_4;   /* +0x4 */
};

void func_0206b670(struct S0206b670_Obj *r6, int r5) {
    int r4 = *(int *)func_020540d0(r6->f_4, r5);
    int f_494 = *(int *)((unsigned char *)r6 + 0x494);
    Cb0206b670 cb = *(Cb0206b670 *)((unsigned char *)r6 + 0x488);

    cb(r6, 2, r4, f_494);

    func_02053e58(r6->f_4, r5);
    func_0206b6bc(r6, r4);
}
