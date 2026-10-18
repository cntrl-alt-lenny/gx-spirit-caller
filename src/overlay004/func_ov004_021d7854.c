typedef struct {
    unsigned int count0;
    unsigned int count1;
    unsigned int count2;
    unsigned short list0[0x50];
    unsigned short list1[0x0f];
    unsigned short list2[0x20];
} Entries;
extern Entries data_02105a68;
extern unsigned short func_0202b9b0(unsigned short key);
int func_ov004_021d7854(void) {
    Entries *p = &data_02105a68;
    unsigned int i;
    for (i = 0; i < p->count0; i++) {
        if (func_0202b9b0(p->list0[i]) == 0) return 1;
    }
    for (i = 0; i < p->count2; i++) {
        if (func_0202b9b0(p->list2[i]) == 0) return 1;
    }
    for (i = 0; i < p->count1; i++) {
        if (func_0202b9b0(p->list1[i]) == 0) return 1;
    }
    return 0;
}