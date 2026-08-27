typedef struct {
    char _pad_00[0x8];
    int field_8;
    char _pad_0c[0x10 - 0xc];
    unsigned int field_10;
} Obj_0201bd30;

extern char *GetSystemWork(void);
extern int func_02013990(void);
extern int func_020190b8(void);
extern int func_0201908c(void);
extern unsigned int func_0201b7a0(void *obj);

int func_0201bcf0(Obj_0201bd30 *obj) {
    char *sw = GetSystemWork();

    if (!(obj->field_8 == 0 && *(int *)(sw + 0x918) == 0)) {
        goto done;
    }
    if (func_02013990() != 0) {
        goto done;
    }
    if (func_020190b8() == 0) {
        goto done;
    }

    if (func_0201b7a0(obj) != 5) {
        if (func_0201b7a0(obj) != 4) {
            goto done;
        }
    }

    if (func_0201908c() == 1) {
        if (func_0201b7a0(obj) == 4) {
            obj->field_10 |= 0x20000;
        } else {
            obj->field_10 |= 0x10000;
        }
    } else {
        if (func_0201b7a0(obj) == 4) {
            obj->field_10 |= 0x8000;
        } else {
            obj->field_10 |= 0x4000;
        }
    }

done:
    return 0;
}
