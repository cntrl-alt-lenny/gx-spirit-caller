typedef struct {
    void *task;
    int pad04[2];
    int y;
    int pad10;
    unsigned short mode : 4;
    unsigned short enabled : 1;
    unsigned short rest : 11;
    unsigned short pad16;
    unsigned int low : 14;
    unsigned int priority : 3;
    unsigned int high : 15;
    unsigned int a : 8;
    unsigned int b : 8;
    unsigned int spare : 16;
    int tail[2];
} Obj;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_02006c0c(void *name, int heap, int flags);
extern void Task_Invoke(void *p);
extern int OS_SPrintf(signed char *buffer, const signed char *format, ...);
typedef struct { unsigned short id; char pad[0x32]; } Entry;
extern Entry data_ov008_021b2790[];
typedef struct { char pad[0x34]; int mode; } State;
extern State data_021040ac;
extern const signed char data_ov008_021b26ac[];
extern const signed char data_ov008_021b26c4[];
void func_ov008_021aefd4(int index, int slot) {
    Obj obj;
    signed char name[0x20];
    if (data_021040ac.mode == 0) {
        OS_SPrintf(name, data_ov008_021b26ac, data_ov008_021b2790[index].id);
    } else {
        OS_SPrintf(name, data_ov008_021b26c4, data_ov008_021b2790[index].id);
    }
    func_0201d47c(&obj);
    obj.task = func_02006c0c(name, 4, 0);
    obj.mode = 9;
    obj.y = ((slot * 12) + 0x2ab) << 7;
    obj.enabled = 1;
    obj.priority = 7;
    func_0201e5b8(&obj);
    Task_Invoke(obj.task);
}

