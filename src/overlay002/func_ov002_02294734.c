typedef struct {
    unsigned short pad0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} Self_t;

typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Entry_t;

extern int func_ov002_02280980(int a);
extern int func_ov002_0227c678(int a, int b, int c);
extern int func_ov002_022815a4(int a, int b);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];

int func_ov002_02294734(Self_t *self) {
    unsigned int i;
    unsigned int cnt;
    unsigned int b;
    unsigned int p;
    int off;
    if (func_ov002_02280980(self->bit0) >= 0) {
        return 0;
    }
    b = self->bit0;
    p = b & 1;
    off = p * 0x868;
    cnt = *(unsigned int *)(data_ov002_022cf178 + off);
    if (cnt <= 3) {
        return 0;
    }
    i = 0;
    if (i < cnt) {
        do {
            unsigned int id = ((Entry_t *)(data_ov002_022cf16c + off + 0x120 + i * 4))->id;
            if (func_ov002_0227c678(b, 1, (unsigned short)id) != 0) {
                return 0;
            }
            if (func_ov002_022815a4(id, 0) != 0) {
                return 0;
            }
            i++;
            b = self->bit0;
            p = b & 1;
            off = p * 0x868;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + off + 0xc));
    }
    return 1;
}
