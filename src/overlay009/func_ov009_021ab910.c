extern int func_020215d8(void *p);
extern int func_ov009_021ac4d0(int *o);
int func_ov009_021ab910(int *o) {
    int result = 0;
    switch (o[9]) {
    case 0:
        o[12]++;
        if (o[12] == 4) {
            *(unsigned int *)0x04000000 = (*(unsigned int *)0x04000000 & ~0x1f00) | 0x1900;
            *(unsigned int *)0x04001000 = (*(unsigned int *)0x04001000 & ~0x1f00) | 0x1800;
            o[12] = 0;
            o[9] = 1;
        }
        break;
    case 1:
        if (func_ov009_021ac4d0(o)) {
            o[12] = 0;
            o[9] = 2;
        }
        break;
    case 2:
        if (o[12] == 14) {
            *(unsigned int *)0x04000000 &= ~0x1f00;
            *(unsigned int *)0x04001000 &= ~0x1f00;
        }
        if (func_020215d8((void *)o[11]) == 0)
            result = 1;
        o[12]++;
        break;
    }
    return result;
}
