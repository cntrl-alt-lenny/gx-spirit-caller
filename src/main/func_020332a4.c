typedef struct {
    char           _pad[0xc];
    unsigned short name[0x1a];
} info_020332a4_t;

typedef struct {
    char            _pad[0xc00];
    info_020332a4_t info;
} sub_020332a4_t;

typedef struct {
    char           _pad[0x1fc];
    sub_020332a4_t sub;
} obj_020332a4_t;

extern void func_020945f4(void *p, int v, int size);

void func_020332a4(obj_020332a4_t *o, const unsigned short *src) {
    info_020332a4_t *info = &o->sub.info;
    int i;

    func_020945f4(info->name, 0, sizeof(info->name));
    for (i = 0; i < 0x1a; i++) {
        if (src[i] == 0) {
            info->name[i] = 0;
            break;
        }
        info->name[i] = src[i];
    }
    info->name[0x19] = 0;
}
