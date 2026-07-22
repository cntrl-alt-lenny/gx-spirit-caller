typedef struct {
    char pad[0x24];
    long long field24_28;
    int field2c;
} Elem020526b8;

extern Elem020526b8 *data_0219e3ec;
extern long long func_020930b0(Elem020526b8 *, int);

int func_020526b8(int idx, int arg1) {
    Elem020526b8 *base = data_0219e3ec;
    Elem020526b8 *elem;
    long long result;
    if (base == 0) {
        return 0;
    }
    elem = &base[idx];
    elem->field2c = arg1;
    result = func_020930b0(elem, arg1);
    elem = &data_0219e3ec[idx];
    elem->field24_28 = result;
    return 1;
}
