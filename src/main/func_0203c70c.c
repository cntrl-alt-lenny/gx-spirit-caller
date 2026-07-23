typedef struct {
    char pad[0xb0];
    unsigned short field;
} Obj0203c70c;

int func_0203c70c(Obj0203c70c *arg0) {
    if (arg0 == 0 || (arg0->field & 0x800) != 0) {
        return 1;
    }
    return 0;
}
