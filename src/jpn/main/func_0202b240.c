typedef struct {
    int unused;
    int frame;
} Record_0219a93c;

typedef struct {
    char _pad_00[0x8];
    Record_0219a93c *table;
} P0_0219a93c;

typedef struct {
    P0_0219a93c *p0;
} Struct0219a93c;

extern Struct0219a93c data_0219a85c;
extern char data_020c696c[];
extern char data_0219a868[];

extern unsigned short func_0202b060(int id);
extern void func_02098294(void *obj);
extern int func_0202b0d8(void *obj, void *a1);
extern int func_02097db0(void *obj, int val, int mode);
extern int func_0209281c(void *a, int b);
extern int func_02038a84(void *a, void *b, int c);
extern int func_02097efc(void *obj);

void *func_0202b240(int cardId) {
    char localbuf[0x48];
    int id = func_0202b060(cardId);
    Record_0219a93c *rec = &data_0219a85c.p0->table[id];
    int start = rec->frame;
    int duration = rec[1].frame - start;

    func_02098294(localbuf);
    func_0202b0d8(localbuf, data_020c696c);
    func_02097db0(localbuf, start, 0);
    func_0209281c(data_0219a868, 0x400);
    func_02038a84(localbuf, data_0219a868, duration);
    func_02097efc(localbuf);

    return data_0219a868;
}
