typedef struct {
    void *data;
    char pad[0x10];
    unsigned short kind:4;
    unsigned short enabled:1;
    unsigned short:11;
    unsigned short pad16;
    unsigned int:14;
    unsigned int mode:3;
    unsigned int:15;
    unsigned int a:8;
    unsigned int b:8;
    char tail[8];
} Obj;
extern void *data_ov015_021b5bb0[];
extern void *func_02006c0c(void *, int, int);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
void func_ov015_021b2df8(unsigned int kind, int flag, unsigned int resource) {
    Obj obj;
    void *p;
    int index;
    switch (resource) {
    case 1: index = 1; break;
    case 2: index = 2; break;
    case 3: index = 3; break;
    case 4: index = 4; break;
    case 5: index = 5; break;
    default: index = 0; break;
    }
    p = func_02006c0c(data_ov015_021b5bb0[index], 4, 0);
    func_0201d47c(&obj);
    switch (kind) {
    case 0: obj.kind = 0; obj.mode = flag == 0 ? 0 : 2; break;
    case 1: obj.kind = 1; obj.mode = flag == 0 ? 1 : 3; break;
    case 2: obj.kind = 2; obj.mode = 2; break;
    case 3: obj.kind = 3; obj.mode = 3; break;
    case 4: obj.kind = 5; obj.mode = flag == 0 ? 0 : 2; break;
    case 5: obj.kind = 6; obj.mode = flag == 0 ? 1 : 3; break;
    case 6: obj.kind = 7; obj.mode = 2; break;
    case 7: obj.kind = 8; obj.mode = 3; break;
    }
    obj.data = p;
    obj.enabled = 1;
    func_0201e5b8(&obj);
    Task_Invoke(p);
}
