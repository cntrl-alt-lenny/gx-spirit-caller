typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Rec { char pad[0xc]; int size; char pad10[0xd]; signed char state; char pad1e[2]; char payload[1]; } Rec;
typedef struct { char pad[0x24]; int freeSize; u16 id, source, group, target; short count; char pad32[2]; Rec *entries[1]; } Work;
typedef struct { char pad[0x10]; Work *work; char pad14[0x43]; u8 flags; } Task;
typedef struct { u16 f0, f2, f4; } Ctl;
typedef struct { int field0, field4; } Obj02096040;
typedef struct { u8 type, pad; u16 index, value, f6, f8, fa; } Entry;
typedef struct { u32 id; u16 refs[4]; } Header;
typedef struct { unsigned int id:24; unsigned int flags:8; } Ref;
typedef struct Node { int f0; struct Node *next; char pad[0x10]; void *link; } Node;
typedef struct { Node *head; void *tail; } Slot;
typedef struct { char pad[0x18]; Slot slot[1]; } Obj;
extern Ctl data_0219c480;
extern void *func_0203a84c(int a0);
extern Rec *func_02039020(char *, int, int, int);
extern int func_02095e60(void *p);
/* This caller passes source in r1, beyond the C definition's single argument. */
extern void func_02096040(Obj02096040 *arg0, char *source);
extern int func_02095e68(char *, Entry *, Obj02096040 *);
extern int func_02095de0(char *arr, int idx);
extern void func_02095e28(char *param0, int param1, int param2);
extern void *func_020892c4(int idx);
extern void *func_02089260(int idx);
extern unsigned int func_02089024(unsigned int idx);
extern void func_0209614c(Obj *o, int i, Node *t);
/* These SDK assembly routines use the calling contracts documented in their sources. */
extern void Copy32(const void *, void *, u32);
extern void Fill32(u32, void *, u32);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
static inline int link_refs(int id) {
    Header *header;
    Obj *object;
    unsigned int j;
    header = func_020892c4(id);
    if (header == 0) return 0;
    object = (Obj *)func_02089024(header->id);
    if (object == 0) return 0;
    for (j = 0; j < 4; ++j) {
        if (header->refs[j] != 0xffff) {
            Ref *ref = func_02089260(header->refs[j]);
            if (ref != 0) {
                Node *node = (Node *)func_02089024(ref->id);
                if (node == 0) return 0;
                func_0209614c(object, j, node);
            }
        }
    }
    return 1;
}
int func_020399dc(Task *task, int flags) {
    Work *w;
    Rec **entries;
    char *source;
    char *target;
    Rec *rec;
    int sync;
    Obj02096040 cursor;
    Entry entry;
    if (data_0219c480.f4 != 0) return 1;
    w = task->work;
    sync = flags & 0x8000;
    if (w == 0) return 1;
    entries = w->entries;
    rec = func_0203a84c(w->target);
    if (rec == 0) return 0;
    if (rec->state != 1) return 0;
    target = rec->payload;
    source = 0;
    if (!(task->flags & 0x70)) {
        rec = func_0203a84c(w->source);
        if (rec == 0) return 0;
        if (rec->state != 1) return 0;
        source = rec->payload;
    }
    if (!(task->flags & 0x80)) {
        int count = func_02095e60(target);
        int twice = count * 2;
        int bytes = count * 4;
        if (((int *)(target + 0x3c))[twice] == 0) {
            Copy32(target + 0x3c, target + 0x3c + *(int *)(target + 0x38) * 4, bytes);
            Fill32(0, target + 0x3c, bytes);
            ((int *)(target + 0x3c))[twice] = 1;
        }
        task->flags |= 0x80;
    }
    if (!(task->flags & 0x40)) {
        int group = w->group;
        func_02096040(&cursor, source);
        while (func_02095e68(source, &entry, &cursor)) {
            if (entry.type == 1 && entry.value == 0) {
                unsigned int index = entry.index;
                if (index >= (unsigned int)w->count) return -1;
                if (entries[index] == 0) {
                    rec = func_02039020(target, group, index, flags);
                    if (rec == 0) return -1;
                    entries[index] = rec;
                    w->freeSize -= (rec->size + 0x3f) & ~0x1f;
                }
            }
        }
        task->flags |= 0x40;
        if (!sync) return 0;
    }
    if (!(task->flags & 0x20)) {
        int irq = OS_DisableIrq();
        int i;
        int ok;
        Header *header;
        Obj *object;
        for (i = 0; i < w->count; ++i) {
            rec = entries[i];
            if (rec != 0) {
                if (rec->state != 1) {
                    OS_RestoreIrq(irq);
                    return 0;
                }
                if (func_02095de0(target, i) == 0) func_02095e28(target, i, (int)rec->payload);
            }
        }
        ok = link_refs(w->id);
        if (!ok) {
            OS_RestoreIrq(irq);
            return -1;
        }
        OS_RestoreIrq(irq);
        task->flags |= 0x30;
    }
    return 1;
}





