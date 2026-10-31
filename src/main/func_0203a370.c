typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u16 f0, f2, f4; char pad[6]; } Entry;
typedef struct { u16 f0, f2, f4, f6; u32 f8; u32 *fc, *f10; } Control;
typedef struct { char pad[4]; int field4, f8, fc, f10; char p14[0x40]; u16 f54; unsigned char f56, p57[2]; signed char refs; unsigned char f5a, p5b; } Elem02038dac;
struct Obj_2038f3c;
typedef struct St St;
typedef struct Task Task;
extern Control data_0219c480;
extern Entry *data_0219b314;
extern u32 func_02034a84(u32 x);
/* This caller also supplies flags in r1, beyond the callee's C definition. */
extern Elem02038dac *func_02038ddc(int key, int flags);
extern void func_02038f3c(struct Obj_2038f3c *obj, int n, int r2);
extern int func_0203a6e8(int a0, int a1, int a2);
extern int func_0203a694(int a0, int a1, int a2);
extern int func_0203a744(int a0, int a1, int a2);
extern int func_0203a780(int a0, int a1, int a2);
extern void *func_0203c6f8(int idx);
extern int func_02039690(int p0, int p1, int p2);
extern int func_020399dc(Task *task, int flags);
extern void func_0203a150(St *p, int a, int b);
extern void func_0203aae8(Elem02038dac *p);

Elem02038dac *func_0203a370(int card, int flags, int player) {
    Entry *entry;
    Elem02038dac *obj;
    int ok;
    if (data_0219c480.f4) {
        flags |= 0x80;
        flags |= 0x8000;
    }
    entry = &data_0219b314[(u16)card];
    card = func_02034a84(card);
    obj = func_02038ddc(card, flags);
    if (obj) {
        func_02038f3c((struct Obj_2038f3c *)obj, -1, card);
        ok = 0;
        switch (((u32)card >> 20) & 15) {
        case 1: ok = func_0203a6e8((int)obj, entry->f2, flags); break;
        case 8: ok = func_0203a694((int)obj, entry->f2, flags); break;
        case 4: ok = func_02039690((int)func_0203c6f8(player), (u16)card, flags); break;
        case 2: ok = 1; break;
        case 10: ok = func_0203a780((int)obj, entry->f2, flags); break;
        case 3:
        case 11:
            ok = func_0203a744((int)obj, entry->f2, flags);
            if (ok) ok = func_0203a694((int)obj, entry->f4, flags);
            break;
        }
        if (ok && (flags & 0x8000)) {
            if (func_020399dc((Task *)obj, flags) <= 0) ok = 0;
        }
        if (ok) func_0203a150((St *)obj, card, flags);
        else {
            func_0203aae8(obj);
            obj = 0;
        }
    }
    data_0219c480.f10 = 0;
    data_0219c480.fc = 0;
    return obj;
}


