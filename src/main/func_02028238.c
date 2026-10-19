typedef struct {
    char pad0[0x68];
    int resource;
    unsigned char kind;
    char pad6d[0x63];
    void *buffer;
    char padd4[4];
    short value;
    short duration;
    short counter;
    unsigned short b0:1;
    unsigned short b1:1;
    unsigned short b2:1;
    unsigned short b3:1;
} Obj;
typedef struct { int type; Obj *obj; int flags; } Request;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern void Fill32(int value, void *dest, int size);
extern void Copy32(const void *src, void *dest, int size);
extern int func_02006c0c(int resource, int align, int flags);
extern int func_0201d760(int arg);
extern int func_02022d54(Request *request);
extern int func_0202838c(Obj *obj);
int func_02028238(Obj *o, int value, int duration) {
    o->b3 = 0;
    if (duration < 0) {
        if (o->buffer != 0) {
            Task_InvokeLocked(o->buffer);
            o->buffer = 0;
        }
    } else {
        if (o->buffer == 0 && o->b2) {
            int size = (o->kind == 1 ? 0x100 : 0x10) * 2;
            int handle;
            void *dest;
            int source;
            o->buffer = (void *)Task_PostLocked((void *)size, 4, 0);
            Fill32(0, o->buffer, size);
            handle = func_02006c0c(o->resource, 4, 0);
            dest = o->buffer;
            source = func_0201d760(handle);
            Copy32((void *)source, dest, size);
            Task_InvokeLocked((void *)handle);
        }
        o->value = value;
        o->duration = duration;
        o->counter = 0;
        o->b3 = (unsigned short)(duration != 0);
        if (duration == 0 && o->buffer != 0) {
            Request request;
            request.type = 0;
            request.obj = o;
            request.flags = 2;
            func_02022d54(&request);
            o->duration = 2;
            o->counter = 1;
            func_0202838c(o);
            o->duration = 0;
            o->counter = 0;
        }
    }
    return 1;
}

