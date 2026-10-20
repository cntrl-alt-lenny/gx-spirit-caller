extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_0227b090(int arg, int a, int b);

int func_ov002_0228c584(int player, unsigned int mask, int attack, int defense)
{
    int list[11];
    int info[11];
    int best = -1;
    int result = -1;
    int i, shift, j, temp, slot, value;
    int count = 0;
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
    do {
        slot = list[i];
        value = 0;
        func_ov002_0227b090(player, slot, (int)info);
        if (attack && defense) {
            value = info[5] > info[6] ? info[5] : info[6];
        } else if (attack) {
            value = info[5];
        } else if (defense) {
            value = info[6];
        }
        if (best < 0) {
            result = slot;
            best = value;
        } else {
            int better = 0;
            if (attack > 0 && value > best) better = 1;
            if (attack < 0 && value < best) better = 1;
            if (defense > 0 && value > best) better = 1;
            if (defense < 0 && value < best) better = 1;
            if (better) {
                if (attack > 0) best = value > best ? value : best;
                if (attack < 0) best = value < best ? value : best;
                if (defense > 0) best = value > best ? value : best;
                result = slot;
                if (defense < 0) best = value < best ? value : best;
            }
        }
        i++;
    } while (i < count);
    }
    return result;
}


