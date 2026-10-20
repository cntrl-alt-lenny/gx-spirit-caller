struct Arg { unsigned short id; unsigned short side:1; unsigned short pad:13; unsigned short other:1; unsigned short top:1; };
struct Global { char pad[0x5a8]; int state; };
struct Mode { char pad[0xd44]; int value; };
struct Record { unsigned int card:13; unsigned int bit:1; unsigned int pad:8; unsigned int value:8; unsigned int top:2; };
extern struct Global data_ov002_022ce288;
extern struct Mode data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae4bc(void *self, int idx);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021ca440(int arg0, int arg1);
/* The original supplies only r0 and r1 to this four-parameter thunk. */
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021ff3bc(struct Arg *p, int unused1);
extern int func_ov002_0223f6c4(struct Arg *p);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_022369c0(struct Arg *p, int unused) {
    int side = p->side ^ p->other;
    struct Record *r;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0225368c(side, p->id, func_ov002_0223f6c4(p)) == 0) {
            func_ov002_021ae400(side, 0x15);
            return 0x78;
        } else {
            func_ov002_021ae400(side, 0x5e);
            return 0x7e;
        }
    case 0x7e:
        func_ov002_021af9d0(side, 6, p->id, func_ov002_0223f6c4(p));
        return 0x7d;
    case 0x7d:
        if (func_ov002_021ff3bc(p, unused) != 0 && func_ov002_021ca440(side, ((struct Record *)func_ov002_021afb74())->card) != 0) {
            if (data_ov002_022cd744[side] == 1) {
                data_ov002_022d016c.value = ((struct Record *)func_ov002_021afb74())->card == 0x18aa;
            } else {
                r = (struct Record *)func_ov002_021afb74();
                func_ov002_021ae4bc((void *)0x35, ((struct Record *)func_ov002_021afb74())->value * 2 + r->bit);
            }
            return 0x7c;
        } else {
            data_ov002_022d016c.value = 0;
            return 0x7c;
        }
    case 0x7c:
        if (data_ov002_022d016c.value != 0) {
            func_ov002_0227adb8(side, (int)func_ov002_021afb74(), 1, (unsigned int)p->id << 16);
        } else {
            func_ov002_021d8288(side, (int)func_ov002_021afb74());
        }
        return 0x64;
    case 0x78:
        func_ov002_0226b054(1 - side);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(side);
        return 0;
    }
    return 0;
}

