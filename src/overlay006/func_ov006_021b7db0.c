extern unsigned int func_0202b0e0(int id);
extern unsigned int func_0202b6cc(int id);
extern int func_0202bb20(int a);
extern int func_ov006_021b843c(void *self, int idx, int mode);
extern int data_020b4768;
typedef struct { unsigned short id; unsigned char flag; unsigned char pad; } Entry;
int func_ov006_021b7db0(char *self, int mode)
{
    int i;
    int count;
    int count2;
    int total;
    unsigned int id;
    int j;
    Entry *out;
    int accept;
    for (i = 0; i < 5; i++) func_ov006_021b843c(self, i, 0);
    total = data_020b4768;
    count = 0;
    count2 = 0;
    j = 1;
    if (j < total) {
    out = (Entry *)(self + 0x62a0);
    do {
        id = func_0202b0e0(j);
        if (mode == 0) accept = func_0202bb20(id) != 0;
        else accept = mode == func_0202b6cc(id);
        if (accept) {
            out->id = id;
            out->flag = 1;
            count2++;
            out++;
            count++;
        }
        j++;
    } while (j < total);
    }
    *(unsigned short *)(self + 0x8160) = count;
    *(unsigned short *)(self + 0x816a) = count2;
    return 1;
}





