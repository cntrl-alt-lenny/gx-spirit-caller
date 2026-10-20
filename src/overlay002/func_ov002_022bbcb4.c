typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; volatile unsigned short flag:1; volatile unsigned short high:1; } Selection;
typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short flag:1; unsigned short high:1; } PlainSelection;
typedef struct { int active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern char data_ov002_022cd000[];
extern char data_ov002_022cd07c[];
extern int func_ov002_022b867c(char *self, int index, int type, int sub, void *out);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, void *arg);
extern int func_020a978c(char *dest, const char *format, ...);
int func_ov002_022bbcb4(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Pair *array = data_ov002_022d28fc;


        int flags = (((Selection *)(self + 0xc6a))->high ? 1 : 0)
                  | (((Selection *)(self + 0xc6a))->flag ? 2 : 0)
                  | (((Selection *)(self + 0xc6a))->type == 11 ? 4 : 0)
                  | (((PlainSelection *)(self + 0xc6c))->high ? 16 : 0)
                  | (((Selection *)(self + 0xc6c))->flag ? 32 : 0)
                  | (((volatile Selection *)(self + 0xc6c))->type == 11 ? 64 : 0);
        if (((Selection *)(self + 0xc6a))->type == 11)
            *(int *)(self + 0xc90) += 29;

        func_ov002_022b867c(self, ((Selection *)(self + 0xc6c))->index, ((Selection *)(self + 0xc6c))->type, ((Selection *)(self + 0xc6c))->sub, self + 0xc98);
        if (((Selection *)(self + 0xc6c))->type == 11)
            *(int *)(self + 0xc9c) += 29;
        else
            *(int *)(self + 0xc9c) += 2;
        func_ov002_022bdb88(array, 0x49, flags, self + 0xc8c, self + 0xc98);
        func_020a978c(self + 0xa8c, data_ov002_022cd000, *(int *)(self + 0xc5c));
        func_020a978c(self + 0xab4, data_ov002_022cd07c);
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
    }
    case 1:
    case 2:
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}








