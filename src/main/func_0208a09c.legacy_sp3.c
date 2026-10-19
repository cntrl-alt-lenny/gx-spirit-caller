typedef struct Node {
    int f0;
    struct Node *next;
    char pad[0x10];
    void *link;
} Node;
typedef struct { Node *head; void *tail; } Slot;
typedef struct { char pad[0x18]; Slot slot[1]; } Obj;
typedef struct { unsigned int id; unsigned short ids[4]; } Group;
typedef struct { unsigned int low24 : 24; unsigned int hibyte : 8; } Packed;
extern unsigned int func_02089024(unsigned int idx);
extern void *func_02089260(int idx);
extern void *func_020892c4(int idx);
extern int func_020899c0(void *a, void *q, int key, int c, int d);
extern int func_02089e70(void *param0, int param1, int param2);
extern int func_0208a000(int a0, unsigned int a1, int a2, int a3, int *a4);
extern void func_0209614c(Obj *o, int i, Node *t);
int func_0208a09c(int id, unsigned int flags, int a2, int a3, int *out) {
    Group *group = func_020892c4(id);
    int result;
    int i;
    int child;
    Packed *p;
    int error;
    if (group == 0) return 4;
    if (flags & 2) {
        result = func_02089e70((void *)group->id, a2, a3);
        if (result == 0) return 8;
    } else {
        result = func_02089024(group->id);
    }
    for (i = 0; i < 4; i++) {
        if (group->ids[i] == 0xffff) continue;
        p = func_02089260(group->ids[i]);
        if (p == 0) return 5;
        error = func_0208a000(group->ids[i], flags, a2, a3, &child);
        if (error != 0) return error;
        if ((p->hibyte & 1) && (flags & 4)) {
            if (func_020899c0((void *)child, (void *)result, i, p->low24, a2) == 0) return 9;
        }
        if (result != 0 && child != 0) func_0209614c((Obj *)result, i, (Node *)child);
    }
    if (out != 0) *out = result;
    return 0;
}
