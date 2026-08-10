extern char data_020ffb8c[];
extern char data_020ffb80[];
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern void func_02054148(void *p);
extern void func_020453b4(void *p);

typedef struct {
    void **items;   /* +0x0 */
    int count;      /* +0x4 */
} Self02054684;

void func_02054684(Self02054684 *self) {
    int i;

    if (self == 0) func_020a6d54(data_020ffb8c, data_020ffb80, 0, 0x51);
    if (self == 0) return;

    for (i = 0; i < self->count; i++) {
        func_02054148(self->items[i]);
    }
    func_020453b4(self->items);
    func_020453b4(self);
}
