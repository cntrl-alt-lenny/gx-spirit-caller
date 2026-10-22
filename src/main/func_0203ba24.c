typedef struct {
    char pad[0xba];
    short count;
} Obj;
typedef struct {
    int link[2];
    unsigned int owner;
    int x;
    int y;
    int value;
} Record;
typedef struct {
    char pad[0x64];
    unsigned int flag;
} ctx_020919d8_t;
extern char data_0219d070[];
extern ctx_020919d8_t data_0219d088;
extern int func_0203c13c(void);
extern void func_0207d12c(char *r0, char *r1);
extern void func_020919d8(ctx_020919d8_t *ctx);

typedef struct { Obj *owner; } OwnerArg;
void func_0203ba24(int active, int unused, int *pos, int value, int arg4, OwnerArg ownerArg) {
    Record *rec;
    unsigned int owner;
    if (active != 0) {
    owner = (unsigned int)ownerArg.owner;
    if (((Obj *)owner)->count >= 3) {
        func_020919d8(&data_0219d088);
        return;
    }
    rec = (Record *)func_0203c13c();
    if (rec != 0) {
        rec->owner = (Obj *)owner;
        rec->x = pos[0];
        rec->y = pos[1];
        rec->value = value;
        ((Obj *)owner)->count++;
        func_0207d12c(data_0219d070, (char *)rec);
    }
    func_020919d8(&data_0219d088);
}
}



