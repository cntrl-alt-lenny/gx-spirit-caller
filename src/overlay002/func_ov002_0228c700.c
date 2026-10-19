extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_0227b090(int arg, int a, int b);
extern char data_ov002_022cf16c[];

int func_ov002_0228c700(int player, unsigned int mask, int filter)
{
    int list[11];
    int info[11];
    int best = -1;
    int result = -1;
    int i, shift, j, temp, slot, value;
    int count = 0;
    char *row;
    shift = player << 4;
    for (i = 0; i <= 4; i++) {
        if (mask & (1 << shift)) {
            list[count] = i;
            count++;
        }
        shift++;
    }
    for (i = count - 1; i > 0; i--) {
        j = func_ov002_021b00d0(i + 1);
        temp = list[i];
        list[i] = list[j];
        list[j] = temp;
    }
    i = 0;
    if (count > 0) {
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    do {
        slot = list[i];
        if (filter < 0 || filter == *(unsigned short *)(row + slot * 0x14 + 0x36)) {
            func_ov002_0227b090(player, slot, (int)info);
            value = *(unsigned short *)(row + slot * 0x14 + 0x36) != 0 ? info[6] : info[5];
            if (best < 0 || value > best) {
                result = slot;
                best = value;
            }
        }
        i++;
    } while (i < count);
    }
    return result;
}





