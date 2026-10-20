typedef struct Obj02038c98 {
    char pad14[0x14]; int f14; char pad1e[6]; unsigned char f1e;
} Obj02038c98;
typedef struct Node Node;
struct Node {
    char pad8[8]; void *owner; char pad1c[0x10];
    unsigned char refs; char pad2e[0x11]; unsigned short id;
    short count; short pad32; Node *children[1];
};
typedef struct {
    char pad10[0x10]; Node *node; char pad57[0x43]; unsigned char flags;
} Context;
typedef struct { void *head, *tail; unsigned short count, offset; } List;
extern char data_0219c480[];
extern List data_0219c494;
/* IRQ primitive returns the saved CPSR mask in r0, as read by this caller. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void *func_0203a84c(int a0);
extern void func_0207cff4(List *list, void *node);
extern int func_02038c98(Obj02038c98 *obj, int flag);
extern void func_02095e28(char *param0, int param1, int param2);

void func_0203a950(Context *ctx)
{
    Node *node;
    Node **child;
    int i;
    int count;
    int saved;
    char *parent;
    Node *entry;
    if (*(unsigned short *)(data_0219c480 + 4)) return;
    if (!ctx->node) return;
    ctx->node->refs--;
    node = ctx->node;
    if (node->refs) return;
    if (ctx->flags & 0x80) {
        child = node->children;
        count = node->count;
        i = -1;
        saved = OS_DisableIrq();
        parent = func_0203a84c(node->id);
        if (!parent) {
        while (++i < count) {
            entry = *child;
            if (entry && --entry->refs == 0) {
                if (entry->owner) {
                    *(int *)((char *)entry->owner + 4) = 0;
                    entry->owner = 0;
                }
                func_0207cff4(&data_0219c494, entry);
                func_02038c98((Obj02038c98 *)entry, 1);
                *child = 0;
            }
            child++;
        }
        } else {
        while (++i < count) {
            entry = *child;
            if (entry && --entry->refs == 0) {
                if (entry->owner) {
                    *(int *)((char *)entry->owner + 4) = 0;
                    entry->owner = 0;
                }
                func_0207cff4(&data_0219c494, entry);
                func_02038c98((Obj02038c98 *)entry, 1);
                func_02095e28(parent + 0x20, i, 0);
                *child = 0;
            }
            child++;
        }
        }
        OS_RestoreIrq(saved);
    }
    func_0207cff4(&data_0219c494, ctx->node);
    func_02038c98((Obj02038c98 *)ctx->node, 1);
    ctx->node = 0;
}


