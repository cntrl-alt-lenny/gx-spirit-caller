typedef struct {
    char pad0[0x68];
    void *owner;
    char pad6c[4];
    volatile short flags;
    char pad72;
    signed char mode;
} Socket;

typedef struct {
    void *field_0;
    void *field_4;
    void *field_8;
    signed char field_c;
    unsigned char field_d;
} Obj_0206bf94_t;

extern int func_0206e474(int a0);
extern int func_0206e4a4(int param0);
extern int func_0206bef4(void *a, void *b);
extern Obj_0206bf94_t *func_0206bf94(void *a0, char *a1, int a2);
extern int func_0206bed8(int a, int b);
extern int func_0206ddc0(void *arg0);

int func_0206de68(Socket *self) {
    int valid;
    int special;
    Obj_0206bf94_t *result;
    if ((int)self <= 0) return -28;
    if (func_0206e474((int)self) != 0) return -26;
    if (func_0206e4a4((int)self) != 0) return 0;
    valid = 0;
    if (self != 0) valid = (self->flags & 1) != 0;
    if (valid == 0) return -39;
    if (self->flags & 0x10) return -26;
    self->flags |= 0x18;
    special = 1;
    if (self->mode != 0) {
        if (self->mode != 4) special = 0;
    }
    if (special != 0) func_0206bef4(self->owner, 0);
    result = func_0206bf94((void *)func_0206ddc0, (char *)self, 1);
    result->field_8 = 0;
    func_0206bed8((int)self, (int)result);
    return 0;
}

