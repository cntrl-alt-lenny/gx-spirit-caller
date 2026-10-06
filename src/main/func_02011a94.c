typedef struct {
    int v[8];
} Thresholds;

extern const Thresholds data_020b4a0c;

int func_02011a94(int value) {
    Thresholds t = data_020b4a0c;
    int i = 0;

    if (value < t.v[0]) {
        return 0;
    }
    do {
        i++;
    } while (value >= t.v[i]);
    return i;
}
