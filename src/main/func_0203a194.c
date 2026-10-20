typedef unsigned int u32;
typedef unsigned short u16;
typedef struct Obj0203a8dc { char pad8[8]; void *f8; char pad14[8]; u32 f14; char pad1c[4]; unsigned char refs; } Obj0203a8dc;
typedef struct Obj_2038f3c { char pad14[0x14]; u32 arr14[8]; u32 arr34[8]; } Obj_2038f3c;
typedef struct Context { u32 f0, f4; char pad14[12]; u32 ids[8]; Obj0203a8dc *nodes[8]; u16 flags; } Context;
typedef struct { u16 f0, f2, f4; char pad[6]; } Entry;
typedef struct { u32 hdr; u16 vals[4]; } Table;
typedef struct { u32 low24:24; u32 high8:8; } Packed;
extern char data_0219c480[];
extern Entry *data_0219b314;
extern int data_0219b328;
extern char data_0219b384[];
extern void *func_0208938c(int idx);
extern void *func_020892c4(int idx);
extern void *func_02089260(int idx);
extern unsigned int func_02089024(unsigned int idx);
extern void func_020927b8(char *self);
extern void func_02092748(char *self);
extern void func_0203a950(Context *ctx);
extern void func_0203a8dc(Obj0203a8dc *obj);
extern void func_02038f3c(struct Obj_2038f3c *obj, int n, int r2);
extern int func_0203a5d4(int a0, int a1, int a2);
int func_0203a194(Context *ctx, int arg, int mode) {
    u32 id;
    Entry *entry;
    int key;
    Table *table;
    unsigned int i;
    Packed *p;
    unsigned int j;
    Obj0203a8dc *node;
    u32 bits;
    if (!ctx) return 0;
    if (*(u16 *)(data_0219c480 + 4)) return 1;
    id = ctx->f4;
    entry = &data_0219b314[(u16)id];
    if (!func_0208938c(entry->f2)) return 0;
    key = entry->f4;
    table = func_020892c4(key);
    if (!table) return 0;
    func_02089024(table->hdr);
    if (mode) {
        data_0219b328 = 1;
        func_020927b8(data_0219b384);
        func_0203a950(ctx);
        for (i=0; i<4; i++) {
            if (table->vals[i] == 0xffff) continue;
            p = func_02089260(table->vals[i]);
            if (!p) {
                func_02092748(data_0219b384);
                data_0219b328 = 0;
                return 0;
            }
            for (j=0; ; j++) {
                if (ctx->ids[j] == 0xffff) break;
                if (ctx->ids[j] == p->low24) {
                    node = ctx->nodes[j];
                    if (node) {
                        ctx->flags |= 1 << j;
                        ctx->nodes[j] = 0;
                        if (--node->refs == 0) func_0203a8dc(node);
                    }
                }
            }
        }
        func_02092748(data_0219b384);
        data_0219b328 = 0;
        return 1;
    } else {
        bits = ctx->flags;
        for (i=0; i<8; i++, bits >>= 1) {
            if (bits & 1) {
                func_02038f3c((Obj_2038f3c *)ctx, i, id);
                if (func_0203a5d4((int)ctx, key, arg)) {
                    ctx->flags = 0;
                    return 1;
                }
                return 0;
            }
        }
        return 0;
    }
}

