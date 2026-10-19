typedef struct {
    unsigned short field_0;
    unsigned short tag;
    unsigned short field_4;
    unsigned short field_6;
    unsigned short kind;
    unsigned short value;
} Event;

typedef struct {
    char pad0[4];
    unsigned short value;
    char pad1[0x32];
    void (*callback)(void *, ...);
} State;

extern State data_02191f40;
extern char data_020c66f4[];
extern char data_020c6708[];
extern char data_020c6728[];
extern char data_020c6744[];
extern int func_0201f11c(int i);
extern void func_0201f138(int index);
extern void func_0201f19c(int arg);
extern int func_0201ff2c(void);

void func_0201fdc4(Event *event) {
    if (event->tag != 0) {
        func_0201f19c(event->tag);
        if (event->tag == 12) {
            func_0201f138(9);
        } else if (event->tag == 11) {
            func_0201f138(9);
        } else if (event->tag == 1) {
            func_0201f138(8);
        } else {
            func_0201f138(9);
        }
        return;
    }
    if (event->kind == 8) return;
    if (event->kind == 7) {
        if (data_02191f40.callback != 0)
            data_02191f40.callback(data_020c66f4);
        func_0201f138(4);
        if (func_0201ff2c() == 0) {
            if (data_02191f40.callback != 0)
                data_02191f40.callback(data_020c6708);
            func_0201f138(3);
        } else {
            data_02191f40.value = event->value;
        }
        return;
    }
    if (event->kind == 6) return;
    if (event->kind == 9) {
        if (data_02191f40.callback != 0)
            data_02191f40.callback(data_020c6728);
        func_0201f19c(20);
        func_0201f138(9);
        return;
    }
    if (event->kind == 26) return;
    if (data_02191f40.callback != 0) {
        data_02191f40.callback(data_020c6744, event->kind, func_0201f11c(event->kind));
    }
    func_0201f138(9);
}
