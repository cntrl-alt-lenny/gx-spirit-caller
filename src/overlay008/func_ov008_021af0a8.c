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
extern void *func_0202be4c(int id);
extern void Task_Invoke(void *p);
typedef struct { char pad[0xc0]; unsigned short *ids; } State;
extern State data_ov008_021b2de4;
void func_ov008_021af0a8(int index, int slot) {
    Obj obj;
    int i = 0;
    unsigned short *ids = data_ov008_021b2de4.ids + index * 5;
    do {
        int id = ids[i];
        func_0201d47c(&obj);
        obj.task = func_0202be4c(id);
        obj.mode = 9;
        obj.y = (((slot * 5 + i) << 3) + 0x2f3) << 7;
        obj.enabled = 1;
        obj.priority = 7;
        func_0201e5b8(&obj);
        Task_Invoke(obj.task);
        i++;

    } while (i < 5);
}











