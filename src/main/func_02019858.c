typedef struct {
    signed char field0;
    signed char field1;
    signed char field2;
    signed char field3;
    signed char field4;
    signed char field5;
    signed char field6;
} CharParam;

extern const CharParam data_020b5b80[];
extern void *GetSystemWork(void);
extern int func_02019604(int id);
extern int func_0201a170(int v);

int func_02019858(int id) {
    const CharParam *p = &data_020b5b80[id];
    int a;

    GetSystemWork();
    a = func_02019604(id);
    return p->field4 + a * 2 + func_0201a170(8);
}
