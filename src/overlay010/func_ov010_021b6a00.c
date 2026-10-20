typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
extern int func_ov005_021ab3a0(void *obj, int idx);
extern int func_ov005_021ab3b4(void *obj, int idx);
extern int func_ov005_021ab260(void *obj, int idx);
extern unsigned short func_ov005_021ab384(state_hw_t *p, int idx, unsigned int mask);
extern char data_ov010_021b9884[];
extern char data_ov010_021b9890[];
extern unsigned int data_02106804[];
char *func_ov010_021b6a00(int arg0, int *arg1, int *arg2) {
    char *m = data_ov010_021b9890;
    int kind = func_ov005_021ab3a0(*(void **)(data_ov010_021b9884 + 144), arg0);
    int index = func_ov005_021ab3b4(*(void **)(data_ov010_021b9884 + 144), arg0);
    int id = (unsigned short)func_ov005_021ab3b4(*(void **)(data_ov010_021b9884 + 144), arg0);
    char *result, *base;
    int offset;
    if (kind != 0) {
        result = *(char **)(m + 836) + *(int *)(m + (kind - 2020) * 4 + 528);
    } else {
        result = *(char **)(m + 852) + *(int *)(m + index * 4 + 840);
    }
    if (arg1 != 0) {
        if (func_ov005_021ab384(*(state_hw_t **)(m + 132), arg0, 8) != 0)
            *arg1 = 4;
        else
            *arg1 = 0x3fff;
    }
    if (arg2 != 0) {
        if (func_ov005_021ab260(*(void **)(m + 132), arg0) == 0) {
            if (func_ov005_021ab384(*(state_hw_t **)(m + 132), arg0, 8) == 0) {
                int bit = 1;
                if (!(data_02106804[id >> 5] & (1U << (id & 31)))) bit = 0;
                if (bit == 1) *arg2 = 2;
                else *arg2 = 3;
            } else *arg2 = 0x3fff;
        } else {
            if (func_ov005_021ab384(*(state_hw_t **)(m + 132), arg0, 2) != 0) *arg2 = 0;
            else *arg2 = 1;
        }
    }
    return result;
}




