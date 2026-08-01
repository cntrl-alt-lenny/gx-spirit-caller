typedef struct {
    char pad[0x1c];
    unsigned int f1c;
    unsigned int f20;
    unsigned int f24;
} Self021b7f6c;

extern int func_ov006_021b7140(void *self, int arg1, int arg2, int fieldval, int flag);

int func_ov006_021b7e6c(void *self) {
    Self021b7f6c *s = (Self021b7f6c *)self;
    unsigned int i;

    for (i = 0; i < s->f1c; i++) {
        unsigned short v = ((unsigned short *)((char *)self + 0x28))[i];
        func_ov006_021b7140(self, 0, -1, v, 1);
    }
    for (i = 0; i < s->f20; i++) {
        unsigned short v = ((unsigned short *)((char *)self + 0xc8))[i];
        func_ov006_021b7140(self, 0, -1, v, 1);
    }
    for (i = 0; i < s->f24; i++) {
        unsigned short v = ((unsigned short *)((char *)self + 0xe6))[i];
        func_ov006_021b7140(self, 0, -1, v, 1);
    }

    return 1;
}
