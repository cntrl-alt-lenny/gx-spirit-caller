typedef struct { unsigned short id:13; unsigned short rest:3; unsigned short other; } Entry;
typedef struct {
    char pad[0xf8];
    unsigned int id:13;
    unsigned int rest:19;
    int unused;
    unsigned short active;
    char pad2[6];
    unsigned int flags;
} Slot;
extern Entry data_ov002_022d0250[];
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021b422c(int arg0, int arg1);
extern int func_ov002_021b9128(int a, int b);
extern int func_ov002_021bd6c8(int arg0);
extern int func_ov002_021b3e28(int arg0, int arg1, int arg2);
int func_ov002_021c38c4(int side, int index) {
    int i;
    int temp;
    int value;
    int id;
    Slot *slot;
    id = data_ov002_022d0250[index].id;
    value = func_0202b8a8(id);
    if (value == 0) return 0;
    temp = func_ov002_021b422c(index, 0x18d9);
    if (temp > 0) value = temp;
    if (func_ov002_021b9128(id, 3) != 0) {
        i = 0;
        do {
            slot = (Slot *)(data_ov002_022cf16c + (i & 1) * 0x868);
            if (slot->id == 0x150b && (slot->active & ~((slot->flags >> 6) & 1) & ~(((slot->flags >> 1) | (slot->flags >> 2)) & 1)) != 0) {
                if (func_ov002_021bd6c8(slot->id) != 0) {
                    value--;
                    if (value < 1) value = 1;
                }
            }
        } while (++i < 2);
    }
    temp = func_ov002_021b3e28(side, 0xb, 0x15c7);
    if (temp != 0) {
        value -= temp * 2;
        if (value < 1) value = 1;
    }
    return value;
}




