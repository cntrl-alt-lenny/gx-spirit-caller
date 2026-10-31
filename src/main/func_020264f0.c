typedef struct { char pad[0x60]; unsigned int flags; } Obj;
typedef struct {
    void *task;
    void *tasks[3];
    Obj *object;
    short h14;
    unsigned char borrowed:1;
    unsigned char rest:7;
    unsigned char flags;
} Resources;
typedef struct {
    short id;
    unsigned char pad2;
    unsigned char active:1;
    unsigned char rest:7;
    char pad4[12];
} Entry;
typedef struct {
    char pad[0x94];
    Resources resources;
    char padac[0x54];
    Entry entries[6];
    char pad160[10];
    unsigned short active:1;
    unsigned short rest:15;
} Main;
extern void Task_Invoke(void *p);
extern int func_0200f01c(Obj *o);
extern int func_02022580(int arg0);
int func_020264f0(Main *o) {
    Resources *p = &o->resources;
    int i;
    if (p->object != 0) {
        func_0200f01c(p->object);
        p->object = 0;
    }
    if (p->task != 0 && !p->borrowed) {
        Task_Invoke(p->task);
        p->task = 0;
    }
    for (i = 0; i < 2; i++) {
        if (p->tasks[i] != 0 && !p->borrowed) {
            Task_Invoke(p->tasks[i]);
            p->tasks[i] = 0;
        }
    }
    for (i = 0; i < 6; i++) {
        if (o->entries[i].id >= 0) {
            func_02022580(o->entries[i].id);
            o->entries[i].id = -1;
            o->entries[i].active = 0;
        }
    }
    o->active = 0;
    return 1;
}
