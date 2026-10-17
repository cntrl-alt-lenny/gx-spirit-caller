typedef struct Vt {
    int pad[2];
    int (*fn)(int, int, int);
} Vt;

extern char data_ov002_022ce288[];
extern Vt *func_ov002_02257464(void);

int func_ov002_02257a44(int a)
{
    int count = 0;
    Vt *vt;
    int i;
    int j;

    vt = func_ov002_02257464();
    i = count;
    *(int *)(data_ov002_022ce288 + 0x5c0) = i;
    if (vt != 0 && vt->fn != 0) {
        do {
            for (j = 5; j <= 10; j++) {
                if (vt->fn(a, i, j) != 0) {
                    count++;
                }
            }
            i++;
        } while (i < 2);
    }
    return count;
}
