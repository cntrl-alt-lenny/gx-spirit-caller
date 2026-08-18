typedef struct {
    char _pad_38[0x38];
    void (*field_38)(void *);
} Struct02191f40;

extern int data_021922e0;
extern Struct02191f40 data_02191f40;
extern char data_020c6578[];

extern int func_020a05f8(void *p);
extern void func_0201f19c(int arg);
extern int func_0201f724(void);
extern int func_02020b84(void);

int func_0201f6c0(void) {
    int v = func_020a05f8(&data_021922e0);
    if (v != 0) {
        func_0201f19c(v);
        return 0;
    }

    if (func_0201f724() == 0) {
        if (data_02191f40.field_38) {
            data_02191f40.field_38(data_020c6578);
        }
        func_02020b84();
        return 0;
    }

    return 1;
}
