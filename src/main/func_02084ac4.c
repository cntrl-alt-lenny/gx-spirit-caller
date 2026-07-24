typedef struct {
    int field0;
    char pad[8];
    void (*fn)(void *);
} Obj02084ac4;

void func_02084ac4(Obj02084ac4 *arg0) {
    if (arg0->fn != 0) {
        arg0->fn(arg0);
    }
    arg0->field0 = arg0->field0 + 1;
}
