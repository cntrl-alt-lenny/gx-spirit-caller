typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Obj_020353cc Obj_020353cc;
struct S0203624c;
typedef struct Entry Entry;
extern u8 data_0219b2e0[];
extern u8 data_0219b760[];
extern unsigned int func_02034a84(unsigned int x);
extern int func_020353cc(Obj_020353cc *self, int idArg);
extern int func_02035ff4(unsigned char *obj);
extern void func_0203624c(struct S0203624c *p, int v);
extern int func_020366b0(int myId, int idx);
extern void func_0203671c(u8 *, int, int);
extern int func_020367dc(int, u8 *);
extern int func_0203694c(int, int, int, int, int);
extern void func_02036c68(void);
extern void func_02036c6c(Entry *p, int clear);
extern int func_020384e8(int, int);
extern void func_020387c0(unsigned int idx);
extern unsigned int func_02038958(int n);
extern int func_0203a520(int a0, int a1);
extern int func_0203a578(int a0, int a1, int a2);
extern void *func_0203a84c(int a0);
extern int func_0203bc28(void *, int, int, int);
#define VH(p,o) (*(volatile u16 *)((p)+(o)))
#define H(p,o) (*(u16 *)((p)+(o)))
#define W(p,o) (*(int *)((p)+(o)))
#define B(p,o) (*(signed char *)((p)+(o)))
u8 *func_02036d7c(int idArg, int slot, int value, int flagsArg) {
    u16 index;
    int flags = flagsArg;
    int id = idArg;
    u8 *def;
    int original;
    u8 *entry;
    int kind;
    int same = 1;
    int iscard;
    int count;
    int limit;
    int idx;
    int handle;
    int group;
    void *extra;
    if (!(VH(data_0219b2e0,0x12) & 0x4000)) return 0;
    if (VH(data_0219b2e0,0x12) & 0x2000) return 0;
    if (VH(data_0219b2e0,0x12) & 0x1000) flags |= 0x8080;
    index = (u16)id;
    def = *(u8 **)(data_0219b2e0+0x34) + index * 12;
    original = index;
    if (id & 0x1000000) {
        for (;;) {
            if ((def[9] >> 5) < 2) break;
            id = func_02034a84(index + func_02038958(def[9] >> 5)) | 0x1000000;
            index = (u16)id;
            def = *(u8 **)(data_0219b2e0+0x34) + index * 12;
            if (original == index) break;
        }
    }
    kind = ((u32)id >> 20) & 15;
    iscard = id & 0x1000000;
    if (!iscard) {
        if (slot >= 0) {
            if (slot < 0x8000) return 0;
            slot &= 15;
        }
        if (kind == 4) slot = -1;
    }
    limit = (def[8] & 15) + 1;
    count = flags & 31;
    if (!count) count = 1;
    if (count == 1) {
        if (limit > count) {
            count = limit;
            flags = (flags & ~31) | limit;
        }
    }
    idx = func_0203694c(id, original, slot, count, flags & 0x1000);
    if (idx < 0) return 0;
    if (!func_020366b0(id, idx)) return 0;
    entry = data_0219b760 + idx * 0x78;
    if (func_020353cc((Obj_020353cc *)entry, id)) return 0;
    if (kind != 4 && W(entry,0x34) == id && !(H(entry,0x68) & 0x2000)) {
    } else {
        same = 0;
        if (!(H(entry,0x68) & 0x2000)) func_0203624c((struct S0203624c *)entry, same);
    }
    if (iscard && H(entry,0x74) == original && B(entry,0x2b) != 0) {
        if (B(entry,0x2b) - H(data_0219b2e0,6) > 0) return 0;
    }
    switch (kind) {
    case 1:
        kind = func_0203a520(id, flags);
        if (kind) {
            func_0203671c(entry,id,original);
            if (idx < 4) func_020387c0(idx);
            W(entry,0) = kind;
            B(entry,0x6d) = slot;
            H(entry,0x1c) = value;
            B(entry,0x6a) = idx;
        } else return 0;
        break;
    case 2:
        kind = func_0203a520(id, flags);
        if (kind) {
            func_0203671c(entry,id,original);
            W(entry,0) = kind;
            B(entry,0x6d) = slot;
            H(entry,0x1c) = value;
            B(entry,0x6a) = idx;
            same = 0;
        } else {
            func_0203624c((struct S0203624c *)entry,0);
            return 0;
        }
        break;
    case 3:
        for (;;) {
            kind = func_0203a520(id, flags);
            if (kind) break;
            if (!func_020367dc(id,entry)) return 0;
        }
        func_0203671c(entry,id,original);
        W(entry,0) = kind;
        B(entry,0x6d) = slot;
        H(entry,0x1c) = value;
        B(entry,0x6a) = idx;
        break;
    case 4:
        group = idx - 0x14;
        handle = func_0203a578(id, flags, group);
        if (!handle) return 0;
        func_0203671c(entry,id,original);
        W(entry,0) = handle;
        B(entry,0x6d) = slot;
        H(entry,0x1c) = value;
        B(entry,0x6c) = group;
        B(entry,0x6a) = idx;
        W(entry,4) = 0;
        for (;;) {
            if (func_0203bc28(entry+4,group,id,0)) break;
            if (!(W(entry,0x34) & 0x1000000) || !func_020367dc(id,entry)) {
                func_0203624c((struct S0203624c *)entry,0);
                return 0;
            }
        }
        break;
    case 0: case 5: default: return 0;
    }
    W(entry,0x3c) = flags;
    B(entry,0x2b) = (def[7] & 15) * 2;
    if (same) func_02035ff4(entry);
    func_02036c6c((Entry *)entry,0);
    if (func_020384e8(id,1) > 0) {
        extra = func_0203a84c(index | 0x8c00000);
        if (extra) W(entry,8) = (int)((u8 *)extra+0x20);
    }
    func_02036c68();
    return entry;
}






