typedef struct {
    char pad_00[0x44];
    int field_44;
    char pad_48[0x04];
    int field_4c;
    char pad_50[0x0c];
    int field_5c;
    char pad_60[0x06];
    unsigned short field_66;
} Obj_02063ae0_t;
struct F020639a0 {
    char pad[144];
    int f144;
    int f148;
};
extern void func_020639a0(struct F020639a0 *self);
extern int func_020639c8(void *self);
extern int func_02063ae0(Obj_02063ae0_t *a, int b, int c, int d, int arg5, int *out);
extern int func_02063ca4(void *a0, int a1, int a2, int a3);
extern int func_0206429c(void *self, int value);
extern int func_020643ac(void *self);
extern int func_020643d8(int a, int unused1, int unused2, int d);
extern int func_02064480(int a, int b);
extern int func_020644a4(int data, int offset);

int func_02063854(Obj_02063ae0_t *self, int type, int data, int len) {
    int seq;
    int out;
    int value;
    if (len < 7) {
        return func_020643d8((int)self, type, data, len) != 0;
    }
    seq = func_020644a4(data, 3);
    value = func_020644a4(data, 5);
    if (func_0206429c(self, value) == 0) return 0;
    if (seq == self->field_66) {
        func_020639a0((struct F020639a0 *)self);
        if (func_02063ca4(self, type, data + 7, len - 7) == 0) return 0;
        return func_020639c8(self) != 0;
    }
    if (func_02064480(seq, self->field_66) < 0) {
        func_020639a0((struct F020639a0 *)self);
        return 1;
    }
    if (func_02063ae0(self, type, seq, data + 7, len - 7, &out) == 0) return 0;
    if (out != 0) {
        if (func_020643ac(self) == 0) return 0;
    }
    return 1;
}
