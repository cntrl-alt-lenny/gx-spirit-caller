typedef struct Node2 Node2;
struct Node2 { char pad[0x1c]; int result; Node2 *next; };
typedef Node2 Item;
typedef struct Owner { char pad[0x1d8]; unsigned int state; char pad1dc[0x240]; int pending; char pad420[4]; Node2 *head; } Owner;
typedef Owner Root2;
extern void func_02055324(void *p);
extern int func_02056264(int *ctx);
extern int func_02058244(Owner **pp, int key);
extern void func_020586c8(Owner **pp, int flag);
extern int func_02058954(void **a0);
extern int func_0205bd0c(Root2 **pp, Node2 **out, int key);
extern void func_0205bd58(Owner **pp, Item *item);
extern int func_0205bf18(Owner **pp, Item *item);
extern int func_0205c830(Owner **pp);
extern int func_0205da48(Owner **pp);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_020ffd50[], data_020ffe48[], data_020ffe50[];
int func_020560a8(Owner **pp, int wait) {
    Owner *o = *pp;
    int result = 0;
    Node2 *node;
    int again;
    int ret;
    if (o->state > 4) func_020a6d54((int)data_020ffd50, (int)data_020ffe48, 0, 0x1b5);
    if (o->state == 1) {
        do {
            result = func_02058954((void **)pp);
            again = result == 0 && wait != 0 && o->state == 1;
            if (again) func_02055324((void *)10);
        } while (again);
        if (result != 0) {
            if (func_0205bd0c(pp, &node, 1)) node->result = 4;
            else func_020a6d54((int)data_020ffe50, (int)data_020ffe48, 0, 0x1db);
        }
    }
    if (o->state == 2 || o->state == 3) {
        if (result == 0) result = func_02056264((int *)pp);
        if (result == 0) result = func_0205c830(pp);
    }
    if (result == 0) result = func_0205da48(pp);
    node = o->head;
    while (node != 0) {
        if (node->result == 0) node = node->next;
        else {
            func_0205bf18(pp, node);
            { Node2 *old = node; node = node->next; func_0205bd58(pp, old); }
        }
    }
    ret = func_02058244(pp, wait);
    if (ret != 0) return ret;
    if (o->pending != 0) func_020586c8(pp, 0);
    return result;
}
