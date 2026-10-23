typedef struct {
    int resource;
    int unk4;
    int minus_one;
    int x;
    short y;
    short unk12;
    unsigned short mode : 4;
    unsigned short rest : 12;
    char pad16[6];
    unsigned int a : 8;
    unsigned int b : 8;
    char pad20[8];
} Obj;
typedef struct { int unk0; unsigned int mode : 3; unsigned int rest : 29; } State;
typedef struct { int unk0; unsigned char flag; char pad[15]; } Entry;
extern State data_02104f4c;
extern Entry data_ov006_021ce650[], data_ov006_021ce8a8[];
extern char data_ov006_021cebc8[], data_ov006_021cebe0[];
extern void Task_InvokeLocked(void *p);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_Invoke(void *p);
extern int func_02006c0c(void *p, int a, int b);
extern int func_0201d47c(Obj *o);
extern int func_0201d6f8(int arg);
extern int func_0201e5b8(Obj *o);
extern void func_020944a4(int unused0, int unused1, int unused2);
int func_ov006_021c8e98(int *obj) {
    Entry *entry;
    int resource;
    Obj desc;
    entry = &(data_02104f4c.mode == 0 ? data_ov006_021ce650 : data_ov006_021ce8a8)[obj[29]];
    if (obj[14] != 0) {
        Task_InvokeLocked((void *)obj[14]);
        obj[14] = 0;
    }
    obj[14] = Task_PostLocked((void *)0x480, 4, 0);
    if (entry->flag == 0)
        resource = func_02006c0c(data_ov006_021cebc8, 4, 0);
    else
        resource = func_02006c0c(data_ov006_021cebe0, 4, 0);
    func_0201d47c(&desc);
    desc.resource = resource;
    desc.mode = 6;
    desc.minus_one = -1;
    desc.x = obj[15] << 5;
    desc.y = obj[16] << 5;
    func_0201e5b8(&desc);
    func_020944a4(func_0201d6f8(resource), obj[14], 0x480);
    Task_Invoke((void *)resource);
    return 1;
}



