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

extern Struct0219a93c data_0219a93c;
extern char data_020c6a4c[];
extern char data_0219a948[];

extern unsigned short func_0202b0b4(int id);
extern void func_02098388(void *obj);
extern int func_0202b12c(void *obj, void *a1);
extern int func_02097ea4(void *obj, int val, int mode);
extern int func_02092904(void *a, int b);
extern int func_02038ad4(void *a, void *b, int c);
extern int func_02097ff0(void *obj);

void *func_0202b294(int cardId) {
    char localbuf[0x48];
    int id = func_0202b0b4(cardId);
    Record_0219a93c *rec = &data_0219a93c.p0->table[id];
    int start = rec->frame;
    int duration = rec[1].frame - start;

    func_02098388(localbuf);
    func_0202b12c(localbuf, data_020c6a4c);
    func_02097ea4(localbuf, start, 0);
    func_02092904(data_0219a948, 0x400);
    func_02038ad4(localbuf, data_0219a948, duration);
    func_02097ff0(localbuf);

    return data_0219a948;
}
