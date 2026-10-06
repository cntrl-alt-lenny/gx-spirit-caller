typedef struct {
    char *data;
} Owner;

typedef struct {
    int _f0;
    Owner *owner; /* +0x4 */
} State;

extern State *data_0219dc80;
extern int func_02047804(void);
extern int func_02055420(Owner *owner, int id, char *a, char *b);

int func_02049038(int id, char *a, char *b) {
    if (data_0219dc80 == 0 || func_02047804() == 0) {
        return 0;
    }
    if (id == -1) {
        id = *(int *)(data_0219dc80->owner->data + 0x214);
    }
    if (a == 0) {
        a = data_0219dc80->owner->data + 0x218;
    }
    if (b == 0) {
        b = data_0219dc80->owner->data + 0x318;
    }
    return func_02055420(data_0219dc80->owner, id, a, b);
}
