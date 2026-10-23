extern void Fill32(int value, void *dest, int size);
/* This caller supplies an allocation size as the first argument. */
extern int Task_PostLocked(int size, int type, int flags);
extern unsigned int func_0202b0e0(int id);
extern int func_0202e2f8(int unused0);
extern int func_0202bb20(int a);
extern char data_ov021_0222cf44[];
extern char data_021040ac[];
extern int data_020b4768;
int func_ov021_021aaf5c(void *o) {
    int i, id;
    int limit;
    Fill32(0, data_ov021_0222cf44, 0x19c);
    *(int *)((char *)o + 0x38) = 0;
    *(int *)((char *)o + 0x40) = 0;
    *(int *)((char *)o + 0x44) = 0;
    *(int *)((char *)o + 0x48) = 0;
    *(int *)((char *)o + 0x4c) = 0;
    *(int *)((char *)o + 0x54) = (unsigned short)*(int *)(data_021040ac + 0x38);
    *(int *)((char *)o + 0x58) = Task_PostLocked(0x1130, 4, 0);
    limit = data_020b4768 - 1;
    i = 0;
    *(int *)((char *)o + 0x5c) = 0;
    do {
        id = func_0202b0e0(i + 1);
        if (!func_0202e2f8(id) && id != 0x1386 && id != 0x1387 && id != 0x1388 && func_0202bb20(id)) {
            ((int *)*(int *)((char *)o + 0x58))[(*(int *)((char *)o + 0x5c))++] = id;
            if (*(int *)((char *)o + 0x5c) >= 0x44c) break;
        }
        i++;
    } while (i < limit);
    return 1;
}

