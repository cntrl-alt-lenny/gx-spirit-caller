typedef unsigned long long u64;
typedef struct {
    char *buffer;
    int x4, x8;
    int offset;
    int x10;
    int length;
    int x18;
    unsigned char active;
    char pad1d[7];
    u64 tick;
    unsigned int interval;
} Rec;
typedef struct {
    char pad[0x600];
    void (*complete)(int, int);
    int x604;
    void (*timer)(int);
    int x60c;
    unsigned short chunk;
} Context;
extern Context *data_0219e3ec;
extern int func_020469d0(int a0);
extern int func_02046a5c(unsigned char **out);
extern int func_02046ac4(void);
extern int func_02051f1c(int unused0);
/* The wrapper names its first argument void *self; this caller passes a byte slot ID. */
extern void func_0205230c(int self, int a, int b, int c);
extern unsigned char func_02052350(int idx);
extern void *func_0205236c(int idx);
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64, u64);
void func_02052424(void) {
    unsigned char *list;
    int count;
    int i;
    int id;
    Rec *rec;
    u64 now;
    int size;
    if (data_0219e3ec == 0) return;
    count = func_02046a5c(&list);
    for (i = 0; i < count; i++) {
        id = list[i];
        if (func_020469d0(id)) {
            rec = func_0205236c(id);
            if (data_0219e3ec->timer && rec->interval) {
                now = func_020930b0();
                if ((unsigned int)func_020b3808((now - rec->tick) << 6, 0x82ea) > rec->interval) {
                    data_0219e3ec->timer(id);
                    rec->tick = now;
                }
            }
        }
        if (id != func_02046ac4() && func_02052350(id) == 1) {
            rec = func_0205236c(id);
            size = data_0219e3ec->chunk;
            if (rec->length - rec->offset <= size) size = rec->length - rec->offset;
            if (func_02051f1c(id) >= size) {
                func_0205230c(id, (int)(rec->buffer + rec->offset), size, 1);
                rec->offset += size;
                int length = rec->length;
                if (rec->offset == length) {
                    rec->active = 0;
                    rec->buffer = 0;
                    rec->offset = 0;
                    rec->length = 0;
                    if (data_0219e3ec->complete) data_0219e3ec->complete(length, id);
                }
            }
        }
    }
}


