typedef struct {
    unsigned int count0;
    unsigned int count1;
    unsigned int count2;
    unsigned short list0[80];
    unsigned short list1[15];
    unsigned short list2[1];
} Entries;
extern unsigned short func_0202b9b0(unsigned short key);
extern Entries data_02105a68;

int func_ov004_021d7854(void) {
    Entries *base = &data_02105a68;
    unsigned int i;
    for (i = 0; i < base->count0; i++) {
        if (func_0202b9b0(base->list0[i]) == 0) return 1;
    }
    for (i = 0; i < base->count2; i++) {
        if (func_0202b9b0(base->list2[i]) == 0) return 1;
    }
    for (i = 0; i < base->count1; i++) {
        if (func_0202b9b0(base->list1[i]) == 0) return 1;
    }
    return 0;
}
