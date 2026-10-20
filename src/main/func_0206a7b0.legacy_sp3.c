typedef struct { int f0, f4; char *entries; } Context;
typedef struct { int f0, kind; } Entry;
extern void *func_020540d0(char *s, int index);
extern int func_02054140(void *p);
extern int func_0206b44c(signed char *s, int n);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02101dd4[];
extern char data_02101db0[];

int func_0206a7b0(Context *ctx, unsigned char *s, int n) {
    int count = func_02054140(ctx->entries);
    int i;
    for (i = 0; i < count; i++) {
        Entry *entry = func_020540d0(ctx->entries, i);
        switch (entry->kind) {
        case 1:
            s += 1;
            n -= 1;
            break;
        case 2:
            s += 2;
            n -= 2;
            break;
        case 0: {
            int c;
            if (n < 1) return 0;
            c = *s++;
            n--;
            if (c == 0xff) {
                int length = func_0206b44c((signed char *)s, n);
                if (length == -1) return 0;
                s += length;
                n -= length;
            }
            break;
        }
        default:
            func_020a6d54((int)data_02101dd4, (int)data_02101db0, 0, 0x317);
            return 0;
        }
        if (n < 0) return 0;
    }
    return 1;
}
