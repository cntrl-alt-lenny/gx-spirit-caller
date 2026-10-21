typedef struct { int type, id, mode; } Query;
typedef struct { char pad[12]; void *data; } Palette;
typedef struct {
    char pad0[0x68];
    signed char *name;
    int source;
    char pad70[8];
    unsigned char kind;
    char pad79[0x188-0x79];
    void *buffer;
    char pad18c[6];
    short start, count, step;
    char pad198[2];
    unsigned short b0:1, b1:1, b2:1, b3:1, active:1;
} Obj;
/* The assembly memory helpers consume three argument registers. */
extern void Copy32(const void *src, void *dst, unsigned int size);
extern void Fill32(unsigned int value, void *dst, unsigned int size);
extern void Task_InvokeLocked(void *p);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern int func_02006c0c(signed char *, int, int);
extern int func_02007104(signed char *, const char *);
extern int func_0201d760(int arg);
extern int func_0201ede4(int arg0, int arg1);
extern int func_02022d54(Query *q);
extern int func_02029f74(Obj *o);
extern int func_0202be4c(int);
extern char data_020c6958[];
int func_02029d40(Obj *o, int start, int count) {
    Palette *pal;
    Query q;
    o->active = 0;
    if (count < 0) {
        if (o->buffer != 0) {
            Task_InvokeLocked(o->buffer);
            o->buffer = 0;
        }
    } else {
        if (o->buffer == 0) {
            int size;
            int handle;
            if (o->b2) {
                size = (*(unsigned char *)&o->source == 1 ? 0x100 : 0x10) * 2;
                o->buffer = (void *)Task_PostLocked((void *)size, 4, 0);
                Fill32(0, o->buffer, size);
                if (func_02007104(o->name, data_020c6958) >= 0) {
                    handle = func_0202be4c((o->name[11]-0x30) + ((o->name[10]-0x30)*10 + ((o->name[8]-0x30)*1000 + (o->name[9]-0x30)*100)));
                } else {
                    handle = func_02006c0c(o->name, 4, 0);
                }
                { void *dst = o->buffer; int src = func_0201d760(handle); Copy32((void *)src, dst, size); }
                Task_InvokeLocked((void *)handle);
            } else {
                size = (o->kind == 1 ? 0x100 : 0x10) * 2;
                o->buffer = (void *)Task_PostLocked((void *)size, 4, 0);
                Fill32(0, o->buffer, size);
                handle = func_0201ede4((int)&pal, o->source);
                Copy32(pal->data, o->buffer, size);
                Task_InvokeLocked((void *)handle);
            }
        }
        o->start = start;
        o->count = count;
        o->step = 0;
        o->active = (unsigned short)(count != 0);
        if (count == 0 && o->buffer != 0) {
            q.type = 0;
            q.id = (int)o;
            q.mode = 2;
            func_02022d54(&q);
            o->count = 2;
            o->step = 1;
            func_02029f74(o);
            o->count = 0;
            o->step = 0;
        }
    }
    return 1;
}



