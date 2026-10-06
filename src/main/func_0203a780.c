typedef struct {
    unsigned char type;
    char          _1[0x3];
    int           arg;
} item_0203a780_t;

typedef struct {
    unsigned int    count;
    item_0203a780_t items[1];
} list_0203a780_t;

extern void *func_02089134(int idx);
extern int func_0203a694(int a0, int a1, int a2);
extern int func_0203a6e8(int a0, int a1, int a2);
extern int func_0203a744(int a0, int a1, int a2);

int func_0203a780(int a, int idx, int b) {
    list_0203a780_t *l = func_02089134(idx);
    item_0203a780_t *it;
    unsigned int i;

    if (l == 0) {
        return 0;
    }
    for (i = 0; i < l->count; i++) {
        it = &l->items[i];
        switch (it->type) {
        case 0:
            if (func_0203a6e8(a, it->arg, b) == 0) {
                return 0;
            }
            break;
        case 3:
            if (func_0203a744(a, it->arg, b) == 0) {
                return 0;
            }
            break;
        case 1:
            if (func_0203a694(a, it->arg, b) == 0) {
                return 0;
            }
            break;
        case 2:
            break;
        }
    }
    return 1;
}
