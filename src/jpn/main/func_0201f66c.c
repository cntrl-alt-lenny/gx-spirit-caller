typedef struct {
    char _pad_38[0x38];
    void (*field_38)(void *);
} Struct02191f40;

extern int data_02192200;
extern Struct02191f40 data_02191e60;
extern char data_020c6498[];

extern int func_020a0504(void *p);
extern void func_0201f148(int arg);
extern int func_0201f6d0(void);
extern int func_02020b30(void);

int func_0201f66c(void) {
    int v = func_020a0504(&data_02192200);
    if (v != 0) {
        func_0201f148(v);
        return 0;
    }

    if (func_0201f6d0() == 0) {
        if (data_02191e60.field_38) {
            data_02191e60.field_38(data_020c6498);
        }
        func_02020b30();
        return 0;
    }

    return 1;
}
