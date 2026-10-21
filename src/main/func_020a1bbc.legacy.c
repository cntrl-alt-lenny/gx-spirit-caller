typedef void (*Callback)(int, int, void *);
typedef struct {
    char pad[0x14e4];
    Callback callback;
} State;
extern State *data_021a98fc;

void func_020a1bbc(int a, int b, void *c) {
    Callback callback = data_021a98fc->callback;
    if (callback == 0) {
        return;
    }
    callback(a, b, c);
}
