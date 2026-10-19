typedef struct Node_0200fb18 Node_0200fb18;
typedef struct Node_0200fd1c Node_0200fd1c;
typedef struct { signed char type; char pad[7]; int f8; } Query_0200fb18;
typedef struct { int f0; int f4; int f8; } Query_0200fd1c;
typedef struct { Query_0200fb18 q; char pad[20]; } Item;
typedef struct {
    char pad[0x18];
    Item *items;
    Query_0200fd1c *items2;
    int pad20;
    int count;
    int count2;
    char pad2[0x240];
    int mask;
    int mask2;
} Arg;
extern Node_0200fb18 *func_0200fb18(Query_0200fb18 *q);
extern Node_0200fd1c *func_0200fd1c(Query_0200fd1c *q);
extern int func_0200fdfc(void *item, void *node, int type, int flag, int skip);
extern int func_02010408(void *item, Arg *arg, int type, int flag);
int func_0201083c(Arg *arg) {
    int i;
    Item *item;
    if (arg == 0) return 0;
    item = arg->items;
    if (item == 0) return 0;
    for (i = 0; i < arg->count; i++, item++) {
        if (item->q.f8 != 0 && !(arg->mask & (1 << i))) {
            Node_0200fb18 *n = func_0200fb18(&item->q);
            if (n != 0) {
                if (!func_0200fdfc(item, n, 0, 0, 0)) return 0;
            } else {
                if (!func_02010408(item, arg, 0, 0)) return 0;
            }
        }
    }
    {
        Query_0200fd1c *item2 = arg->items2;
        if (item2 != 0) {
            int j;
            for (j = 0; j < arg->count2; j++, item2++) {
                if (item2->f0 != 0 && !(arg->mask2 & (1 << j))) {
                    Node_0200fd1c *n = func_0200fd1c(item2);
                    if (n != 0) {
                        if (!func_0200fdfc(item2, n, 1, 0, 0)) return 0;
                    } else {
                        if (!func_02010408(item2, arg, 1, 0)) return 0;
                    }
                }
            }
        }
    }
    return 1;
}

