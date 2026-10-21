typedef struct {
    unsigned char pad[0x498];
    char *key;
    int ascending;
} SortContext;
extern SortContext *data_0219ecd4;
extern int func_02068a20(void *object, char *key, int fallback);

int func_0206ba4c(void *a, void *b) {
    int result;
    a = *(void **)a;
    void *second = *(void **)b;
    result = func_02068a20(a, data_0219ecd4->key, 0);
    result -= func_02068a20(second, data_0219ecd4->key, 0);
    if (data_0219ecd4->ascending == 0)
        result = -result;
    return result;
}

