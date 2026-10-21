typedef struct {
    unsigned char pad[0x1c];
    void *value;
    int unused;
    int arg;
} Object;

extern unsigned long long func_02053560(void *self, int arg1);

unsigned long long func_02052ecc(Object *self) {
    unsigned long long result = 0;
    if (self->value != 0) {
        result = func_02053560(self->value, self->arg);
    }
    return result;
}
