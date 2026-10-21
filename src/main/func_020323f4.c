typedef struct Object Object;
typedef void (*Callback)(void *);
struct Object {
    char pad[0xc];
    void *buffer;
    int field_10;
    Callback callback;
};
/* OS_DisableIrq returns the saved IRQ mask in r0 in its assembly body. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern Object *data_0219b2b4;

void func_020323f4(Object *obj) {
    int saved = OS_DisableIrq();
    if (obj != 0) {
        void *buffer = obj->buffer;
        Callback callback = obj->callback;
        if (buffer != 0) {
            callback(buffer);
        }
        callback(obj);
    }
    {
        int inner = OS_DisableIrq();
        data_0219b2b4 = 0;
        OS_RestoreIrq(inner);
    }
    OS_RestoreIrq(saved);
}
