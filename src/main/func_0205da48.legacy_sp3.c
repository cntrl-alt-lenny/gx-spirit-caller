typedef struct Item Item;
typedef struct {
    char pad[0x13c];
    int busy;
    int remove;
} Detail;
struct Item {
    int kind;
    Detail *detail;
    char pad8[0xc];
    int state;
    int field18;
    int result;
    Item *next;
};
typedef struct {
    char pad0[0x210];
    int count;
    char pad214[0x210];
    Item *items;
} Owner;
extern int func_020453e8(int a);
/* Original call sets only r0; the thunk has unused tail arguments. */
extern int func_020453b4();
extern int func_0205ffc0(int *p, int b);
extern void func_0205bd58(Owner **pp, Item *item);
extern int func_0205dba4(Owner **pp, Item *item);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100e20[], data_02100e30[], data_02100e50[];
int func_0205da48(Owner **pp) {
    Owner *o = *pp;
    Item **array;
    Item *item;
    int count = 0;
    int i;
    int result;
    int message;
    if (o->count > 0) {
        array = (Item **)func_020453e8(o->count * 4);
        if (array == 0) {
            func_0205ffc0((int *)pp, (int)data_02100e20);
            return 1;
        }
        item = o->items;
        if (item != 0) {
            message = (int)data_02100e30;
            do {
            if (item->kind == 3 && item->state != 5 && item->detail->busy == 0) {
                if (count >= o->count)
                    func_020a6d54(message, (int)data_02100e50, 0, 0x563);
                array[count++] = item;
                item->detail->busy = 1;
            }
                item = item->next;
            } while (item != 0);
        }
        for (i = 0; i < count; i++) {
            result = func_0205dba4(pp, array[i]);
            if (result != 0)
                array[i]->result = result;
        }
        for (i = 0; i < count; i++) {
            Detail *detail = array[i]->detail;
            detail->busy = 0;
            if (detail->remove != 0)
                func_0205bd58(pp, array[i]);
        }
        func_020453b4((int)array);
    }
    return 0;
}







