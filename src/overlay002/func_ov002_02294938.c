typedef struct {
    unsigned short id;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} Self_t;

extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_02259f74(int x);
extern int func_ov002_021bae7c(int player, int id, int except);

int func_ov002_02294938(Self_t *self) {
    int capacity;
    int count;
    count = func_ov002_022536e8(self->bit0, self->id, 0);
    capacity = func_ov002_021bc618(self->bit0);
    if (func_ov002_02259f74(self->bit0) == 0) {
        return 0;
    }
    if (func_ov002_021bae7c(self->bit0, 0x17a3, -1) != 0) {
        if (func_ov002_021bae7c(1 - self->bit0, 0x1398, -1) != 0) {
            return 0;
        }
    }
    if (count >= capacity) {
        count = capacity;
    }
    return count >= 2;
}

