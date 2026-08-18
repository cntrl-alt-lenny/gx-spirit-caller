typedef struct {
    char _pad_00[0x8];
    int field_8;
    char _pad_0c[0x10 - 0xc];
    unsigned int field_10;
} Obj_0201bd30;

extern char *GetSystemWork(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020190c0(void);
extern unsigned int func_0201b7e0(void *obj);

int func_0201bd30(Obj_0201bd30 *obj) {
    char *sw = GetSystemWork();

    if (!(obj->field_8 == 0 && *(int *)(sw + 0x918) == 0)) {
        goto done;
    }
    if (func_020139c4() != 0) {
        goto done;
    }
    if (func_020190ec() == 0) {
        goto done;
    }

    if (func_0201b7e0(obj) != 5) {
        if (func_0201b7e0(obj) != 4) {
            goto done;
        }
    }

    if (func_020190c0() == 1) {
        if (func_0201b7e0(obj) == 4) {
            obj->field_10 |= 0x20000;
        } else {
            obj->field_10 |= 0x10000;
        }
    } else {
        if (func_0201b7e0(obj) == 4) {
            obj->field_10 |= 0x8000;
        } else {
            obj->field_10 |= 0x4000;
        }
    }

done:
    return 0;
}
