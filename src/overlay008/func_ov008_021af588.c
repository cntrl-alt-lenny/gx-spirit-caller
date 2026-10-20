typedef struct { unsigned short id; char pad[50]; } Entry;
extern Entry data_ov008_021b2790[];
extern unsigned int func_0202b6b4(int id);
extern int func_0202b6e4(int val, int *out, int max);
extern int func_0202bb20(int a);
int func_ov008_021af588(int index, int *out, int flags) {
    int list[60];
    int count = 0;
    int i;
    func_0202b6e4(data_ov008_021b2790[index].id, list, 60);
    for (i = 0; i < 60; i++) {
        if (list[i] == 0) break;
        switch (func_0202b6b4(list[i])) {
        case 4:
            if (flags & 2) {
                if (flags & 16) {
                    if (func_0202bb20(list[i]) == 0) out[count++] = list[i];
                } else out[count++] = list[i];
            }
            break;
        case 3:
            if (flags & 4) {
                if (flags & 16) {
                    if (func_0202bb20(list[i]) == 0) out[count++] = list[i];
                } else out[count++] = list[i];
            }
            break;
        case 1:
        case 2:
            if (flags & 8) {
                if (flags & 16) {
                    if (func_0202bb20(list[i]) == 0) out[count++] = list[i];
                } else out[count++] = list[i];
            }
            break;
        default:
            if (flags & 1) {
                if (flags & 16) {
                    if (func_0202bb20(list[i]) == 0) out[count++] = list[i];
                } else out[count++] = list[i];
            }
            break;
        }
    }
    out[count] = 0;
    return count;
}
