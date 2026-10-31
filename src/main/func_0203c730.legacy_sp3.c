typedef struct {
    unsigned char name[6];
    unsigned short length;
    unsigned char pad[0xb8];
} Record;
typedef struct { unsigned char pad; unsigned char status; unsigned short rest; } Slot;
typedef struct {
    unsigned char pad[0x444];
    Slot slots[12];
    Record records[11];
    unsigned char pad2[0x59];
    unsigned char mode;
    unsigned char pad3[4];
    unsigned char count;
    unsigned char selected;
} State;
extern State *data_0219d9b8;
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);

int func_0203c730(void) {
    State *base;
    unsigned char *name;
    unsigned char i;
    unsigned int selected;
    unsigned int count;
    Record *names;
    base = data_0219d9b8;
    selected = base->selected;
    names = base->records;
    name = names[selected].name;
    if (base->mode >= 6) return 1;
    count = base->count;
    for (i = 0; i < count; i++) {
        if (i != selected && base->slots[i].status < 6) {
            if (func_020ab054(name, names[i].name, base->records[i].length) == 0) return 2;
        }
    }
    return 1;
}
