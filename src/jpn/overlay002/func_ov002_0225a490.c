#include "ov002_core.h"

extern char data_ov002_022d0170[];
extern int  func_ov002_021bf1b4(int a, int b, int c, int d, int e);

typedef struct {
    int header0;
    int header4;
    int computedArr[5];
    int tableArr[5];
    int resultArr[5];
} OutSelf;

void func_ov002_0225a490(void *selfPtr) {
    OutSelf *self = selfPtr;
    int i;
    unsigned int rowVal;
    unsigned int computed;
    unsigned int tableVal;
    unsigned char *row;

    row = data_ov002_022cf08c + (*(int *)(data_ov002_022cd314) & 1) * 0x868 + 0x30;
    row = row + *(int *)(data_ov002_022cd314 + 0x1c) * 20;
    rowVal = *(unsigned int *)row;
    computed = ((rowVal << 2) >> 24) * 2 + ((rowVal << 18) >> 31);
    self->header0 = computed;
    tableVal = *(unsigned short *)(data_ov002_022d0170 + computed * 4);
    self->header4 = (tableVal << 17) >> 30;

    for (i = 0; i < 5; i++) {
        row = data_ov002_022cf08c + (*(int *)(data_ov002_022cd314 + 0x4) & 1) * 0x868 + 0x30;
        row = row + i * 20;
        rowVal = *(unsigned int *)row;
        computed = ((rowVal << 2) >> 24) * 2 + ((rowVal << 18) >> 31);
        self->computedArr[i] = computed;
        tableVal = *(unsigned short *)(data_ov002_022d0170 + computed * 4);
        self->tableArr[i] = (tableVal << 17) >> 30;
        self->resultArr[i] = func_ov002_021bf1b4(
            *(int *)(data_ov002_022cd314), *(int *)(data_ov002_022cd314 + 0x1c),
            *(int *)(data_ov002_022cd314 + 0x4), i, 0);
    }
}
