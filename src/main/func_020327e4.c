extern int func_02046a5c(int *out);
extern int func_02046ac4(void);
extern int func_02052818(int a, int b, int c);
extern int func_020526b8(int idx, int arg1);

typedef struct {
    char pad[0xea4];
    int stride;
    int base;
    int unused;
    int value;
} Context;

void func_020327e4(Context *ctx) {
    int list;
    int i;
    int skipped;
    int count;
    count = func_02046a5c(&list);
    skipped = 0;
    for (i = 0; i < count; i++) {
        int item = ((unsigned char *)list)[i];
        if (item == func_02046ac4()) {
            skipped++;
        } else {
            int stride = ctx->stride;
            int base = ctx->base;
            int offset = i - skipped;
            base += offset * stride;
            func_02052818(item, base, stride);
            func_020526b8(((unsigned char *)list)[i], ctx->value);
        }
    }
}


