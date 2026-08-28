extern char data_020ffaac[];
extern char data_020ffaa0[];
extern void func_020a6c60(char *file, char *expr, int zero, int line);
extern void func_020540d4(void *p);
extern void func_02045364(void *p);

typedef struct {
    void **items;   /* +0x0 */
    int count;      /* +0x4 */
} Self02054684;

void func_02054610(Self02054684 *self) {
    int i;

    if (self == 0) func_020a6c60(data_020ffaac, data_020ffaa0, 0, 0x51);
    if (self == 0) return;

    for (i = 0; i < self->count; i++) {
        func_020540d4(self->items[i]);
    }
    func_02045364(self->items);
    func_02045364(self);
}
