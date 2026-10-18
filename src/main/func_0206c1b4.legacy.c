typedef struct {
    unsigned short f0;
    unsigned char f2;
    unsigned char f3;
} Arg2Struct0206c110;
extern void *func_0206c110(void *arg0, void *arg1, Arg2Struct0206c110 *arg2);
extern int func_0206c188(int a0, int *a1, int a2);
extern char *data_0219ece8;

char *func_0206c1b4(char *obj, char *desc) {
    char *cursor = obj + 0x80;
    char *block;
    obj[0x73] = *(signed char *)desc;
    obj[0x72] = *(signed char *)(desc + 1);
    if (*(unsigned short *)(desc + 2)) {
        *(char **)(obj + 0x64) = cursor;
        *(unsigned short *)(cursor + 0xfc) = *(unsigned short *)(desc + 4);
        block = cursor;
        cursor = func_0206c110(cursor + 0x114, cursor, (Arg2Struct0206c110 *)(desc + 0x10));
        cursor = (char *)func_0206c188((int)cursor, (int *)(obj + 0x3c), *(unsigned short *)(desc + 2));
        cursor = (char *)func_0206c188((int)cursor, (int *)(obj + 0x50), *(unsigned short *)(desc + 8));
        *(unsigned short *)(block + 0x10a) = *(unsigned short *)(desc + 0xe);
        *(int *)(block + 0x110) = 0;
        *(int *)(block + 0x10c) = *(int *)(block + 0x110);
    }
    if (*(unsigned short *)(desc + 6) == 0) {
        *(int *)(obj + 0x68) = *(int *)(data_0219ece8 + 0x68);
    } else {
        *(char **)(obj + 0x68) = cursor;
        *(char **)(cursor + 0x10c) = obj;
        block = cursor;
        cursor = func_0206c110(cursor + 0x110, cursor, (Arg2Struct0206c110 *)(desc + 0x14));
        cursor = (char *)func_0206c188((int)cursor, (int *)(obj + 0x48), *(unsigned short *)(desc + 6));
        cursor = (char *)func_0206c188((int)cursor, (int *)(obj + 0x58), *(unsigned short *)(desc + 0xa));
        cursor = (char *)func_0206c188((int)cursor, (int *)(block + 0xf8), *(unsigned short *)(desc + 0xc));
        *(int *)(block + 0x108) = 0;
        *(int *)(block + 0x104) = *(int *)(block + 0x108);
    }
    return cursor;
}
