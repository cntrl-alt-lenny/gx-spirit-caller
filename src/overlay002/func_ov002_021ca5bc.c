extern int func_ov002_021ca51c(int arg0);
extern int func_0202e234(int id);
extern char data_ov002_022d0250[];

struct Ov002Slot0250 { unsigned short id : 13; unsigned short _pad : 3; };

int func_ov002_021ca5bc(int arg0) {
    int flags = func_ov002_021ca51c(arg0);

    if (flags & 1) {
        return 0;
    }
    if (flags & 2) {
        struct Ov002Slot0250 *p = (struct Ov002Slot0250 *)(data_ov002_022d0250 + arg0 * 4);
        int id = p->id;
        if (func_0202e234(id) != 0) {
            return 0;
        }
    }
    if (flags & 4) {
        if ((arg0 & 1) == 0) {
            return 0;
        }
    }
    if (flags & 8) {
        if ((arg0 & 1) == 1) {
            return 0;
        }
    }
    return 1;
}
